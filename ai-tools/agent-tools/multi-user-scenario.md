---
title: Multi‑User AI Agent Sessions
page_title: Telerik Document Processing Agent Tools Overview
description: Telerik Document Processing Agent Tools provides document processing capabilities designed to be exposed to AI agents.
slug: agent-tools-multi-user-scenario
tags: ai, dpl, document, processing, agent, tool, telerik, user, multi
published: True
position: 2
---

# Multi‑User AI Agent Sessions

Modern AI‑driven document processing systems must reliably support multiple users, maintain strict data isolation, and enable seamless state persistence across interactions. 

>important The provided examples in this article are purposed to show a sample approach for managing the documents storage. They can be further extended according to the complete requirement of the application.

Both implementations share the same core principles:
- Strict per-user repository isolation
- Safe execution of AI tools
- Concurrency-safe session handling

## Per-User Isolated Storage

The example demonstrates how to maintain persistent document storage per user across multiple requests. Each authenticated user gets their own repository instances that persist across multiple requests within a session.
 Use this pattern when:
 - Users need to work with documents across multiple chat messages
 - You want document state to persist during a user's session
 - Different users should never see each other's documents

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

The example demonstrates a production pattern: session-isolated agents with document processing. The idea is to manage isolated agent sessions for multiple users. Each user gets their own document repositories and conversation history.

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

* [Gettings Started with DPL Agent Tools]({%slug using-nuget-keys%})
* [Overview]({%slug agent-tools-overview%})