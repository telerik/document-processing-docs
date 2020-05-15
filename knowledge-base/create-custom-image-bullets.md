---
title: Create Custom Image Bullets
description: Create Custom Image Bullets
type: how-to
page_title: Create Custom Image Bullets
slug: create-custom-image-bullets
position: 0
tags: bullets, image, listlevel, bulletnumbering, bulletnumberingformat
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>2020.1.316</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

How to create a custom [ListLevel](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Lists.ListLevel.html) with custom bullets containing images.

## Solution

This functionality could be achieved by creating a custom class implementing [IBulletNumberingFormat](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Lists.IBulletNumberingFormat.html) and passing it to [BulletNumberingFormat](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Lists.ListLevel.html#collapsible-Telerik_Windows_Documents_Fixed_Model_Editing_Lists_ListLevel_BulletNumberingFormat) property of the [ListLevel](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Lists.ListLevel.html) class.

#### __C#__

{{region kb-create-custom-image-bullets1}}

	RadFixedDocument document = new RadFixedDocument();

	Table table = new Table();
	TableRow firstRow = table.Rows.AddTableRow();
	TableCell tableCell = firstRow.Cells.AddTableCell();

	List list = this.GetCustomBullet();

	Block block1 = tableCell.Blocks.AddBlock();
	block1.SetBullet(list, 0);
	block1.InsertText("Sample block text 1");

	Block block2 = tableCell.Blocks.AddBlock();
	block2.SetBullet(list, 0);
	block2.InsertText("Sample block text 2");

	Block block3 = tableCell.Blocks.AddBlock();
	block3.SetBullet(list, 0);
	block3.InsertText("Sample block text 3");

	RadFixedDocumentEditor editor = new RadFixedDocumentEditor(document);
	editor.InsertTable(table);
 
{{endregion}}

#### __C#__ Create custom image numbering bullet

{{region kb-create-custom-image-bullets2}}

	private List GetCustomBullet()
	{
		List list = new List();

		for (int i = 0; i < 3; i++)
		{
			ListLevel level = list.Levels.AddListLevel();
			level.ParagraphProperties.FirstLineIndent = -72;
			level.ParagraphProperties.LeftIndent = 0;
			int currentLevelIndex = i;

			level.BulletNumberingFormat = new CustomBullet((indexer) =>
			{
				Image image = new Image();

				for (int levelIndex = 0; levelIndex <= currentLevelIndex; levelIndex++)
				{
					image = new Image() { Width = 25, Height = 25 };
					using (Stream stream = new FileStream($"Images/Image{indexer.GetCurrentIndex(levelIndex)}.png", FileMode.Open))
					{
						image.ImageSource = new Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource(stream);
					}
				}

				return image;
			});
		}

		return list;
	}

{{endregion}}

#### __C#__ Creating a custom class implementing IBulletNumberingFormat

{{region kb-create-custom-image-bullets2}}

	internal class CustomBullet : IBulletNumberingFormat
    {
        private readonly Func<IListLevelsIndexer, Image> getBullet;

        public CustomBullet(Func<IListLevelsIndexer, Image> getBullet)
        {
            this.getBullet = getBullet;
        }

        public PositionContentElement GetBulletNumberingElement(IListLevelsIndexer listLevelsIndexer)
        {
            Image positionContentElement = this.getBullet(listLevelsIndexer);
            return positionContentElement;
        }
    }
	
{{endregion}}
