---
title: Format Providers Manager
page_title: Format Providers Manager
description: Format Providers Manager
slug: radspreadprocessing-formats-and-conversion-format-providers-manager
tags: format,providers,manager
published: True
position: 1
---

# Format Providers Manager

 __RadSpreadprocessing__ contains a __WorkbookFormatProvidersManager__ class that allows you to specify a set of format providers and import or export files letting the manager choose the appropriate format provider. The class also exposes methods that return all registered providers and supported file extensions.
      
      
## Registering and Unregistering Format Providers

The __WorkbookFormatProvidersManager__ class contains two methods that allow you to register and unregister format providers respectively. The manager has the csv and txt format providers registered by default. The snippet in __Example 1__ illustrates how to register the xlsx format provider.
        

>Unlike the __CsvFormatProvider__ and __TxtFormatProvider__ classes, using __XlsxFormatProvider__ requires references to the following assemblies:
          

>* Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.dll
              

>* Telerik.Windows.Zip.dll

> The __XlsFormatProvider__ requires a reference to the following assembly:

>* Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls.dll


#### __[C#] Example 1: Register provider__

{{region cs-radspreadprocessing-formats-and-conversion-format-providers-manager_0}}
	WorkbookFormatProvidersManager.RegisterFormatProvider(new XlsxFormatProvider());
{{endregion}}



#### __[VB.NET] Example 1: Register provider__

{{region vb-radspreadprocessing-formats-and-conversion-format-providers-manager_0}}
	WorkbookFormatProvidersManager.RegisterFormatProvider(New XlsxFormatProvider())
{{endregion}}


You can also unregister format providers using the UnregisterFormatProvider() method. __Example 2__ demonstrates how to unregister the TxtFormatProvider.
        
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

The format providers manager exposes an Import() method that takes one string argument, which specifies the extension of the file to be imported, and a Stream argument, which provides access to the file. The method tries to find a registered format provider that can handle the extension of the file you would like to import, and if such a provider is registered the file is imported. If the manager does not have an appropriate format registered, an __UnsupportedFileFormatException__ is thrown.
        

__Example 3__ demonstrates how to present the user with an OpenFileDialog and try to import the selected file. Note that you can use the __GetOpenFileDialogFilter()__ method of the __FileDialogHelper__ class to constructs the correct filter for all registered format providers.

#### __[C#] Example 3: Import a file using OpenFileDialog__

{{region cs-radspreadprocessing-formats-and-conversion-format-providers-manager_2}}
	OpenFileDialog openFileDialog = new OpenFileDialog();
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
	Dim openFileDialog As New OpenFileDialog()
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


> The OpenFileDialog class exposes a different API in Silverlight. The name of the file could be obtained through the File.Name property of OpenFileDialog and the stream you can get using File.OpenRead().


You can achieve the same result through using the __OpenFile__ command. In fact, the command executes exactly the same code as above. That said, make sure you register the format providers you would like to use before using the command.
        

## Export

The format providers manager contains an __Export()__ method that takes three arguments: the workbook that is to be exported, a string that specified the extension of the saved file, and a Stream that will contain the data. The method attempts to find a provider that can handle a file of the specified extension and if such a provider is registered, the file is saved. If the manager does not have an appropriate registered provider, an __UnsupportedFileFormatException__ is raised.
        

__Example 4__ illustrates how to use the __Export()__ method to save a file. The sample code presents the user with the SaveFileDialog. Note that here again you can use the __GetOpenFileDialogFilter()__ method of the __FileDialogHelper__ class to construct the correct filter for all registered format providers.
        

#### __[C#] Example 4: Save a file using SaveFileDialog__

{{region cs-radspreadprocessing-formats-and-conversion-format-providers-manager_3}}
	SaveFileDialog saveFileDialog = new SaveFileDialog();
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
	Dim saveFileDialog As New SaveFileDialog()
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

The __WorkbookFormatProvidersManager__ class offers several approaches to retrieve the registered format providers. The class offers the GetProviderByName() static method that searches through the registered providers to find a provider with a specific name. Also, the manager exposes the __GetProvderByExtension__ extension. The class also contains a static method  __GetSupportedExtensions()__ that returns an IEnumeable of the currently supported file extensions.

