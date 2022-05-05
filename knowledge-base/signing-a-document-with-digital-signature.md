---
title: Signing a document with a digital signature
description: Learn how to sign a PDF document with a digital signature using the API of PdfProcessing.
type: how-to
page_title: Signing a document with a digital signature
slug: signing-a-document-with-digital-signature
position: 0
tags: pdf, sign, digital, signature, HSM, USB, certificate, X509Certificate2
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>R1 2022 Service Pack 1</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

How to sign a document with a digital signature using [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}).

## Solution

In order to sign a **PDF** file with the [PdfProcessing]({%slug radpdfprocessing-overview%}) library, you need an instance of the _System.Security.Cryptography.X509Certificates.[X509Certificate2](https://docs.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.x509certificate2)_ class. One way to create such an instance is to provide the path to a PFX file and the password in an X509Certificate2 constructor, as in the provided example.

#### __C#__

{{region kb-signing-a-document-with-digital-signature1}}

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
 
{{endregion}}

However, there are other approaches provided by the **.Net Framework API** that allow you to get an X509Certificate2 class instance. The following code snippet demonstrates a possible approach for getting an X509Certificate2 class instance from a external devise (e.g. **USB token** or hardware security module (**HSM**)) using .Net Framework API:

#### __C#__

{{region kb-signing-a-document-with-digital-signature1}}

	X509Store store = new X509Store(StoreLocation.CurrentUser);
	store.Open(OpenFlags.ReadOnly);
	X509Certificate2Collection sel = X509Certificate2UI.SelectFromCollection(store.Certificates, null, null, X509SelectionFlag.SingleSelection);

	X509Certificate2 cert = sel[0];

{{endregion}}

