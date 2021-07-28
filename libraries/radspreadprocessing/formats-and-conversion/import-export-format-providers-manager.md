---
title: Format Providers Manager
page_title: Format Providers Manager
slug: radspreadprocessing-formats-and-conversion-format-providers-manager
tags: format,providers,manager
published: True
position: 1
---

# Format Providers Manager

__RadSpreadprocessing__ contains a __WorkbookFormatProvidersManager__ class that allows you to specify a set of format providers and import or export files letting the manager choose the appropriate format provider. The class also exposes methods that return all registered providers and supported file extensions. 

````C#
public class WorkbookFormatProvidersManager
{
    public static IEnumerable<IWorkbookFormatProvider> FormatProviders { get; }

    public static void Export(Workbook workbook, string extension, Stream output);
    public static void Export(Workbook workbook, string extension, Stream output, IEnumerable<IWorkbookFormatProvider> formatProviders);

    public static IWorkbookFormatProvider GetProviderByExtension(string extension);
    public static IWorkbookFormatProvider GetProviderByName(string providerName);

    public static IEnumerable<string> GetSupportedExtensions();
    
    public static Workbook Import(string extension, Stream input);
    public static Workbook Import(string extension, Stream input, IEnumerable<IWorkbookFormatProvider> formatProviders);
    
    public static void RegisterFormatProvider(IWorkbookFormatProvider provider);
    public static void UnregisterFormatProvider(IWorkbookFormatProvider provider);
}
````
      
      
## Registering and Unregistering Format Providers

The __WorkbookFormatProvidersManager__ class contains two methods that allow you to register and unregister format providers respectively. The manager has the `csv` and `txt` format providers registered by default. The snippet in __Example 1__ illustrates how to register the [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider %}).
        

> Some Format Providers require additional assembly references. Check the full list of the FormatProviders' additional reference requirements in [Format Providers - Additional assembly references]({%slug radspreadprocessing-formats-and-conversion-general-information%}#additional-assembly-references).


#### __[C#] Example 1: Register provider__

{{region cs-radspreadprocessing-formats-and-conversion-format-providers-manager_0}}
	WorkbookFormatProvidersManager.RegisterFormatProvider(new XlsxFormatProvider());
{{endregion}}



#### __[VB.NET] Example 1: Register provider__

{{region vb-radspreadprocessing-formats-and-conversion-format-providers-manager_0}}
	WorkbookFormatProvidersManager.RegisterFormatProvider(New XlsxFormatProvider())
{{endregion}}


You can also unregister format providers using the `UnregisterFormatProvider()` method. __Example 2__ demonstrates how to unregister the [TxtFormatProvider]({%slug radspreadprocessing-formats-and-conversion-txt-txtformatprovider %}).
        
#### __[C#] Example 2: Unregister provider__

{{region cs-radspreadprocessing-formats-and-conversion-format-providers-manager_1}}
	IWorkbookFormatProvider provider = WorkbookFormatProvidersManager.GetProviderByName("TxtFormatProvider");
	if (provider != null)
	{
	    WorkbookFormatProvidersManager.UnregisterFormatProvider(provider);
	}
{{endregion}}



#### __[VB.NET] Example 2: Unregister provider__

{{region vb-radspreadprocessing-formats-and-conversion-format-providers-manager_1}}
	Dim provider As IWorkbookFormatProvider = WorkbookFormatProvidersManager.GetProviderByName("TxtFormatProvider")
	If provider IsNot Nothing Then
	    WorkbookFormatProvidersManager.UnregisterFormatProvider(provider)
	End If
{{endregion}}

## Import

The format providers manager exposes an `Import()` method that takes two arguments:
- `string` argument - specifies the extension of the file to be imported, 
- `Stream` argument -  provides access to the file. 

The method tries to find a registered format provider that can handle the extension of the file you would like to import, and if such a provider is registered the file is imported. If the manager does not have an appropriate format registered, an __UnsupportedFileFormatException__ is thrown.
        

__Example 3__ demonstrates how to present the user with an `OpenFileDialog` and try to import the selected file. Note that you can use the __GetOpenFileDialogFilter()__ method of the __FileDialogHelper__ class to constructs the correct filter for all registered format providers.

#### __[C#] Example 3: Import a file using OpenFileDialog__

{{region cs-radspreadprocessing-formats-and-conversion-format-providers-manager_2}}
	OpenFileDialog openFileDialog = new Microsoft.Win32.OpenFileDialog();
	openFileDialog.Filter = Telerik.Windows.Controls.Spreadsheet.Utilities.FileDialogsHelper.GetOpenFileDialogFilter();
	if (openFileDialog.ShowDialog() == true)
	{
	    try
	    {
	        string extension = Path.GetExtension(openFileDialog.SafeFileName);
	        using (Stream input = openFileDialog.OpenFile())
	        {
	            workbook = WorkbookFormatProvidersManager.Import(extension, input);
	        }
	    }
	    catch (IOException ex)
	    {
	        throw new IOException("The file cannot be opened. It might be locked by another application.", ex);
	    }
	}
{{endregion}}


