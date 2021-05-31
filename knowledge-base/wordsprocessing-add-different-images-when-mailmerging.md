---
title: Populate RadFlowDocument with different Images when performing a Mail Merge
description: This knowledge base article describes how to populate a RadFlowDocument with different images while performing a Mail Merge
type: how-to
page_title: Populate RadFlowDocument with different Images when performing a Mail Merge
slug: wordsprocessing-add-different-images-when-mailmerging
position: 0
tags: word, processing, insert, image, radflowdocument, mailmerging, mail, merge
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
		<td>2021.2.507</td>
		<td>WordsPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

This article describes how to populate a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) with different Images when performing a [Mail Merge]({%slug radwordsprocessing-editing-mail-merge%}).

## Solution

The following example demonstrates how to import a document template using the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}). Then by iterating an array of custom Person elements to implement the logic for inserting differing images in the RadFlowDocument's header ([Headers and Footers]({%slug radspreadprocessing-features-headers-and-footers%})) according to the Person's Account type while performing a [Mail Merge]({%slug radwordsprocessing-editing-mail-merge%}).

#### __[C#] Add Different Images While Mailmerging__

{{region wordsprocessing-add-different-images-when-mailmerging1}}

	private const string DevCraftUltimate = "DevCraft Ultimate";
	private const string Trial = "Trial";

	private static void Main()
	{
		RadFlowDocument template;
		DocxFormatProvider provider = new();

		using (FileStream stream = File.OpenRead("Template.docx"))
		{
			template = provider.Import(stream);
		}

		Person[] personsList = new Person[]
		{
			new Person(name: "John Doe", account: Trial, renewalDate: new DateTime(2021, 4, 2, 8, 30, 52)),
			new Person(name: "Georgia Dunn", account: DevCraftUltimate, renewalDate: new DateTime(2019, 4, 2, 8, 30, 52)),
			new Person(name: "David French", account: DevCraftUltimate, renewalDate: new DateTime(2020, 5, 1, 8, 30, 52)),
		};

		foreach (Person person in personsList)
		{
			// The MailMerge method is expecting a collection of IEnumerable
			RadFlowDocument resultDocument = template.MailMerge(new Person[] { person });

			ImageInline imageInline = new(resultDocument);
			ImageSource imageSource = default;
			if (person.Account == DevCraftUltimate)
			{
				imageSource = new ImageSource(File.OpenRead("Images/Progress_DevCraft_Ultimate.png"), "png");
			}
			else if (person.Account == Trial)
			{
				imageSource = new ImageSource(File.OpenRead("Images/Progress_DevCraft.png"), "png");
			}

			imageInline.Image.ImageSource = imageSource;
			
			Header header = resultDocument.Sections.First().Headers.Add(HeaderFooterType.Default);
			Paragraph headerParagraph = header.Blocks.AddParagraph();
			headerParagraph.Inlines.Add(imageInline);

			string resultFileName = $"result_{person.Name}.docx";
			using (FileStream output = File.OpenWrite(resultFileName))
			{
				provider.Export(resultDocument, output);
			}

			Process.Start(new ProcessStartInfo() { FileName = resultFileName, UseShellExecute = true });
		}
	}
{{endregion}}

#### __[C#] Person class__

{{region wordsprocessing-add-different-images-when-mailmerging2}}

	public class Person
    {
        public string Name
        {
            get; set;
        }

        public string Account
        {
            get; set;
        }

        public DateTime RenewalDate
        {
            get; set;
        }

        public Person(string name, string account, DateTime renewalDate)
        {
            this.Name = name;
            this.Account = account;
            this.RenewalDate = renewalDate;
        }
    }
{{endregion}}
