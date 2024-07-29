---
title: Verifying If Digital Signatures Exist in PDF Documents
description: Learn how to check for digital signatures in a PDF document and retrieve their signing dates using RadPdfProcessing.
type: how-to
page_title: How to Verify Digital Signatures and Retrieve Signing Dates in PDFs with RadPdfProcessing
slug: verify-digital-signatures-radpdfprocessing
tags: pdfprocessing, document, processing, digital, signature, verification, sign, date
res_type: kb
ticketid: 1659606
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When working with PDF documents, it might be necessary to verify whether the document is digitally signed. This includes checking if one or more digital signatures exist and determining the dates they were signed. This KB article provides guidance on achieving this with the RadPdfProcessing library.

## Solution

To verify digital signatures in a PDF document and extract their signing dates, follow the steps below:

1. Use the [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}) to import the PDF document into a `RadFixedDocument`.

2. Check if the document is [digitally signed]({%slug radpdfprocessing-features-digital-signature%}) by searching for [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%}) objects in the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) of the document. 

3. For each `SignatureField` found, access the `Signature` property and then the `Properties` to retrieve the `TimeOfSigning`.

Here is a code snippet demonstrating these steps and including the creation of a document with digital signature as well:

```csharp
        static void Main(string[] args)
        {

            PdfFormatProvider provider = new PdfFormatProvider();
            RadFixedDocument document = provider.Import(File.ReadAllBytes("unsigned.pdf"));

            bool isSigned = CheckSignedDocument(document);
            Debug.WriteLine(isSigned.ToString());
            FormSource formSource = new FormSource();
            formSource.Size = new Size(420, 150);

            X509Certificate2 certificate = new X509Certificate2("JohnDoe.pfx", "johndoe");
            SignatureField signatureField = document.AcroForm.FormFields.Where(f => f.FieldType == FormFieldType.Signature).FirstOrDefault() as SignatureField;
            if (signatureField != null)
            {
                signatureField.Signature = new Signature(certificate);
                SignatureWidget widget = signatureField.Widgets.FirstOrDefault();
                if (widget != null)
                {
                    formSource = widget.Content.NormalContentSource;
                    FixedContentEditor ed = new FixedContentEditor(formSource);
                    ed.TextProperties.FontSize = 60;
                    ed.Position.Translate(30, 0);
                    ed.DrawText("John Doe");
                    ed.Position.Translate(0, 90);
                    ed.TextProperties.FontSize = 20;
                    ed.DrawText("Digitally signed on: " + DateTime.Now.ToString());
                    ed.Position.Translate(40, 120);
                    ed.TextProperties.FontSize = 20;
                    ed.DrawText("(Click here to view the signature info)");
                }

                document.Pages[0].Annotations.Add(widget);

                string signedDocumentFilePath = "Signed.pdf";
                File.Delete(signedDocumentFilePath);
                using (Stream output = new FileStream(signedDocumentFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite))
                {
                    provider.Export(document, output);
                }

                  isSigned = CheckSignedDocument(document);
                Debug.WriteLine(isSigned.ToString());
                Process.Start(new ProcessStartInfo() { FileName = signedDocumentFilePath, UseShellExecute = true });
            }
        }

        private static bool CheckSignedDocument(RadFixedDocument document)
        {
            bool isSigned = false;
            var signatureFields = document.AcroForm.FormFields.Where(field => field.FieldType == FormFieldType.Signature).ToList();
            if (signatureFields!=null)
            {
                foreach (var signatureField in signatureFields)
                {
                    SignatureField field = (SignatureField)signatureField;

                    if (field != null && field.Signature != null)
                    {
                        if (field.Signature==null)
                        {
                            isSigned = false;
                            break;
                        }
                        SignatureDataProperties properties = field.Signature.Properties;
                                          
                        Debug.WriteLine("Signed on: "+properties.TimeOfSigning.ToString());
                        isSigned = true;
                        break;

                    }
                }
            }
            return isSigned;
        }
```

To validate a signature, utilize the `Validate()` or `TryValidate()` methods available within the RadPdfProcessing library. Detailed information on signature validation can be found in the [Signature Validation]({%slug radpdfprocessing-features-signature-validation%}) documentation.

## See Also

- [Digital Signature Overview in RadPdfProcessing]({%slug radpdfprocessing-features-digital-signature%})
- [Signature Validation]({%slug radpdfprocessing-features-signature-validation%})
