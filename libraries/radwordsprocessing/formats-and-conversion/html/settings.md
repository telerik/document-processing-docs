---
title: Settings
description: Learn about the import and export settings available for the HtmlFormatProvider in RadWordsProcessing.
page_title: Settings
slug: radwordsprocessing-formats-and-conversion-html-settings
tags: html, format, provider, settings, word, flow, docx, import, export, configuration, document
published: True
position: 4
---

# Settings

`HtmlFormatProvider` allows you to import HTML documents and export a `RadFlowDocument` to HTML. The import and export settings let you modify the provider behavior. This article outlines the available settings.

* [Import Settings](#import-settings)

* [UriImageSource Class](#uriimagesource-class)

* [Export Settings](#export-settings)


## Import Settings

The `HtmlImportSettings` class represents the import settings. You can specify the following options:

### DefaultStyleSheet

The property specifies the default stylesheet that the provider uses. This is equivalent to the browser's "user agent stylesheet" and specifies the formatting that applies by default to the elements (before all styles that the document explicitly defines).

The default value, for example, specifies that `b` elements are imported with `font-weight: bold`.

You can set the value of the property to any valid CSS document. **Example 1** shows how you can add styling besides the default styles.

**Example 1: Append a custom paragraph color rule to the default import stylesheet**

<snippet id='codeblock-css-default'/>

### GenericFonts

The property contains an instance of the `GenericHtmlFonts` class, which specifies the `ThemableFontFamily` objects to use when importing the five generic CSS font families: serif, sans-serif, monospace, cursive, and fantasy. By default, these fonts are Times New Roman, Arial, Courier New, Comic Sans MS, and Algerian, respectively.

### LoadImageFromUri and LoadStyleSheetFromUri Events

These events allow you to load external resources (images and CSS files) that the HTML does not include. To use these events, load the data from the URI in the event arguments and return it.

>important The `LoadFromUri` event is obsolete starting with R1 2021. Use `LoadImageFromUri` or `LoadStyleSheetFromUri` instead. Starting with Q3 2015, the library introduced the `UriImageSource` class. This class automatically downloads the images. But because such an approach poses a security risk, it is obsolete starting with R1 2021.

The `LoadImageFromUri` event uses the `LoadImageFromUriEventArgs` object which exposes the following properties:

* `Uri`: The URI originally specified in the imported HTML file.
* `SetImageInfo`: Passes the image data and image format (extension).


**Example 2** shows how to use the `LoadImageFromUri` event to download an image.

**Example 2: Handle LoadImageFromUri and download the referenced image bytes before import**
<snippet id='codeblock-load-image-from-uri'/>

The `LoadStyleSheetFromUri` event uses the `LoadStyleSheetFromUriEventArgs` object which exposes the following properties:

* `Uri`: The URI originally specified in the imported HTML file.
* `SetStyleSheetContent`: Passes the styles as a string.

**Example 3** shows how to use the `LoadStyleSheetFromUri` event.

**Example 3: Handle LoadStyleSheetFromUri and load external CSS content from disk**
<snippet id='codeblock-load-stylesheet-from-uri'/>

## UriImageSource Class

When importing HTML that contains images with URI source, the `HtmlFormatProvider` creates a `UriImageSource` object for each of these images. `UriImageSource` downloads the image data on demand and exposes the following properties:

* `Uri`: Gets the URI of the image.
* `Data`: Gets a byte array that represents the image data. When you access this property, the class downloads the image data.
* `Extension`: Gets the extension. When you access this property, the class downloads the image data only if the extension is not predefined.

>important The `UriImageSource` class and the `LoadFromUri` event make HTTP requests and download the respective resources. Consider this if your application must not freely access remote resources.

> When you export a `UriImageSource` object to other supported formats, the provider downloads the image and saves it according to the target format specification.


### Converting UriImageSource to ImageSource

The provider always exports `UriImageSource` objects as images with URI as their source, regardless of the export settings. If you need to export this object as an embedded or external image, convert the `UriImageSource` to an `ImageSource` object.

**Example 4: Convert a UriImageSource on an imported image to an in-memory ImageSource**

<snippet id='codeblock-ca'/>


## Export Settings

The `HtmlExportSettings` class represents the export settings. You can specify the following settings:

### BordersMinimalThickness

Specifies the minimal exported thickness of the borders of tables and table cells. This can be useful because some browsers cannot render thin borders properly (below 1px or similar). The default value is 0, which means the provider exports all borders with their actual thickness.

### DocumentExportLevel

Specifies the export level of the document through the `DocumentExportLevel` enumeration:

* `Document`: Exports a full HTML document. This is the default value of the property.
* `Fragment`: Exports a fragment of the HTML document—only the `body` tag.

### IndentDocument

Specifies whether the exported document is indented (formatted with spaces). The default value is `false`, as this ensures minimum size rather than human-readability.

### ImagesExportMode

This property controls how the provider exports images. The available options are external file and embedded image.

> When you import an image with URI source, the `ImageSource` property of the Image contains an object of type `UriImageSource`. As a result, the provider always exports the image with URI and does not respect the `ImagesExportMode` property. If you need the provider to respect this property, convert the `UriImageSource` object to `ImageSource`.

> When you work with relative URIs, the import and export features only preserve the path to the image and do not change it.

### ImagesFolderPath

This property specifies the folder path where the provider exports external images. This property applies only when `ImageExportMode` is set to `External`.

### ImagesSourceBasePath

Specifies the base path for the `src` attribute of the exported image tags. This property applies only when the `ImageExportMode` is set to `External`.

### ImageExporting

The provider raises this event for every image in the document. The event argument exposes the following options:

* `Title`: Allows you to set the `title` attribute of the `image` element.
* `AlternativeText`: Can be used to specify the content of the `alt` attribute of the image. It is null by default and the attribute is not exported.
* `Handled`: Marks the event as handled. If `ImagesExportMode` is set to `External` and the event is marked as handled, the format provider does not attempt to export the image to an external image file.
* `Image`: Can be used to get the original Image object, from where you can access image name, image data, and image extension.
* `Source`: Can be used to specify the value of the `src` attribute of the `image` element. If `ImagesExportMode` is set to `External`, the source can be set to absolute or to a relative path pointing to the image file.
* `ExportSize`: Use this property to specify whether the `width` and `height` attributes of an `image` element are exported. The default value is `true`.


### StylesExportMode

Specifies the export mode for the [styles in the RadFlowDocument StyleRepository]({%slug radwordsprocessing-concepts-styles%}), through the `StylesExportMode` enumeration:

* `Embedded`: `RadFlowDocument` styles are exported as internal CSS—selectors embedded into the HTML in `style` element in the `head` section. This is the default value of the property.
* `External`: `RadFlowDocument` styles are exported as CSS selectors in external CSS file. You have two options:
    * Set `StylesFilePath` and `StylesSourcePath` properties, which are used to export the external file.
    * Handle `ExportStylesToExternalSource` event, specifying the output stream and reference URI to be exported.
* `Inline`: `RadFlowDocument` styles are exported as CSS properties in the `style` attribute of the HTML elements. This ensures maximum compatibility with some applications that don't support external or embedded CSS, for example, some email clients.
* `None`: `RadFlowDocument` styles are not exported. The local values of [style properties]({%slug radwordsprocessing-concepts-style-properties%}) of the DocumentElements are still exported as CSS properties in the `style` attribute of the HTML elements.

### StylesFilePath

This property specifies the file path where the external styles are exported.

### StylesSourcePath

The property specifies the base path for the `href` attribute of the `link` element pointing to the file that contains the external styles.

### ExternalStylesExporting

The event is only raised when the `StylesExportMode` property is set to `External`. The event argument exposes the following properties:

* `Css`: String that contains the actual CSS that is exported.
* `Handled`: Marks the event as handled. If the event is marked as handled, the format provider does not attempt to export the CSS file.
* `Reference`: The value that is set to the `href` attribute of the `link` element tag. In general, this is set to the absolute or relative path pointing to the file that contains the CSS styles.

**Example 5** shows how to create export settings.

**Example 5: Configure HtmlExportSettings for fragment export, indentation, and custom image metadata**

<snippet id='codeblock-cb'/>



## See Also

* [Styles]({%slug radwordsprocessing-concepts-styles%})
* [Style Properties]({%slug radwordsprocessing-concepts-style-properties%})
* [Handling Local Path Images When Importing HTML Documents in Telerik WordsProcessing]({%slug handling-local-path-images-html%})
