---
title: Digital Signature
page_title: Digital Signature
description: Digital Signature
slug: radpdfprocessing-features-digital-signature
tags: digital, signature
position: 6
platforms: ajax, mvc, wpf, winforms
---

# Digital Signature

This article covers the following topics:

* [What is Digital Signature?](#what-is-digital-signature)

* [Signing a Document](#signing-a-document)

* [Signature Encodings](#signature-encodings)

* [Validating a Signature](#validating-a-signature)

* [Limitations](#limitations)


## What is Digital Signature?

The digital signature feature enables you to sign and validate a PDF document. A signature confirms that the document content originated from the signer and has not been modified in any way.

In the PDF document model, the validation is performed per signature. A signed document is considered valid when it has not been changed after the signing and all of its certificates have a valid trusted root certificate.

>In PdfProcessing for Xamarin you can add SignatureField but can not sign or import signed documents.

## Signing a Document

The signing is done through the **Signature** object. The constructor of the Signature class takes a [X509Certificate2](https://msdn.microsoft.com/en-us/library/system.security.cryptography.x509certificates.x509certificate2(v=vs.110).aspx) object as a parameter. This is the certificate that will be used to sign the PDF document.

#### **[C#] Example 1: Create a Signature object**

{{region radpdfprocessing-features-digital-signature_0}}

	System.Security.Cryptography.X509Certificates.X509Certificate2 certificate = new System.Security.Cryptography.X509Certificates.X509Certificate2(certificateFilePath, password);
	Signature signature = new Signature(certificate);
{{endregion}}

When instantiated, the signature should be added to the document content using the [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%}).

#### **[C#] Example 2: Add signature to a signature field**

{{region radpdfprocessing-features-digital-signature_1}}

    SignatureField signatureField = new SignatureField("Signature Name");
    signatureField.Signature = signature;
{{endregion}}

In addition, to create a signature, which has a visual representation, you will need to associate a **Widget** annotation with the signed [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%}) through the Widget constructor. The widget will also need a [FormSource]({%slug radpdfprocessing-model-formsource%}) object to be applied to its Content.NormalContentSource property. A FormSource could be filled with data using the FixedContentEditor.

>important When saving a document that is digitally signed, the stream used to export the document must support reading.


**Example 3** shows the full code for simple signing of a document.

#### **[C#] Example 3: Sign a document**

{{region radpdfprocessing-features-digital-signature_2}}

	// Define the certificate which will be used for the signing.
	System.Security.Cryptography.X509Certificates.X509Certificate2 certificate = new System.Security.Cryptography.X509Certificates.X509Certificate2(certificateFilePath, certificateFilePassword);

	// The name of the signature must be unique.
	string signatureName = "SampleSignature";

	// This is the Form XObject element that represents the contents of the signature field. 
	Form form = new Form();
	form.FormSource = new FormSource();
	form.FormSource.Size = new Size(220, 220);

	// We will use the editor to fill the Form XObject. 
	FixedContentEditor formEditor = new FixedContentEditor(form.FormSource);
	form.Position.Translate(10, 10);
	formEditor.DrawCircle(new Point(50, 50), 20);
	formEditor.DrawText(signatureName);

	// The Signature object is added to a signature field, so we can add a visualization to it. 
	SignatureField signatureField = new SignatureField(signatureName);
	signatureField.Signature = new Signature(certificate);

	// The widget contains the Form XObject and defines the appearance of the signature field. 
	SignatureWidget widget = signatureField.Widgets.AddWidget();
	widget.Rect = new Rect(new Point(200, 600), new Size(100, 100));
	widget.Border = new AnnotationBorder(10, AnnotationBorderStyle.Solid, null);
	widget.Content.NormalContentSource = form.FormSource;
	widget.RecalculateContent();

	// The Widget class inherits from Annotation. And, as any other annotation, must be added to the respective collection of the page. 

	RadFixedDocument document = new RadFixedDocument();
	RadFixedPage page = document.Pages.AddPage();
	page.Annotations.Add(widget);

	var editor = new FixedContentEditor(page);
	editor.Position.Translate(200, 400);
	editor.DrawForm(form.FormSource);
	document.AcroForm.FormFields.Add(signatureField);
	widget.RecalculateContent();
	widget.AppearanceCharacteristics.Background = new Telerik.Windows.Documents.Fixed.Model.ColorSpaces.RgbColor(255, 0, 0);

	using (Stream stream = File.OpenWrite("signed.pdf"))
	{
	    new PdfFormatProvider().Export(document, stream);
	}
{{endregion}}


## Signature Encodings

RadPdfProcessing enables you to sign and validate signature fields using standard signature encodings. Following is a list of them:

* adbe.x509.rsa_sha1 (PKCS #1)

* adbe.pkcs7.sha1 (PKCS #7)

* adbe.pkcs7.detached (PKCS #7 Detached)



## Validating a Signature

The validation is performed for the current field and, since it strongly depends on the file bytes of the document, against the state of the document in the moment of importing.

The Signature class exposes two methods allowing you to validate a signature:

* **Validate()**: The method accepts a parameter of type SignatureValidationProperties which uses while validating the signature. The **SignatureValidationProperties** class exposes the following properties:
	*  **Chain**: Gets or sets the chain used to validate the certificate that signed the digital signature. It is of type [X509Chain](https://msdn.microsoft.com/en-us/library/system.security.cryptography.x509certificates.x509chain(v=vs.110).aspx).
	*  **ChainStatusFlags**: Gets or sets the chain status flags which describes the used signature certificate as invalid. It is of type [X509ChainStatusFlags](https://msdn.microsoft.com/en-us/library/system.security.cryptography.x509certificates.x509chainstatusflags(v=vs.110).aspx).
	
	Validate() returns object of type [SignatureValidationResult](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.SignatureValidationResult.html).


* **TryValidate()**: This method returns a boolean value indicating whether the validation succeeded or not. There are two overloads of this method. The first one accepts an out parameter containing a [SignatureValidationResult](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.SignatureValidationResult.html) object and second one allows you to also pass **SignatureValidationProperties**.

>important Note, that the validation requires that the stream, from which the document is imported, to be opened. The validation is performed for the current field, and against the state of the document in the moment of importing.

**Example 4** shows how the validation can be used.

#### **[C#] Example 4: Validate a field**


{{region radpdfprocessing-features-digital-signature_3}}

    RadFixedDocument document = new PdfFormatProvider().Import(stream); // The stream containing the document

    string validationStatus;

    // For simplicity, the example handles only the first signature.
    SignatureField firstSignatureField = document.AcroForm.FormFields.FirstOrDefault(field => field.FieldType == FormFieldType.Signature) as SignatureField;
    if (firstSignatureField != null && firstSignatureField.Signature != null)
    {
        SignatureValidationProperties properties = new SignatureValidationProperties();
        System.Security.Cryptography.X509Certificates.X509VerificationFlags verificationFlags = System.Security.Cryptography.X509Certificates.X509VerificationFlags.IgnoreInvalidName;
        properties.Chain.ChainPolicy.VerificationFlags = verificationFlags;

        SignatureValidationResult validationResult;
        if (firstSignatureField.Signature.TryValidate(properties, out validationResult))
        {
            if (!validationResult.IsDocumentModified)
            {
                if (validationResult.IsCertificateValid)
                {
                    validationStatus = "Valid";
                }
                else
                {
                    validationStatus = "Unknown";
                }
            }
            else
            {
                validationStatus = "Invalid";
            }
        }
        else
        {
            validationStatus = "Invalid";
        }
    }
    else
    {
        validationStatus = "None";
    }
{{endregion}}

>To evaluate a certificate as trusted one, it must be added to the [trusted certificates on your machine](https://docs.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in).

## Limitations

There are few limitations related to the usage of digital signature in RadPdfProcessing.

* Exporting a document that is signed must be done using a stream that supports reading.

* The validation of a signature depends on the bytes representing the document. Thus, to validate a signature, the stream used to import the document must be still open.

* The validation is always performed for the current field, against the state of the document in the moment of importing.

* At this point, RadPdfProcessing supports only signing of a document that does not contain signed signature field. Signing a document containing a signed signature field will result in invalidation and corruption of the existing signature.

* RadPdfProcessing currently supports only signing of a single signature field. Signing more than one signature field will result in invalidation of all signatures except the last one.

## See Also

* [Form]({%slug radpdfprocessing-model-form%})
* [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [Signature API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.Signature.html)
