---
title: What is a Cell?
description: Learn about the concept of cells in RadSpreadProcessing worksheets, including their structure and properties.
page_title: What is a Cell?
slug: radspreadprocessing-working-with-cells-what-is-cell
tags: cells, spreadsheet, radspreadprocessing, worksheet, model, concept, structure, properties, xlsx, spread
published: True
position: 0
---

# What is a Cell?



Cells are the basic data units in a worksheet. The following sections describe the structure and characteristics of cells in the document model.
      

## What is a Cell?

A cell is the basic data unit in a worksheet. Cells are organized in rows and columns and can also be referred to as an intersection point of a column and a row. Cells are identified by a letter and number combination that indicates the letter of their column and the number of their row. For example, the top left cell is referred to as `A1` and the bottom right cell is `XFD1048576`.
        

## What Are Its Characteristics?

Cells have the following characteristics:
        

* **Value and Formatting**: A cell serves as a storage unit in a worksheet and you can assign any text, number, Boolean, or formula value to it. Additionally, you can style each cell with various fonts, font sizes, fore and background colors, bold, italics, and underline. Cells also support horizontal and vertical text alignment, indentation, and text rotation settings.
            

* **Fill**: You can style cells with pattern fills with various colors and pattern styles. The model also supports gradient fills that allow you to specify two colors and choose between six shading styles.
            

* **Borders**: Each cell can have left, right, top, bottom, and diagonal borders or any combination of these. Additionally, the borders can appear with different styles and colors.
            

* **Text Wrap**: The text wrapping option formats the cell so that its contained text appears on multiple lines.
            

* **Copy and Paste**: The document model allows you to copy the contents of an arbitrary region of cells and choose the data and formatting to include in the paste region. The model supports seven types of special paste options: All, Formulas, Formulas and Number Formatting, Column Widths, Values, Values and Number Formatting, and Formatting. For more information on the copy/paste feature, see the [Clipboard Support]({%slug radspreadprocessing-features-clipboard-support%}) article.
            

* **Fill Data Automatically**: The document model helps you fill the contents of a specified set of cells automatically based on some initial values. You can repeat or construct linear, exponential, date, and auto fill data series. For more information, see the [Fill Data Automatically]({%slug radspreadprocessing-features-fill-data-automatically-repeat-values%}) section.
            

* **Merge and Unmerge**: You can merge adjacent cells so that they appear as one. A single cell can span over several rows or columns. For more information, refer to the [Merge and Unmerge Cells]({%slug radspreadprocessing-features-merge-unmerge-cells%}) article.
            
