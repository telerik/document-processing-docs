---
title: Multi‑User AI Agent Sessions
page_title: Agent Tools Multi‑User AI Agent Sessions
description: Learn how to implement secure multi-user document processing with AI agents, including per-user repository isolation, session management, and production-ready patterns for web APIs and desktop applications.
slug: agent-tools-multi-user-scenario
tags: ai, dpl, document, processing, agent, tool, telerik, excel, pdf, word, docx, pdf, xlsx, multi, user, session
published: True
position: 2
---

# Multi‑User AI Agent Sessions

When building AI-powered document processing applications that serve multiple users, proper isolation and session management are critical. This article demonstrates production-ready patterns for managing multi-user scenarios where each user interacts with their own set of documents through AI agents.

In single-user applications, you can create document repositories once and use them throughout the application lifecycle. However, in multi-user environments—such as web applications, SaaS platforms, or enterprise systems—you must ensure that:

* Each user's documents remain isolated and inaccessible to other users
* Document state persists appropriately across user interactions
* Concurrent requests from multiple users are handled safely
* Resources are properly managed and cleaned up

### Risks and Mitigation

Multi-user document processing systems face several critical risks:

**Data Leakage Between Users**: Without proper isolation, one user could inadvertently access or modify another user's documents. This is mitigated by creating separate repository instances for each user and binding AI tools to user-specific repositories.

**Session Confusion**: In stateless HTTP environments, requests from different users could interfere with each other if document state is shared. This is prevented by associating repositories with authenticated user identities and maintaining per-user sessions.

**Resource Exhaustion**: Long-running sessions or abandoned user data can consume memory and storage. This is addressed through session cleanup policies, idle timeout mechanisms, and proper resource disposal.

**Concurrent Access Issues**: Multiple simultaneous requests from the same user or different users require thread-safe repository management. This is handled using thread-safe collection types like `ConcurrentDictionary` for session storage.

### Approaches Covered

