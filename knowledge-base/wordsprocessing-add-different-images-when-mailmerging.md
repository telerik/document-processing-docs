---
title: Populate RadFlowDocument with different Images when performing a Mail Merge
description: Learn how to populate a RadFlowDocument with different images while performing a mail merge with RadWordsProcessing.
type: how-to
page_title: Populate RadFlowDocument with different Images when performing a Mail Merge
slug: wordsprocessing-add-different-images-when-mailmerging
position: 0
tags: radwordsprocessing, mailmerge, image, radflowdocument, word, document, processing, docx
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2021.2.507 | RadWordsProcessing |[Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov)|

## Description

This article shows how to populate a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) with different images when you perform a [Mail Merge]({%slug radwordsprocessing-editing-mail-merge%}).

## Solution

The following example demonstrates how to import a document template with the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}). It then iterates an array of custom `Person` elements and inserts different images in the `RadFlowDocument` header ([Headers and Footers]({%slug radspreadprocessing-features-headers-and-footers%})) according to the person's account type while performing a [Mail Merge]({%slug radwordsprocessing-editing-mail-merge%}).

#### __Add Different Images While Mailmerging__

```csharp

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
```

#### __Person Class__

```csharp

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
```

## See Also

* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
* [Mail Merge]({%slug radwordsprocessing-editing-mail-merge%})
* [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%})
