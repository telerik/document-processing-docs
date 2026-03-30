---
title: PortfolioCollection
description: Explore the public API for creating and managing PDF Portfolios with RadPdfProcessing, including schema fields, sorting, collection items, and view modes.
page_title: PortfolioCollection
slug: radpdfprocessing-pdf-portfolio-portfoliocollection
tags: pdf, portfolio, collection, schema, sorting, api, fixed, radfixeddocument
position: 1
---

# PortfolioCollection

This article documents the public API for the PDF Portfolio feature. For an introduction, requirements, and a complete usage example, see the [PDF Portfolio Overview]({%slug radpdfprocessing-pdf-portfolio-overview%}).

## PortfolioCollection

The **PortfolioCollection** class is the top-level object exposed through the **RadFixedDocument.Portfolio** property. It controls whether portfolio mode is active and provides access to the schema, sort settings, and view configuration.

|Property|Type|Description|
|----|----|----|
|**IsEnabled**|bool|Gets or sets a value indicating whether the portfolio presentation is enabled. When true, the document is presented as a PDF Portfolio in compliant viewers.|
|**ViewMode**|[PortfolioViewMode](#portfolioviewmode-enum)|Gets or sets the initial view mode for displaying the portfolio. Default value is **Details**.|
|**InitialDocument**|string|Gets or sets the name of the embedded file to display initially when the portfolio is opened. If null or not found, the container PDF document is displayed.|
|**Schema**|[PortfolioSchema](#portfolioschema)|Gets the schema that defines the fields (columns) displayed for embedded files.|
|**Sort**|[PortfolioSort](#portfoliosort)|Gets the sort settings that define how embedded files are ordered in the portfolio.|

## PortfolioSchema

The **PortfolioSchema** class defines the fields (columns) displayed for embedded files. It implements **IReadOnlyList&lt;[PortfolioField](#portfoliofield)&gt;**.

|Property|Type|Description|
|----|----|----|
|**Count**|int|Gets the number of fields in the schema.|

|Method|Description|
|----|----|
|**AddFileNameField(int order)**|Adds a predefined field for displaying file names. Returns the created [PortfolioField](#portfoliofield).|
|**AddDescriptionField(int order)**|Adds a predefined field for displaying file descriptions. Returns the created [PortfolioField](#portfoliofield).|
|**AddSizeField(int order)**|Adds a predefined field for displaying file sizes. Returns the created [PortfolioField](#portfoliofield).|
|**AddModificationDateField(int order)**|Adds a predefined field for displaying modification dates. Returns the created [PortfolioField](#portfoliofield).|
|**AddCreationDateField(int order)**|Adds a predefined field for displaying creation dates. Returns the created [PortfolioField](#portfoliofield).|
|**AddTextField(string key, string displayName, int order)**|Adds a custom text field to the schema. Returns the created [PortfolioField](#portfoliofield).|
|**AddDateField(string key, string displayName, int order)**|Adds a custom date field to the schema. Returns the created [PortfolioField](#portfoliofield).|
|**AddNumberField(string key, string displayName, int order)**|Adds a custom number field to the schema. Returns the created [PortfolioField](#portfoliofield).|
|**UseDefaultSchema()**|Configures the schema with default fields: file name, description, size, and modification date.|
|**Clear()**|Removes all fields from the schema.|

## PortfolioField

The **PortfolioField** class represents a single field (column) in a PDF Portfolio schema.

|Property|Type|Description|
|----|----|----|
|**Key**|string|Gets the unique key identifying this field in the schema. This key is used to associate field values with embedded files.|
|**DisplayName**|string|Gets or sets the display name shown to the user in the PDF viewer.|
|**FieldType**|[PortfolioFieldType](#portfoliofieldtype-enum)|Gets the type of data stored in this field.|
|**Order**|int|Gets or sets the relative display order of this field in the user interface. Fields are sorted by the viewer in ascending order of this value.|
|**IsVisible**|bool|Gets or sets a value indicating whether this field is visible in the user interface. Default value is **true**.|
|**IsEditable**|bool|Gets or sets a value indicating whether the PDF viewer should support editing this field value. Default value is **false**.|

## PortfolioSort

The **PortfolioSort** class specifies how embedded files are ordered in the portfolio.

|Property|Type|Description|
|----|----|----|
|**SortFields**|IReadOnlyList&lt;string&gt;|Gets the list of field keys used for sorting, in priority order. The first field is the primary sort key; subsequent fields break ties.|
|**Ascending**|IReadOnlyList&lt;bool&gt;|Gets the list of ascending flags corresponding to each sort field. True indicates ascending order; false indicates descending order.|

|Method|Description|
|----|----|
|**AddSortField(string fieldKey, bool ascending)**|Adds a sort field with the specified sort direction. The **fieldKey** must match a field key in the schema. Default direction is ascending.|
|**Clear()**|Clears all sort fields.|

## CollectionItemValues

The **CollectionItemValues** class stores custom metadata values for an embedded file, accessible through the **EmbeddedFile.CollectionItems** property. Each value corresponds to a custom field defined in the portfolio schema.

|Method|Return Type|Description|
|----|----|----|
|**SetText(string key, string value)**|[CollectionSubitem](#collectionsubitem)|Sets a text value for the specified field key. Returns a [CollectionSubitem](#collectionsubitem) that supports an optional **Prefix** property.|
|**SetDate(string key, DateTime value)**|[CollectionSubitem](#collectionsubitem)|Sets a date value for the specified field key. Returns a [CollectionSubitem](#collectionsubitem) that supports an optional **Prefix** property.|
|**SetNumber(string key, double value)**|[CollectionSubitem](#collectionsubitem)|Sets a number value for the specified field key. Returns a [CollectionSubitem](#collectionsubitem) that supports an optional **Prefix** property.|

## CollectionSubitem

The **CollectionSubitem** class represents a single value entry for a collection item field. The **SetText**, **SetDate**, and **SetNumber** methods return a **CollectionSubitem**, enabling a fluent API pattern for setting the optional **Prefix**.

|Property|Type|Description|
|----|----|----|
|**Prefix**|string|Gets or sets a prefix string displayed before the value in the PDF viewer.|

## PortfolioViewMode Enum

The **PortfolioViewMode** enum specifies the initial view mode for a PDF Portfolio.

|Value|Description|
|----|----|
|**Details**|Displays all information in the schema in a multi-column format. This mode provides the most information to the user. This is the default value.|
|**Tile**|Displays each file as a small icon with a subset of schema information. This mode provides top-level information about the file attachments.|
|**Hidden**|The collection view is initially hidden, but users can still access the file list.|

## PortfolioFieldType Enum

The **PortfolioFieldType** enum defines the type of data a portfolio schema field can hold.

|Value|Description|
|----|----|
|**Text**|A text (string) value.|
|**Date**|A date/time value.|
|**Number**|A numeric value.|
|**FileName**|A built-in field representing the file name.|
|**Description**|A built-in field representing the file description.|
|**Size**|A built-in field representing the file size.|
|**ModificationDate**|A built-in field representing the file modification date.|
|**CreationDate**|A built-in field representing the file creation date.|

## See Also

* [PDF Portfolio Overview]({%slug radpdfprocessing-pdf-portfolio-overview%})
* [Embedded File Streams]({%slug radpdfprocessing-embedded-file-streams-overview%})
* [EmbeddedFilesCollection]({%slug radpdfprocessing-embeddedfilescollection%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
