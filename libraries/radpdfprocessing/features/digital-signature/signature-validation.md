---
title: Signature Validation
description: The digital signature feature enables you to sign and validate a PDF document. 
page_title: Signature Validation
slug: radpdfprocessing-features-signature-validation
tags: digital, signature, validate
position: 4
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

>note [PdfProcessing Validate Digital Signature Demo](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature)

The following example shows how the validation can be used:

#### **[C#] Example: Validate a field**


{{region radpdfprocessing-features-digital-signature_3}}

    RadFixedDocument document = new PdfFormatProvider().Import(stream, TimeSpan.FromSeconds(10)); // The stream containing the document
    
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



## See Also

* [Form]({%slug radpdfprocessing-model-form%})
* [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [Validate Digital Signature Demo](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature)
