---
title: Signature Validation
description: The digital signature feature enables you to sign and validate a PDF document. 
page_title: Signature Validation
slug: radpdfprocessing-features-signature-validation
tags: digital, signature, validate
position: 1
---

## Validating a Signature

The validation is performed for the current field and, since it strongly depends on the file bytes of the document, against the state of the document at the moment of importing.

The Signature class exposes two methods that allow you to validate a signature:

* **Validate()**: The method accepts a parameter of type SignatureValidationProperties. The method uses these properties while validating the signature. The **SignatureValidationProperties** class exposes the following properties:
	*  **Chain**: Gets or sets the chain used to validate the certificate that signed the digital signature. It is of type [X509Chain](https://msdn.microsoft.com/en-us/library/system.security.cryptography.x509certificates.x509chain(v=vs.110).aspx).
	*  **ChainStatusFlags**: Gets or sets the chain status flags that describe the used signature certificate as invalid. It is of type [X509ChainStatusFlags](https://msdn.microsoft.com/en-us/library/system.security.cryptography.x509certificates.x509chainstatusflags(v=vs.110).aspx).
	
	Validate() returns an object of type [SignatureValidationResult](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.SignatureValidationResult.html).


* **TryValidate()**: This method returns a boolean value indicating whether the validation succeeded or not. There are two overloads of this method. The first one accepts an out parameter containing a [SignatureValidationResult](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.SignatureValidationResult.html) object and second one allows you to also pass **SignatureValidationProperties**.

>important The validation requires that the stream, from which the document is imported, to be opened. The validation is performed for the current field and against the state of the document at the moment of importing.

The following example shows how the validation can be used:

#### **[C#] Example: Validate a field**


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

>To evaluate a certificate as trusted, it must be added to the [trusted certificates on your machine](https://docs.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in).

## Signature Encodings

RadPdfProcessing enables you to sign and validate signature fields using standard signature encodings:

* adbe.x509.rsa_sha1 (PKCS #1)

* adbe.pkcs7.sha1 (PKCS #7)

* adbe.pkcs7.detached (PKCS #7 Detached)

## Signature Flags

The signature flags were introduced in R2022 SP1. You can set the flags with the following code:

#### **[C#] Example: Set signature flags**

{{region radpdfprocessing-features-digital-signature_5}}
	
	pdfDocument.AcroForm.SignatureFlags = SignatureFlags.None;

{{endregion}}

The possible values are: 
* __None__
* __SignaturesExist:__ If set, the document contains at least one signature field.
* __AppendOnly:__ The document contains signatures that may be invalidated if the file is saved in a way that alters its previous contents.

## Limitations

There are a few limitations related to the usage of digital signatures in RadPdfProcessing.

* Exporting a document that is signed must be done using a stream that supports reading.

* The validation of a signature depends on the bytes representing the document. Thus, to validate a signature, the stream used to import the document must be still open.

* The validation is always performed for the current field, against the state of the document at the moment of importing.

* At this point, RadPdfProcessing supports only the signing of a document that does not contain a signed signature field. Signing a document containing a signed signature field will result in invalidation and corruption of the existing signature.

* RadPdfProcessing currently supports only the signing of a single signature field. Signing more than one signature field will result in the invalidation of all signatures except the last one.

## See Also

* [Form]({%slug radpdfprocessing-model-form%})
* [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
