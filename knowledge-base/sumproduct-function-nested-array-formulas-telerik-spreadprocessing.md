---
title: Implementing SUMPRODUCT Function in SpreadProcessing
description: Explains how to implement a custom SUMPRODUCT function in Telerik SpreadProcessing for results similar to Excel.
type: how-to
page_title: SUMPRODUCT Function Implementation in Telerik SpreadProcessing
meta_title: SUMPRODUCT Function Implementation  in Telerik SpreadProcessing
slug: sumproduct-function-nested-array-formulas-telerik-spreadprocessing
tags: spread, processing, formula, custom, function, sumproduct, array
res_type: kb
ticketid: 1694608
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to implement a custom [SUMPRODUCT](https://support.microsoft.com/en-us/office/sumproduct-function-16753e75-9f68-4874-94ac-4d2145a2fd2e) function in [RadSpreadProcessing]({%slug radspreadprocessing-overview%}).  

## Solution

Follow the steps:

1. Register your custom SUMPRODUCT function using the `FunctionManager.RegisterFunction()` method.

2. Implement your custom function as shown below. Ensure it handles simple array inputs correctly.

```csharp
    internal class Program
    {
        static void Main(string[] args)
        {
            FunctionManager.RegisterFunction(new SumProduct());

            Workbook workbook = new Workbook();
            workbook.Worksheets.Add(); // Sheet1 
            Worksheet worksheet = workbook.Worksheets[0];
            worksheet.Cells[ 0,0].SetValue("=SUMPRODUCT({ 1,2,3}, { 4,5,6})"); //A1=32
            CellSelection cell = worksheet.Cells[0, 0];
            ICellValue cellValue = cell.GetValue().Value;
            CellValueFormat cellFormat = cell.GetFormat().Value;
            string formattedValue = cellValue.GetResultValueAsString(cellFormat);
            Debug.WriteLine(formattedValue);


            string fileName = "SampleFile.xlsx";
            System.IO.File.Delete(fileName);
            Telerik.Windows.Documents.Spreadsheet.FormatProviders.IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

            using (Stream output = new FileStream(fileName, FileMode.Create))
            {
                formatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
            }
            Process.Start(new ProcessStartInfo() { FileName = fileName, UseShellExecute = true });
        }
    }

    public class SumProduct : FunctionWithArguments
    {
        private static readonly string _name = "SUMPRODUCT";
        private static readonly FunctionInfo _info;

        static SumProduct()
        {
            string description = "The SUMPRODUCT function returns the sum of the products of corresponding ranges or arrays.";
            string descriptionLocalizationKey = "Spreadsheet_Functions_SumProduct_Info";
            IEnumerable<ArgumentInfo> requiredArguments = new ArgumentInfo[]
            {
            new ArgumentInfo("Array1", "The first array argument whose components you want to multiply and then add.", ArgumentType.Array, isRequired: true, "Spreadsheet_Functions_Args_Array", "Spreadsheet_Functions_SumProduct_Array"),
            };

            IEnumerable<ArgumentInfo> optionalArguments = new ArgumentInfo[]
            {
            new ArgumentInfo("ArrayX", "The array argument whose components you want to multiply and then add.", ArgumentType.Array, isRequired: true, "Spreadsheet_Functions_Args_Array", "Spreadsheet_Functions_SumProduct_Array"),
            };

            _info = new FunctionInfo(_name, FunctionCategory.Statistical, description, requiredArguments, optionalArguments, 254, false, descriptionLocalizationKey);
        }

        public override string Name => _name;

        public override FunctionInfo FunctionInfo => _info;

        protected override RadExpression EvaluateOverride(FunctionEvaluationContext<object> context)
        {
            double result = 0;
                List<ArrayExpression> arrayExpressions = new List<ArrayExpression>();
                foreach (ArrayExpression array in context.Arguments)
                {
                    arrayExpressions.Add(array);
                }

                int nbElements = arrayExpressions.First().Count();
                if (!arrayExpressions.Any(a => a.Count() != nbElements))
                {
                    List<double> values = new List<double>(nbElements);
                    for (int i = 0; i < nbElements; i++)
                    {
                        values.Add(1);
                    }

                    for (int i = 0; i < values.Count; i++)
                    {
                        for (int j = 0; j < arrayExpressions.Count; j++)
                        {
                            string value = arrayExpressions[j].Value.ElementAt(i).ToString();
                            if (double.TryParse(value, out double doubleValue))
                            {
                                values[i] *= doubleValue;
                            }
                            else
                            {
                                values[i] = 0;
                            }
                        }
                    }

                    result = values.Sum();
                }

            return new NumberExpression(result);
        }
    }
```

## See Also

- [Functions]({%slug radspreadprocessing-features-formulas-functions%})
- [Custom Functions]({%slug radspreadprocessing-features-formulas-custom-functions%})