#### __[VB.NET] Example 3: Import a file using OpenFileDialog__

{{region vb-radspreadprocessing-formats-and-conversion-format-providers-manager_2}}
	Dim openFileDialog As New Microsoft.Win32.OpenFileDialog()
	openFileDialog.Filter = FileDialogsHelper.GetOpenFileDialogFilter()
	If openFileDialog.ShowDialog() = True Then
	    Try
	        Dim extension As String = Path.GetExtension(openFileDialog.GetFileName())
	        Using input As Stream = openFileDialog.OpenFileStream()
	            editor.Owner.Workbook = WorkbookFormatProvidersManager.Import(extension, input)
	        End Using
	    Catch ex As IOException
	        Throw New IOException("The file cannot be opened. It might be locked by another application.", ex)
	    End Try
	End If
{{endregion}}


> The OpenFileDialog class exposes a different API in Silverlight. The name of the file could be obtained through the File.Name property of `OpenFileDialog` and the stream you can get using `File.OpenRead()`.


You can achieve the same result through using the __OpenFile__ command. In fact, the command executes exactly the same code as above. That said, make sure you register the format providers you would like to use before using the command.
        

## Export

The format providers manager contains an __Export()__ method that takes three arguments: 
- `Workbook` argument - the workbook to be exported
- `string` argument - specifies the extension of the saved file
- `Stream` argument - the Stream that will contain the data. 

The method attempts to find a provider that can handle a file of the specified extension and if such a provider is registered, the file is saved. If the manager does not have an appropriate registered provider, an __UnsupportedFileFormatException__ is raised.
        

__Example 4__ illustrates how to use the __Export()__ method to save a file. The sample code presents the user with the SaveFileDialog. Note that here again you can use the __GetOpenFileDialogFilter()__ method of the __FileDialogHelper__ class to construct the correct filter for all registered format providers.
        

#### __[C#] Example 4: Save a file using SaveFileDialog__

{{region cs-radspreadprocessing-formats-and-conversion-format-providers-manager_3}}
	Microsoft.Win32.SaveFileDialog saveFileDialog = new Microsoft.Win32.SaveFileDialog();
	saveFileDialog.Filter = Telerik.Windows.Controls.Spreadsheet.Utilities.FileDialogsHelper.GetSaveFileDialogFilter();
	
	if (saveFileDialog.ShowDialog() == true)
	{
	    string extension = Path.GetExtension(saveFileDialog.SafeFileName);
	    using (Stream output = saveFileDialog.OpenFile())
	    {
	        WorkbookFormatProvidersManager.Export(workbook, extension, output);
	    }
	}
{{endregion}}


#### __[VB.NET] Example 4: Save a file using SaveFileDialog__

{{region vb-radspreadprocessing-formats-and-conversion-format-providers-manager_3}}
	Dim saveFileDialog As New Microsoft.Win32.SaveFileDialog()
	saveFileDialog.Filter = FileDialogsHelper.GetSaveFileDialogFilter()
	
	If saveFileDialog.ShowDialog() = True Then
	    Dim extension As String = Path.GetExtension(saveFileDialog.SafeFileName)
	    Using output As Stream = saveFileDialog.OpenFile()
	        WorkbookFormatProvidersManager.Export(workbook, extension, output)
	    End Using
	End If
{{endregion}}


You can achieve the same result through using the __SaveFile__ command. In fact, the command executes exactly the same code as above. That said, make sure you register the format providers you would like to use before using the command.
        
## Retrieve Registered Providers and Supported Extensions

Currently RadSpreadProcessing supports the following extensions: `.xlsx`, `.xls`, `.csv`, `.txt` and `.pdf` (export only). The format providers available for them are respectively [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%}), [XlsFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xls-xlsformatprovider%}), [CsvFormatProvider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider%}), [TxtFormatProvider]({%slug radspreadprocessing-formats-and-conversion-txt-txtformatprovider%}) and [PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}).

The __WorkbookFormatProvidersManager__ class offers several approaches to retrieve the registered format providers. The class offers the `GetProviderByName()` static method that searches through the registered providers to find a provider with a specific name. Also, the manager exposes the __GetProvderByExtension__ extension. The class also contains a static method  __GetSupportedExtensions()__ that returns an `IEnumeable` of the currently supported file extensions.

>note For more examples and application scenarios of Importing and Exporting a Workbook to various formats using a FormatProvider check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.
  

## See Also

* [Getting Started - First Steps]({%slug getting-started-first-steps%})
* [Format Providers - General Information]({%slug radspreadprocessing-formats-and-conversion-general-information%})
* [What is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
* [Create, Open and Save Workbooks]({%slug radspreadprocessing-working-with-workbooks-create-open-and-save-workbooks%})
* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})

