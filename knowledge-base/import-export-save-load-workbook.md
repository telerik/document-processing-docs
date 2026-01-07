---
title: Import/Load and Export/Save RadSpreadProcessing Workbook
description: Examples of Import/Load and Export/Save RadSpreadProcessing Workbook to facilitate working with text, Excel and PDF documents
type: how-to
page_title: Import/Load and Export/Save RadSpreadProcessing Workbook
slug: import-export-save-load-workbook
position: 
tags: 
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2021.2.615|[RadSpreadProcessing]({%slug radspreadprocessing-overview%})|[Peter Milchev](https://www.telerik.com/blogs/author/peter-milchev)|

## Description

The **UI-independent cross-platform** [Telerik Document Processing Libraries](https://docs.telerik.com/devtools/document-processing/introduction) allows you to *create*, *import*, *modify* and *export* documents **without relying** on external dependencies like *Adobe Acrobat* or *Microsoft Office*.

The [RadSpreadProcessing]({%slug radspreadprocessing-overview%}) library uses various [FormatProviders]({%slug radspreadprocessing-formats-and-conversion-general-information%}) to support working with different file types such as `.xslx`/`.xls`/`.csv`, `.txt`, `.pdf`. An extensive list of links for each format and its provider can be found here: 
- [Getting Started Resources by Library - Spreadsheet processing]({%slug getting-started%}#spreadsheet-processing)
- [RadSpreadProcessing - Required assemblies]({%slug radspreadprocessing-getting-started%}#assembly-references)


## Solution

All **FormatProviders** implement the `IWorkbookFormatProvider` and `IBinaryWorkbookFormatProvider` interface so they all have the same Import/Export methods that work with `Stream` and `byte[]` array. 

This article shows examples of the most common scenarios where the Workbook could be used. The [Table of Contents in the Examples](#table-of-contents) section below contains the full list of covered examples for easy and quick navigation.

Note that the code snippets in the [Examples section](#examples) use the **XLSX format provider** for demo purposes. It can be replaced with any format provider implementing the `IWorkbookFormatProvider` or `IBinaryWorkbookFormatProvider` interface depending on if you are working with a `Stream` or a `byte[]` array. The [Format Providers Manager]({%slug radspreadprocessing-formats-and-conversion-format-providers-manager%}) can help with choosing the best provider based on a file extension.

>note The Telerik Document Processing Libraries are **UI-independent cross-platform** libraries so some of the examples might be applicable only in desktop applications or ASP.NET projects.

## Examples 

### Table of Contents

- [File as Byte[] array](#file-as-byte-array)
  - [Load workbook from Byte[] array](#load-workbook-from-byte-array)
  - [Save workbook as Byte[] array](#save-workbook-as-byte-array)
- [FileStream or MemoryStream](#filestream-or-memorystream)
  - [Load Workbook from file as FileStream or MemoryStream](#load-workbook-from-file-as-filestream-or-memorystream)
  - [Save Workbook to FileStream or MemoryStream](#save-workbook-to-filestream-or-memorystream)
- [Save Workbook as PDF](#save-workbook-as-pdf)
- [Uploaded file](#uploaded-file)
  - [Load Workbook from an Uploaded File](#load-workbook-from-an-uploaded-file)
- [DataBase](#database)
  - [Load Workbook from SQL DataBase](#load-workbook-from-sql-database)
  - [Save Workbook to SQL DataBase](#save-workbook-to-sql-database)
- [Web service](#web-service)
  - [Load Workbook from the Web](#load-workbook-from-the-web)
- [Base64 string](#base64-string)
  - [Load Workbook from Base64 string](#load-workbook-from-base64-string)
  - [Save Workbook to Base64 string](#save-workbook-to-base64-string)
- [DataTable](#datatable)
  - [Load Workbook from DataTable](#load-workbook-from-datatable)
  - [Save Workbook to DataTable](#save-workbook-to-datatable)
- [Download](#download)
- [OpenFileDialog](#openfiledialog)
- [SaveFileDialog](#savefiledialog)
- [Related resources](#related-resources)


## File as Byte[] array

### Load workbook from Byte[] array

````C#
Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
// the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IBinaryWorkbookFormatProvider interface
IBinaryWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

var path = "MyWorkbook.xlsx";
// var path = Server.MapPath("~/Resources/FromWorkbook.pdf"); // applicable only for ASP.NET project

//https://docs.microsoft.com/en-us/dotnet/api/system.io.file.readallbytes?view=net-5.0
byte[] fileAsByteArray = File.ReadAllBytes(path);
workbook = formatProvider.Import(fileAsByteArray);
````

### Save workbook as Byte[] array

````C#
// the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IBinaryWorkbookFormatProvider interface
IBinaryWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

// use your own Workbook instance here 
byte[] bytesFromWorkbook = formatProvider.Export(workbook);

// save the file on the local system or use the byte array to download or save in DB
var path = "MyWorkbook.xlsx";
// var path = Server.MapPath("~/Resources/FromWorkbook.pdf"); // applicable only for ASP.NET project

File.WriteAllBytes(path, bytesFromWorkbook);
````

## FileStream or MemoryStream

### Load Workbook from file as FileStream or MemoryStream

````C#
Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
// the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IWorkbookFormatProvider interface
IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

using (Stream input = new MemoryStream(fileAsByteArray))
//using (Stream input = new FileStream(path, FileMode.Open))
{
    workbook = formatProvider.Import(input);
}

````


### Save Workbook to FileStream or MemoryStream

````C#
// the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IWorkbookFormatProvider interface
IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();
var path = "MyWorkbook.pdf";
// var path = Server.MapPath("~/MyWorkbook.pdf"); // applicable only for ASP.NET project

using (MemoryStream output = new MemoryStream())
//using (Stream output = new FileStream(path, FileMode.Create))
{
    // use your own Workbook instance here
    formatProvider.Export(workbook, output);
}
````


## Save Workbook as PDF

````C#
var pdfFormatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();
// var path = Server.MapPath("~/Resources/FromWorkbook.pdf"); // applicable only for ASP.NET project
var path = "MyWorkbook.pdf";

// Option 1: Using FileStream

using (Stream output = File.OpenWrite(path))
{
    // use your own Workbook instance here
    pdfFormatProvider.Export(workbook, output);
}

// Option 2: Using Byte[] array
var path = "MyWorkbook.xlsx";
// var path = Server.MapPath("~/MyWorkbook.pdf"); // applicable only for ASP.NET project
byte[] pdfBytes = pdfFormatProvider.Export(workbook);
File.WriteAllBytes(path, pdfBytes);

````

## Uploaded file

### Load Workbook from an Uploaded File

_* Web application specific example_

````C#
//public Workbook LoadFromUploadedFile(HttpPostedFile uploadedFile) // General upload file type
public Workbook LoadFromUploadedFile(UploadedFile uploadedFile) // Telerik RadAsyncUpload for ASP.NET AJAX specific upload file type
{
    Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
    // the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IWorkbookFormatProvider interface   
    IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();
    
    workbook = formatProvider.Import(uploadedFile.InputStream);

    return workbook;
}
````

## DataBase

### Load Workbook from SQL DataBase

The SQL table used for the example below has the `FileContent` column as `varbinary(MAX)`. 

````C#
// the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IBinaryWorkbookFormatProvider interface
IBinaryWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

// ReadFileFromDatabaseAsByteArray is demo method declared in the code snippet below 
var fileAsByteArray = ReadFileFromDatabaseAsByteArray(id);

Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
workbook = formatProvider.Import(fileAsByteArray);
````

````C#
public static byte[] ReadFileFromDatabaseAsByteArray(string id)
{
    var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WorkbookTestsConnectionString"].ConnectionString;

    using (var cn = new SqlConnection() { ConnectionString = connectionString })
    {
        const string statement = "SELECT id, [FileContent], FileName FROM Attachments  WHERE id = @id;";

        using (var cmd = new SqlCommand() { Connection = cn, CommandText = statement })
        {
            cmd.Parameters.AddWithValue("@id", fileName);

            cn.Open();

            using (var reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    reader.Read();

                    // the blob field
                    var fieldOrdinal = reader.GetOrdinal("FileContent");

                    var blob = new byte[(reader.GetBytes(
                        fieldOrdinal, 0,
                        null, 0,
                        int.MaxValue))];

                    reader.GetBytes(fieldOrdinal, 0, blob, 0, blob.Length);

                    return blob;
                }
            }

            return null;
        }
    }
}
````


### Save Workbook to SQL DataBase

````C#
// the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IBinaryWorkbookFormatProvider interface
IBinaryWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

byte[] bytesFromWorkbookForSqlSave = formatProvider.Export(workbook);
// InsertFileAsByteArrayInDatabase is a demo method declared in the snippet below
bool isSuccessful = InsertFileAsByteArrayInDatabase(bytesFromWorkbookForSqlSave, "WorkbookForSqlSave.xlsx");
````

````C#
public bool InsertFileAsByteArrayInDatabase(byte[] fileBytes, string fileName)
{
    var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WorkbookTestsConnectionString"].ConnectionString;

    using (var cn = new SqlConnection() { ConnectionString = connectionString })
    {
        const string statement = "INSERT INTO Attachments (FileContent,FileName) VALUES (@FileContent,@FileName)";

        using (var cmd = new SqlCommand() { Connection = cn, CommandText = statement })
        {
            cmd.Parameters.Add("@FileContent",
                SqlDbType.VarBinary, fileBytes.Length).Value = fileBytes;

            cmd.Parameters.AddWithValue("@FileName", fileName);

            cn.Open();
            cmd.ExecuteNonQuery();

            return true;
        }
    }
}
````

## Web service

### Load Workbook from the Web

````C#
public Workbook LoadFromWeb(string url)
{
    Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbookFromWebService;
    // the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IWorkbookFormatProvider interface
    IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();
    WebClient webClient = new WebClient();

    using (Stream webFileStream = webClient.OpenRead(new Uri(url)))
    {
        workbookFromWebService = formatProvider.Import(webFileStream);
    }

    return workbookFromWebService;
}
````

## Base64 string

### Load Workbook from Base64 string

````C#
// the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IBinaryWorkbookFormatProvider interface
IBinaryWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

byte[] fileAsByteArray = Convert.FromBase64String(fileAsBase64String);

Workbook workbook = formatProvider.Import(fileAsByteArray);
````

### Save Workbook to Base64 string

````C#
// the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IBinaryWorkbookFormatProvider interface
IBinaryWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();
string base64FromByteArray;

// use your own Workbook instance here
byte[] bytesFromWorkbook = formatProvider.Export(workbook);
string base64FromByteArray = Convert.ToBase64String(bytesFromWorkbook);
````

## DataTable

### Load Workbook from DataTable

````C#
public Workbook LoadFromDataTable(DataTable dataTable)
{
    // Convert a DataTable to Workbook
    DataTableFormatProvider provider = new DataTableFormatProvider();

    Workbook workbook = new Workbook();
    Worksheet worksheet = workbook.Worksheets.Add();

    provider.Import(dataTable, worksheet);

    return workbook;
}
````

### Save Workbook to DataTable

````C#
DataTableFormatProvider provider = new DataTableFormatProvider();
// use your own Workbook instance here and choose the desired worksheet
DataTable dataTableFromWorkbook = provider.Export(workbook.Worksheets[0]);
````


## Download 


````C#
// the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IBinaryWorkbookFormatProvider interface
IBinaryWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

// use your own Workbook instance here
byte[] fileToDownloadAsByteArray = formatProvider.Export(workbook);

// Demo method declared in the snippet below
WriteFileToResponse(fileToDownloadAsByteArray);
````

````C#
private void WriteFileToResponse(byte[] content)
{
    var fileName = "MyWorkbook.xlsx";
    
    // https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types
    var contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    var contentDisposition = string.Format("attachment; filename={0}", fileName);

    Response.Clear();
    // Content might need to be adjusted if a different file type is used
    Response.ContentType = contentType;
    Response.Headers.Remove("Content-Disposition");
    Response.AppendHeader("Content-Disposition", contentDisposition);
    Response.BinaryWrite(content);
    Response.End();
}
````

## OpenFileDialog

_*Desktop application specific example_

````C#
OpenFileDialog openFileDialog = new Microsoft.Win32.OpenFileDialog(); 
openFileDialog.Filter = Telerik.Windows.Controls.Spreadsheet.Utilities.FileDialogsHelper.GetOpenFileDialogFilter(); 
// the XLSX format provider is used for demo purposes and can be replaced with any format provider implementing the IWorkbookFormatProvider interface
IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();
if (openFileDialog.ShowDialog() == true) 
{ 
    try 
    { 
        using (Stream input = openFileDialog.OpenFile()) 
        { 
            workbook = formatProvider.Import(input); 
        } 
    } 
    catch (IOException ex) 
    { 
        throw new IOException("The file cannot be opened. It might be locked by another application.", ex); 
    } 
} 
````

## SaveFileDialog

_*Desktop application specific example_


````C#
Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook = new Telerik.Windows.Documents.Spreadsheet.Model.Workbook(); 
workbook.Worksheets.Add(); 
 
SaveFileDialog saveFileDialog = new SaveFileDialog(); 
// the CSV format provider is used for demo purposes and can be replaced with
Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv.CsvFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv.CsvFormatProvider(); 
saveFileDialog.Filter = "CSV (comma delimited) (.csv)|.csv|All Files (.)|."; 
 
if (saveFileDialog.ShowDialog() == true) 
{ 
    using (Stream output = saveFileDialog.OpenFile()) 
    { 
        formatProvider.Export(workbook, output); 
    } 
} 
````

## See Also

- [Getting Started with Telerik Document Processing]({%slug getting-started%})
- [Installing Telerik Document Processing on Your Computer]({%slug installation-installing-on-your-computer%})
- [Telerik Document Processing Developer Focused examples repository](https://github.com/telerik/document-processing-sdk)
- [RadSpreadProcessing - Formats and conversion]({%slug radspreadprocessing-formats-and-conversion-general-information%})
- [RadSpreadProcessing - Format Providers Manager]({%slug radspreadprocessing-formats-and-conversion-format-providers-manager%})
- [RadSpreadProcessing Workbook Overview]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
