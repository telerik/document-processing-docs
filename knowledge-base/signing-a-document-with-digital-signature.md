---
title: Signing a Document with a Digital Signature
description: Learn how to sign a PDF document with a digital signature by using the RadPdfProcessing library and an X509Certificate2 instance.
type: how-to
page_title: Signing a Document with a Digital Signature
slug: signing-a-document-with-digital-signature
position: 0
tags: radpdfprocessing, pdf, signature, digital, certificate, document, processing, sign
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| R1 2022 Service Pack 1 | RadPdfProcessing | [Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov) |

## Description

This article describes how to sign a document with a digital signature by using the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}).

## Solution

To sign a PDF file with the [RadPdfProcessing]({%slug radpdfprocessing-overview%}) library, you need an instance of the `System.Security.Cryptography.X509Certificates.`[X509Certificate2](https://learn.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.x509certificate2) class. One way to create such an instance is to provide the path to a PFX file and the password in an `X509Certificate2` constructor, as shown in the following example.

```csharp

	PdfFormatProvider provider = new PdfFormatProvider();
	RadFixedDocument document = ImportDocument();
	string certificateFilePath = "Resources/JohnDoe.pfx";
	string certificateFilePassword = "johndoe";

	// Define the certificate which will be used for the signing. 
	X509Certificate2 certificate =
		new X509Certificate2(certificateFilePath, certificateFilePassword);

	// The name of the signature must be unique. 
	string signatureName = "SampleSignature";

	// This is the Form XObject element that represents the contents of the signature field. 
	Form form = new Form();
	form.FormSource = new FormSource();
	form.FormSource.Size = new Size(120, 120);

	// We will use the editor to fill the Form XObject. 
	FixedContentEditor formEditor = new FixedContentEditor(form.FormSource);
	formEditor.DrawCircle(new Point(50, 50), 20);
	formEditor.DrawText(signatureName);

	// The Signature object is added to a signature field, so we can add a visualization to it. 
	SignatureField signatureField = new SignatureField(signatureName);
	signatureField.Signature = new Signature(certificate);

	// The widget contains the Form XObject and defines the appearance of the signature field. 
	SignatureWidget widget = signatureField.Widgets.AddWidget();
	widget.Rect = new Rect(new Point(200, 600), new Size(100, 100));
	widget.Border = new AnnotationBorder(100, AnnotationBorderStyle.Solid, null);
	widget.Content.NormalContentSource = form.FormSource;

	// The Widget class inherits from Annotation. And, as any other annotation, must be added to the respective collection of the page. 
	RadFixedPage page = document.Pages.AddPage();
	page.Annotations.Add(widget);
	document.AcroForm.FormFields.Add(signatureField);

	// Add Signature flags
	document.AcroForm.SignatureFlags = SignatureFlags.AppendOnly;
 
```

Other approaches provided by the **.NET Framework API** also allow you to get an `X509Certificate2` class instance. The following code snippet shows how to get an `X509Certificate2` class instance from an external device (for example, a **USB token** or hardware security module (**HSM**)) by using the .NET Framework API:

```csharp

	X509Store store = new X509Store(StoreLocation.CurrentUser);
	store.Open(OpenFlags.ReadOnly);
	X509Certificate2Collection sel = X509Certificate2UI.SelectFromCollection(store.Certificates, null, null, X509SelectionFlag.SingleSelection);

	X509Certificate2 cert = sel[0];

```

## See Also

* [How to Create Invisible Signatures for PDF Documents]({%slug pdf-invisible-signatures%}) 
* [Verifying If Digital Signatures Exist in PDF Documents]({%slug verify-digital-signatures-radpdfprocessing%})