1. **[Per-User Isolated Storage](#per-user-isolated-storage)**: A stateful controller pattern for web APIs where each authenticated user gets persistent document repositories that survive across multiple HTTP requests within their session.

2. **[Multi-User Agentic Application](#multi-user-agentic-application)**: A standalone application pattern that manages multiple user agent sessions, each with isolated repositories and conversation history, suitable for desktop applications or microservices.

Both implementations share the same core principles:
- Strict per-user repository isolation
- Safe execution of AI tools
- Concurrency-safe session handling

>important The provided examples in this article are purposed to show a sample approach for managing the documents storage. They can be further extended according to the complete requirement of the application.

## Per-User Isolated Storage

This example implements a production-ready ASP.NET Core controller that addresses all four risks identified earlier:

* **Preventing Data Leakage**: The `DocumentChatController` extracts the authenticated user ID from each HTTP request (`User.FindFirst(ClaimTypes.NameIdentifier)`) and retrieves or creates a session specifically for that user. Agent tools are instantiated with repositories from that user's session only, ensuring documents are never shared across users.

* **Avoiding Session Confusion**: The `UserSessionManager` uses a `ConcurrentDictionary<string, UserSession>` to maintain isolated sessions keyed by user ID. Each HTTP request—even if stateless—retrieves the same session for the same authenticated user, providing stateful behavior across multiple requests.

* **Managing Resource Exhaustion**: The `SessionCleanupService` background service runs every 15 minutes to identify and remove sessions that haven't been accessed in the past 2 hours. This prevents indefinite memory growth from abandoned sessions.

* **Handling Concurrent Access**: The `ConcurrentDictionary` ensures thread-safe session storage and retrieval, allowing multiple users to make simultaneous requests without race conditions. The `LastAccessedAt` timestamp is updated atomically on each access.

The implementation provides three HTTP endpoints: `POST /chat` for processing messages, `GET /documents` for listing user documents, and `DELETE /documents` for clearing user data. The `[Authorize]` attribute ensures all endpoints require authentication.

```csharp
using System.Collections.Concurrent;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.AI;
using Telerik.Documents.AI.AgentTools.Spreadsheet;
using Telerik.Documents.AI.AgentTools.Fixed;
using Telerik.Documents.AI.Tools.Spreadsheet.Core;
using Telerik.Documents.AI.Tools.Fixed.Core;

namespace Telerik.Documents.AI.AgentTools.Examples;

/// <summary>
/// Example: Controller with per-user document isolation
/// </summary>
[ApiController]
[Route("api/[controller]")]
[Authorize] // Requires authentication
public class DocumentChatController : ControllerBase
{
    private readonly IChatClient _chatClient;

    public DocumentChatController(IChatClient chatClient)
    {
        _chatClient = chatClient;
    }

    /// <summary>
    /// Process a chat message with document tools.
    /// Each user has isolated document repositories.
    /// </summary>
    [HttpPost("chat")]
    public async Task<IActionResult> Chat([FromBody] ChatRequest request)
    {
        // ============================================================
        // STEP 1: Get user identity from your auth system
        // ============================================================
        var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (string.IsNullOrEmpty(userId))
            return Unauthorized();

        // ============================================================
        // STEP 2: Get or create user-specific repositories
        // These persist across requests for the same user
        // ============================================================
        var session = UserSessionManager.GetOrCreateSession(userId);

        // ============================================================
        // STEP 3: Create tools with THIS user's repositories
        // ============================================================
        var spreadsheetReadTools = new SpreadProcessingReadAgentTools(session.WorkbookRepository);
        var spreadsheetWriteTools = new SpreadProcessingWriteAgentTools(session.WorkbookRepository);
        var pdfContentTools = new FixedDocumentContentAgentTools(session.PdfRepository);

        var allTools = spreadsheetReadTools.GetTools()
            .Concat(spreadsheetWriteTools.GetTools())
            .Concat(pdfContentTools.GetTools())
            .ToList();

        // ============================================================
        // STEP 4: Process with AI
        // ============================================================
        var toolClient = new FunctionInvokingChatClient(_chatClient);
        var response = await toolClient.GetResponseAsync(
            request.Message,
            new ChatOptions { Tools = allTools });

        return Ok(new ChatResponse { Message = response.Text });
    }

    /// <summary>
    /// List documents in the current user's repository.
    /// </summary>
    [HttpGet("documents")]
    public IActionResult ListDocuments()
    {
        var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (string.IsNullOrEmpty(userId))
            return Unauthorized();

        var session = UserSessionManager.GetOrCreateSession(userId);

        var documents = new
        {
            spreadsheets = session.WorkbookRepository.ListDocuments().Select(d => d.Id),
            pdfs = session.PdfRepository.ListDocuments().Select(d => d.Id)
        };

        return Ok(documents);
    }

    /// <summary>
    /// Clear all documents for the current user.
    /// </summary>
    [HttpDelete("documents")]
    public IActionResult ClearDocuments()
    {
        var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (string.IsNullOrEmpty(userId))
            return Unauthorized();

        UserSessionManager.ClearSession(userId);
        return Ok(new { message = "All documents cleared" });
    }

    /// <summary>
    /// End the user's session and clean up resources.
    /// </summary>
    [HttpPost("logout")]
    public IActionResult Logout()
    {
        var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (string.IsNullOrEmpty(userId))
            return Unauthorized();

        UserSessionManager.ClearSession(userId);

        // Optionally clean up user's files
        var userDataDir = Path.Combine("UserData", userId);
        if (Directory.Exists(userDataDir))
        {
            Directory.Delete(userDataDir, recursive: true);
        }

        return Ok(new { message = "Session ended" });
    }
}

/// <summary>
/// Manages user sessions with their associated document repositories.
/// Thread-safe for concurrent access.
/// </summary>
public static class UserSessionManager
{
    private static readonly ConcurrentDictionary<string, UserSession> _sessions = new();

    /// <summary>
    /// Gets an existing session or creates a new one for the user.
    /// </summary>
    public static UserSession GetOrCreateSession(string userId)
    {
        var session = _sessions.GetOrAdd(userId, _ => new UserSession
        {
            UserId = userId,
            WorkbookRepository = new InMemoryWorkbookRepository(),
            PdfRepository = new InMemoryFixedDocumentRepository(),
            CreatedAt = DateTime.UtcNow,
            LastAccessedAt = DateTime.UtcNow
        });
        
        // Update last accessed time on every access
        session.LastAccessedAt = DateTime.UtcNow;
        return session;
    }

    /// <summary>
    /// Clears and removes a user's session.
    /// </summary>
    public static void ClearSession(string userId)
    {
        if (_sessions.TryRemove(userId, out var session))
        {
            session.Dispose();
        }
    }

    /// <summary>
    /// Cleans up sessions that haven't been accessed recently.
    /// Call this periodically (e.g., from a background service).
    /// </summary>
    public static void CleanupStaleSessions(TimeSpan maxIdleTime)
    {
        var cutoff = DateTime.UtcNow - maxIdleTime;
        var staleUserIds = _sessions
            .Where(kvp => kvp.Value.LastAccessedAt < cutoff)
            .Select(kvp => kvp.Key)
            .ToList();

        foreach (var userId in staleUserIds)
        {
            ClearSession(userId);
        }
    }
}

/// <summary>
/// Represents a user's session with their isolated document repositories.
/// </summary>
public class UserSession : IDisposable
{
    public string UserId { get; init; } = string.Empty;
    public IWorkbookRepository WorkbookRepository { get; init; } = null!;
    public IFixedDocumentRepository PdfRepository { get; init; } = null!;
    public DateTime CreatedAt { get; init; }
    public DateTime LastAccessedAt { get; set; }

    public void Dispose()
    {
        // Dispose repositories if they implement IDisposable
        (WorkbookRepository as IDisposable)?.Dispose();
        (PdfRepository as IDisposable)?.Dispose();
    }
}

/// <summary>
/// Background service to clean up stale user sessions.
/// Register in DI: services.AddHostedService&lt;SessionCleanupService&gt;();
/// </summary>
public class SessionCleanupService : BackgroundService
{
    private readonly TimeSpan _cleanupInterval = TimeSpan.FromMinutes(15);
    private readonly TimeSpan _maxIdleTime = TimeSpan.FromHours(2);

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        while (!stoppingToken.IsCancellationRequested)
        {
            await Task.Delay(_cleanupInterval, stoppingToken);
            UserSessionManager.CleanupStaleSessions(_maxIdleTime);
        }
    }
}

/// <summary>
/// Chat request model.
/// </summary>
public class ChatRequest
{
    public string Message { get; set; } = string.Empty;
}

/// <summary>
/// Chat response model.
/// </summary>
public class ChatResponse
{
    public string Message { get; set; } = string.Empty;
}
```

## Multi-User Agentic Application

This example implements a self-contained multi-user agent system that addresses the same risks with a different architectural approach:

* **Preventing Data Leakage**: Each `UserAgentSession` is created with its own dedicated `WorkbookRepository` and `PdfRepository` instances. Agent tools are bound to these repositories in the session constructor and cannot access documents from other sessions. The `MultiUserAgentApplication` manages the isolation through a session-per-user model.

* **Avoiding Session Confusion**: Unlike the web API pattern that relies on HTTP authentication, this pattern uses explicit user identification through the `GetSession(userId)` method. Each session maintains its own complete conversation history (`_history`) and tool collection, ensuring context never bleeds between users.

* **Managing Resource Exhaustion**: While this pattern doesn't include automatic cleanup (since it's designed for scenarios where session lifecycle is explicitly managed), it provides `EndSession(userId)` for explicit cleanup and `Dispose()` methods on sessions. Applications using this pattern should implement their own timeout logic based on their specific requirements.

* **Handling Concurrent Access**: The `ConcurrentDictionary<string, UserAgentSession>` in `MultiUserAgentApplication` ensures thread-safe session management. Multiple users can interact with their sessions simultaneously, and the `FunctionInvokingChatClient` wrapper handles tool execution safely.

The `UserAgentSession` class encapsulates the complete agent experience: repositories, conversation history (system message + all interactions), and tools. It provides both synchronous (`ChatAsync`) and streaming (`ChatStreamingAsync`) interaction methods, making it suitable for rich conversational applications. The `GetHistory()` and `ClearHistory()` methods give applications control over conversation context management.

```csharp
using System.Collections.Concurrent;
using Microsoft.Extensions.AI;
using Telerik.Documents.AI.AgentTools.Spreadsheet;
using Telerik.Documents.AI.AgentTools.Fixed;
using Telerik.Documents.AI.Tools.Spreadsheet.Core;
using Telerik.Documents.AI.Tools.Fixed.Core;

namespace Telerik.Documents.AI.AgentTools.Examples;

/// <example>
/// <code>
/// var app = new MultiUserAgentApplication(chatClient);
/// var session = app.GetSession("user-123");
/// var response = await session.ChatAsync("Load budget.xlsx");
/// </code>
/// </example>
public class MultiUserAgentApplication
{
    private readonly IChatClient _sharedLlm;
    private readonly ConcurrentDictionary<string, UserAgentSession> _sessions = new();

    public MultiUserAgentApplication(IChatClient llm)
    {
        _sharedLlm = llm;
    }

    /// <summary>
    /// Gets an existing session or creates a new isolated session for the user.
    /// </summary>
    public UserAgentSession GetSession(string userId)
    {
        return _sessions.GetOrAdd(userId, id => new UserAgentSession(id, _sharedLlm));
    }

    /// <summary>
    /// Ends a user's session and releases resources.
    /// </summary>
    public void EndSession(string userId)
    {
        if (_sessions.TryRemove(userId, out var session))
        {
            session.Dispose();
        }
    }

    /// <summary>
    /// Gets all active session user IDs.
    /// </summary>
    public IEnumerable<string> GetActiveSessions() => _sessions.Keys;
}

/// <summary>
/// Isolated agent session for a single user.
/// Contains user-specific document repositories and conversation history.
/// </summary>
public class UserAgentSession : IDisposable
{
    public string UserId { get; }

    // Isolated document repositories
    public IWorkbookRepository WorkbookRepository { get; }
    public IFixedDocumentRepository PdfRepository { get; }

    private readonly List<ChatMessage> _history;
    private readonly List<AITool> _tools;
    private readonly IChatClient _llm;

    public UserAgentSession(string userId, IChatClient llm)
    {
        UserId = userId;
        _llm = new FunctionInvokingChatClient(llm);  // Wrap to enable tool execution
        _history = new List<ChatMessage>();

        // Create isolated repositories
        WorkbookRepository = new InMemoryWorkbookRepository();
        PdfRepository = new InMemoryFixedDocumentRepository();

        // Create tools bound to this user's repositories
        _tools = new SpreadProcessingReadAgentTools(WorkbookRepository).GetTools()
            .Concat(new SpreadProcessingWriteAgentTools(WorkbookRepository).GetTools())
            .Concat(new FixedDocumentContentAgentTools(PdfRepository).GetTools())
            .ToList();

        _history.Add(new ChatMessage(ChatRole.System,
            "You are a document processing assistant. You can work with Excel spreadsheets and PDF documents."));
    }

    /// <summary>
    /// Sends a message and returns the agent's response.
    /// </summary>
    public async Task<string> ChatAsync(string message)
    {
        _history.Add(new ChatMessage(ChatRole.User, message));

        var response = await _llm.GetResponseAsync(_history, new ChatOptions { Tools = _tools });

        _history.Add(new ChatMessage(ChatRole.Assistant, response.Text));
        return response.Text;
    }

    /// <summary>
    /// Sends a message and streams the agent's response.
    /// </summary>
    public async IAsyncEnumerable<string> ChatStreamingAsync(string message)
    {
        _history.Add(new ChatMessage(ChatRole.User, message));

        var fullResponse = new System.Text.StringBuilder();

        await foreach (var update in _llm.GetStreamingResponseAsync(_history, new ChatOptions { Tools = _tools }))
        {
            if (!string.IsNullOrEmpty(update.Text))
            {
                fullResponse.Append(update.Text);
                yield return update.Text;
            }
        }

        _history.Add(new ChatMessage(ChatRole.Assistant, fullResponse.ToString()));
    }

    /// <summary>
    /// Gets the conversation history.
    /// </summary>
    public IReadOnlyList<ChatMessage> GetHistory() => _history.AsReadOnly();

    /// <summary>
    /// Clears conversation history while preserving the system message.
    /// </summary>
    public void ClearHistory()
    {
        var systemMessage = _history.FirstOrDefault(m => m.Role == ChatRole.System);
        _history.Clear();
        if (systemMessage != null)
        {
            _history.Add(systemMessage);
        }
    }

    public void Dispose()
    {
        // Repositories are garbage collected; override to clean up temp files if needed
    }
}
```

## See Also

* [Getting Started with DPL Agent Tools]({%slug agent-tools-getting-started%})
* [Overview]({%slug agent-tools-overview%})