---
title: Document Themes
description: Learn how to work with document themes in RadSpreadProcessing to apply consistent colors, fonts, and graphic effects across workbooks.
page_title: Document Themes
slug: radspreadprocessing-features-styling-document-themes
tags: themes, spreadsheet, radspreadprocessing, colors, fonts, styles, workbook, formatting, xlsx, spread
published: True
position: 1
---

# Document Themes

The document model comes with several predefined themes called Document themes. They enable you to specify colors, fonts, and a variety of graphic effects in a document and affect the look and feel of the whole workbook. Each theme contains a color scheme and a font scheme and is represented by the `DocumentTheme` class.

* [Color Schemes](#color-schemes)

* [Font Schemes](#font-schemes)

* [Document Themes](#document-themes)

* [Getting Actual Values](#getting-actual-values)

## Color Schemes

A color scheme has a unique name and contains several predefined colors. Its representation in the document model is the `ThemeColorScheme` class. A scheme defines twelve colors and each of these is assigned a sole `ThemeColorType`. The following list contains all `ThemeColorType` values:

* background1

* text1

* background2

* text2

* accent1

* accent2

* accent3

* accent4

* accent5

* accent6

* hyperlink

* followed hyperlink

The twelve color types are used for creating `ThemableColor` objects. They determine the color of the scheme that appears as the actual color of the `ThemableColor` instance. As you change the theme or the color scheme, the actual color of the `ThemableColor` object changes as well. For example, if you set the fill of a cell to be a `ThemableColor`, applying a new theme or another scheme also affects the solid fill.

**Example 1** demonstrates how to create a `ThemeColorScheme` object. The example passes a name and twelve colors to the constructor. Every color has a comment next to it, so you can see its corresponding `ThemeColorType`.

**Example 1: Create ThemeColorScheme**

<snippet id='codeblock-cnl'/>

There are several ways to create a `ThemableColor` object:

* Passing two parameters to the constructor – *ThemeColorType* and *double*.

* `ThemeColorType` is an enum which has twelve possible values (the aforementioned color types).

* The second parameter is of type `double` and must be between -1 and 1. It represents the tint and shade to be applied to the selected color.

* Passing *ThemeColorType* and *ColorShadeType*.

* `ThemeColorType` is the same as in the previously mentioned constructor.

To create colors that depend on the current document theme, you need to use `ThemableColor` objects.

**Example 2** shows how you can create a `ThemableColor`.

**Example 2: Create ThemableColor**

<snippet id='codeblock-cnm'/>

## Font Schemes

A font scheme is represented by the `ThemeFontScheme` class. Every font scheme consists of a name and several predefined font families. Each font family corresponds to one of two font types:

* Major

* Minor

To create a `ThemeFontScheme` you need to pass a name and two font family names to the font scheme constructor. The former font family name corresponds to the Major `ThemeFontType` and the latter corresponds to the Minor.

**Example 3** illustrates how to create a `ThemeFontScheme` object.

**Example 3: Create ThemeFontScheme**

<snippet id='codeblock-cnn'/>

To use the document theme fonts, you need to use `ThemableFontFamily` objects. There are several ways you can create one:

* Passing a `ThemeFontType` object as a constructor parameter – this way you bind the object to the currently selected document theme.

* Passing a `FontFamily` object or a string representing a FontFamily name – the result is a static FontFamily that does not change when the document theme changes.

When you need to create a font that depends on the current document theme, use the `ThemableFontFamily` objects.

**Example 4** shows how to create a `ThemableFontFamily`.

**Example 4: Create ThemableFontFamily**

<snippet id='codeblock-cno'/>

## Document Themes

Now that you have a color and a font scheme, you can create a new `DocumentTheme`. You need to specify a name and pass the already created color and font schemes.

**Example 5** demonstrates how to create a `DocumentTheme` using the color scheme from **Example 1** and the font scheme from **Example 3**.

**Example 5: Create DocumentTheme**

<snippet id='codeblock-cnp'/>

In the predefined static class `PredefinedThemeSchemes`, you can find several predefined color and font schemes. The class exposes the properties `ColorSchemes` and `FontSchemes` that hold all predefined schemes.

**Example 6** shows how you can create a document theme using the predefined color and font schemes.

**Example 6: Create DocumentTheme from Predefined Schemes**

<snippet id='codeblock-cnq'/>

To change the current document theme, set a single property:

**Example 7** changes the theme of a newly created workbook.

**Example 7: Change DocumentTheme**

<snippet id='codeblock-cnr'/>

## Getting Actual Values

To get the actual value from `ThemableColor` or `ThemableFontFamily`, call the `GetActualValue()` method on the corresponding object.

**Example 8: Get Actual Color**

<snippet id='codeblock-cns'/>

**Example 9: Get Actual Font**

<snippet id='codeblock-cnt'/>

## See Also

* [Cell Styles]({%slug radspreadprocessing-features-styling-cell-styles%})
* [Retrieving Themable Cell Color in RadSpreadProcessing]({%slug retrieve-cell-color-radspreadprocessing%})
