<style>
article {
  background: transparent !important;
}

div.contribution-panel {
  display: none;
}

blockquote {
  border: 0;
  margin: 20px 0;
  min-height: 70px;
  padding: 24px 80px;
  background-color: #f9edc6;
  background-image: url("/devtools/document-processing/assets/important-icon.svg");
  color: #fff;
  background-repeat: no-repeat;
  background-size: 48px;
  background-position: center;
  background-position-x: 16px;
  background-position-y: 50%;
  color: #000000; }
  blockquote:not(.alert-note) a, blockquote:not(.alert-note) a:link {
    color: #000000;
    text-decoration: underline; }
    blockquote:not(.alert-note) a:hover, blockquote:not(.alert-note) a:active, blockquote:not(.alert-note) a:focus, blockquote:not(.alert-note) a:link:hover, blockquote:not(.alert-note) a:link:active, blockquote:not(.alert-note) a:link:focus {
      color: #000000;
      text-decoration: none !important; }
  blockquote p:first-child,
  blockquote ul:first-child,
  blockquote ol:first-child {
    margin-top: 0; }
  blockquote p:last-child,
  blockquote ul:last-child,
  blockquote ol:last-child {
    margin-bottom: 0; }
  blockquote.disclaimer {
    background-color: #eaebec;
    color: #4f5d6c; }
    blockquote.disclaimer p:first-child {
      color: #36393f; }
  blockquote.alert-note {
    margin-top: 2em;
    margin-bottom: 2em;
    background-color: #eaebec;
    color: #4f5d6c; }
  blockquote.important {
    background-color: #f9edc6;
    background-image: url("/devtools/document-processing/assets/important-icon.svg"); }
  blockquote.caution {
    background-color: #f7e1df;
    background-image: url("/devtools/document-processing/assets/caution-icon.svg"); }
  blockquote.tip {
    background-color: #e4f1df;
    background-image: url("/devtools/document-processing/assets/tip-icon.svg"); }


article:not(.api-reference)>p:first-child, article:not(.api-reference) h1+p {
  font-size: 18px;
  font-weight: 300;
  line-height: 24px;
  margin-top: 15px;
  margin-bottom: 20px;
  font-family: "Roboto", Helvetica, Arial, sans-serif;
  color: #8a959f;
}

@media (min-width: 768px) {
  article:not(.api-reference)>p:first-child, article:not(.api-reference) h1+p {
    font-size: 22px;
    line-height: 28px;
  }
}

@media (min-width: 1025px) {
  article:not(.api-reference)>p:first-child, article:not(.api-reference) h1+p {
    font-size: 26px;
    line-height: 32px;
  }
}

</style>

# API Reference Overview

The API reference section of the documentation contains a list and descriptions of all public available classes, methods and properties of the Telerik Document Processing product.

> This documentation refers to the latest version of Telerik Document Processing libraries.


The following tables list the most used members of the different libraries.

## RadWordsProcessing

<table>
    <tbody>
        <tr>
            <th><span style="font-weight: bold;">Namespace</span></th>
            <th><span style="font-weight: bold;">Class Name</span></th>
            <th><span style="font-weight: bold;">Description</span></th>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.html">Telerik.Windows.Documents.Flow.Model</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.RadFlowDocument.html">RadFlowDocument</a></td>
            <td>The root object of the library, representing the document.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Editing">Telerik.Windows.Documents.Flow.Model.Editing</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Editing.RadFlowDocumentEditor.html">RadFlowDocumentEditor</a></td>
            <td>Provides methods that allow you to easily modify a RadFlowDocument.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.html">Telerik.Windows.Documents.Flow.Model</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Section.html">Section</a>, <a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Table.html">Table</a>, <a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Paragraph.html">Paragraph</a>, <a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Run.html">Run</a></td>
            <td>Describe document elements.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.FormatProviders.Docx">Telerik.Windows.Documents.Flow.FormatProviders.Docx</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider.html">DocxFormatProvider</a></td>
            <td>Exposes members for importing and exporting DOCX documents.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.FormatProviders.Html.html">Telerik.Windows.Documents.Flow.FormatProviders.Html</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider.html">HtmlFormatProvider</a></td>
            <td><span style="font-weight: 400; font-style: normal;">Exposes members for importing and exporting HTML documents.</span></td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.FormatProviders.Pdf.html">Telerik.Windows.Documents.Flow.FormatProviders.Pdf</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider.html">PdfFormatProvider</a></td>
            <td>Exposes members for exporting PDF documents.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.FormatProviders.Rtf.html">Telerik.Windows.Documents.Flow.FormatProviders.Rtf</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider.html">RtfFormatProvider</a></td>
            <td>Exposes members for importing and exporting RTF documents.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.FormatProviders.Txt.html">Telerik.Windows.Documents.Flow.FormatProviders.Txt</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.FormatProviders.Txt.TxtFormatProvider.html">TxtFormatProvider</a></td>
            <td>Exposes members for importing and exporting plain text documents.</td>
        </tr>
    </tbody>
</table>

## RadPdfProcessing

<table>
    <tbody>
        <tr>
            <th><span style="font-weight: bold;">Namespace</span></th>
            <th><span style="font-weight: bold;">Class Name</span></th>
            <th><span style="font-weight: bold;">Description</span></th>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.html">Telerik.Windows.Documents.Fixed.Model</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.RadFixedDocument.html">RadFixedDocument</a></td>
            <td>The root object of the library, representing the document.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.html"><span style="font-weight: 400; font-style: normal; text-decoration: none;">Telerik.Windows.Documents.Fixed.Model</span></a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.RadFixedPage.html">RadFixedPage</a></td>
            <td>Represents a page of the document.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.html">Telerik.Windows.Documents.Fixed.Model.Editing</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.RadFixedDocumentEditor.html">RadFixedDocumentEditor</a></td>
            <td>Represents editor that will allow you to modify RadFixedDocument using an automatic layout in a flow-like manner.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.html"><span style="font-weight: 400; font-style: normal; text-decoration: none;">Telerik.Windows.Documents.Fixed.Model.Editing</span></a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.FixedContentEditor.html">FixedContentEditor</a></td>
            <td>Intended to simplify the process of creating and editing the content of an IContentRootElement such as RadFixedPage.It provides methods for working with fixed content.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Text.html">Telerik.Windows.Documents.Fixed.FormatProviders.Text</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Text.TextFormatProvider.html">TextFormatProvider</a></td>
            <td>Provides functionality to export RadFixedDocument to text.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.html">Telerik.Windows.Documents.Fixed.FormatProviders.Pdf</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider.html">PdfFormatProvider</a></td>
            <td>Provides functionality for importing and exporting PDF documents.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Streaming.html">Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Streaming</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Streaming.PdfStreamWriter.html">PdfStreamWriter</a></td>
            <td>Represents PDF file stream that writes file content directly to a given stream. Enables you to merge PDF pages or add content to existing documents.</td>
        </tr>
    </tbody>
</table>

## RadSpreadProcessing

<table>
    <tbody>
        <tr>
            <th><span style="font-weight: bold;">Namespace</span></th>
            <th><span style="font-weight: bold;">Class Name</span></th>
            <th><span style="font-weight: bold;">Description</span></th>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.html">Telerik.Windows.Documents.Spreadsheet.Model</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.Workbook.html">Workbook</a></td>
            <td>The main object that represents the spreadsheet document. It contains collection of Worksheets.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.html"><span style="font-weight: 400; font-style: normal; text-decoration: none;">Telerik.Windows.Documents.Spreadsheet.Model</span></a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.Worksheet.html">Worksheet</a></td>
            <td>A two-dimensional grid of cells that are organized into rows and columns.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.html"><span style="font-weight: 400; font-style: normal; text-decoration: none;">Telerik.Windows.Documents.Spreadsheet.Model</span></a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.Cells.html">Cells</a></td>
            <td>Represents a collection of cells inside worksheet.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.html">Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider.html">XlsxFormatProvider</a></td>
            <td>Provides functionality to import or export Workbook objects to XLSX.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv.html">Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv.CsvFormatProvider.html">CsvFormatProvider</a></td>
            <td>Provides functionality to import or export Workbook objects to CSV.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.html">Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider.html">PdfFormatProvider</a></td>
            <td>Provides functionality to export Workbook objects to PDF.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Txt.html">Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Txt</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Txt.TxtFormatProvider.html">TxtFormatProvider</a></td>
            <td>Provides functionality to import or export Workbook objects to plain text.</td>
        </tr>
    </tbody>
</table>

## RadSpreadStreamProcessing

<table>
    <tbody>
        <tr>
            <th><span style="font-weight: bold;">Namespace</span></th>
            <th><span style="font-weight: bold;">Class Name</span></th>
            <th><span style="font-weight: bold;">Description</span></th>
        </tr>
        <tr>
            <td rowspan="6"><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.html">Telerik.Documents.SpreadsheetStreaming</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadExporter.html">SpreadExporter</a></td>
            <td>Represents an entry point to export a spreadsheet document.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IWorkbookExporter.html">IWorkbookExporter</a></td>
            <td>Defines members used to export a workbook.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IWorksheetExporter.html">IWorksheetExporter</a></td>
            <td>Defines members used to export a worksheet.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IRowExporter.html">IRowExporter</a></td>
            <td>Defines members for the row exporter classes.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IColumnExporter.html">IColumnExporter</a></td>
            <td>Defines members used to export a column.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.ICellExporter.html">ICellExporter</a></td>
            <td>Defines members used to export a cell.</td>
        </tr>
    </tbody>
</table>

## RadZipLibrary

<table>
    <tbody>
        <tr>
            <th><span style="font-weight: bold;">Namespace</span></th>
            <th><span style="font-weight: bold;">Class Name</span></th>
            <th><span style="font-weight: bold;">Description</span></th>
        </tr>
        <tr>
            <td rowspan="3"><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Zip.html">Telerik.Windows.Zip</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Zip.ZipArchive.html">ZipArchive</a></td>
            <td>Represents a package of compressed files in the zip archive format.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Zip.ZipArchiveEntry.html">ZipArchiveEntry</a></td>
            <td>Represents a compressed file within a zip archive.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Zip.CompressedStream.html">CompressedStream</a></td>
            <td>Represents stream that allows you to read/write compressed information from/to given input stream.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Zip.Extensions.html">Telerik.Windows.Zip.Extensions</a></td>
            <td><a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Zip.Extensions.ZipFile.html">ZipFile</a></td>
            <td>Provides static methods for creating, extracting, and opening zip archives.</td>
        </tr>
    </tbody>
</table>