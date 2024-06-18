---
title: Generating Excel Documents from IEnumerable Collections
description: Learn how to create Excel files from IEnumerable Collections using the RadSpreadProcessing library.
type: how-to
page_title: How to generate Excel Documents from IEnumerable Collections 
slug: generate-excel-files-from-ienumerable-collections
tags: radspreadprocessing, document processing, excel, formatting, datatable, ienumerable
res_type: kb
category: knowledge-base
ticketid: 1653503
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article demonstrates a sample approach how to generate Excel documents from IEnumerable collections.

## Solution

RadSpreadProcessing is the perfect fit for the requirement. It is possible to iterate a collection of any custom objects and populate the worksheet's cells with the values coming from the respective fields in the custom objects. A good example how to do it is available in the following code snippet which fills the data in a worksheet from a collection of Employee objects.
This approach can be adapted to any custom collection that can be obtained as an input.

```csharp
        static void Main(string[] args)
        {
            Workbook workbook = new Workbook();
            Worksheet worksheet = workbook.Worksheets.Add();
            worksheet.Name = "Salary Report Q2 2024";
            worksheet.Cells[5, 1].SetValue("Employee's name");
            worksheet.Cells[5, 2].SetValue("Job Position");
            worksheet.Cells[5, 3].SetValue("Hire Date");
            worksheet.Cells[5, 4].SetValue("Salary");
            List<Employee> employees = PopulateWithData();

            //Let’s fill the document with the employee data:

            int startRowIndex = 6;
            for (int i = 0; i < employees.Count; i++)
            {
                worksheet.Cells[startRowIndex + i, 1].SetValue(employees[i].Name);
                worksheet.Cells[startRowIndex + i, 2].SetValue(employees[i].JobPosition.ToString());
                worksheet.Cells[startRowIndex + i, 3].SetValue(employees[i].HireDate);
                worksheet.Cells[startRowIndex + i, 4].SetValue(employees[i].Salary);
            }

            //Add a total salary row for each job position and one total row for all salaries. 
            worksheet.Cells[16, 1].SetValue("Developers' salaries");
            worksheet.Cells[17, 1].SetValue("QAs' salaries");
            worksheet.Cells[18, 1].SetValue("Managers' salaries");
            worksheet.Cells[19, 1].SetValue("Total salaries");

            worksheet.Cells[16, 4].SetValue("=SumIf(C7:C15,\"" + JobPosition.Developer.ToString() + "\",E7:E15)");
            worksheet.Cells[17, 4].SetValue("=SumIf(C7:C15,\"" + JobPosition.QA.ToString() + "\",E7:E15)");
            worksheet.Cells[18, 4].SetValue("=SumIf(C7:C15,\"" + JobPosition.Manager.ToString() + "\",E7:E15)");
            worksheet.Cells[19, 4].SetValue("=Sum(E7:E15)");

            //Add a document title. 
            CellSelection departmentNameCells = worksheet.Cells[1, 1, 1, 4];
            departmentNameCells.Merge();
            departmentNameCells.SetValue("Telerik Document Processing");
            departmentNameCells.SetHorizontalAlignment(RadHorizontalAlignment.Left);

            CellSelection salaryReportCells = worksheet.Cells[2, 1, 2, 4];
            salaryReportCells.Merge();
            salaryReportCells.SetValue("Salaries Report");
            salaryReportCells.SetHorizontalAlignment(RadHorizontalAlignment.Right);

            CellSelection periodCells = worksheet.Cells[3, 1, 3, 4];
            periodCells.Merge();
            periodCells.SetValue("for the Q2 2024 period");
            periodCells.SetHorizontalAlignment(RadHorizontalAlignment.Right);

            worksheet.Columns[worksheet.UsedCellRange].AutoFitWidth();

            IWorkbookFormatProvider formatProvider = new XlsxFormatProvider();
            string filePath = @"FinalSpreadsheet.xlsx";
            using (FileStream output = new FileStream(filePath, FileMode.Create))
            {
                formatProvider.Export(workbook, output);
            }
            Process.Start(new ProcessStartInfo() { FileName = filePath, UseShellExecute = true });
        } 
        private static List<Employee> PopulateWithData()
        {
            List<Employee> employees = new List<Employee>();
            employees.Add(new Employee("Michael Brown", JobPosition.Developer, new DateTime(2005, 1, 20), 3400));
            employees.Add(new Employee("James Hammer", JobPosition.Manager, new DateTime(2001, 2, 14), 4800));
            employees.Add(new Employee("Amanda Johns", JobPosition.QA, new DateTime(2008, 7, 30), 2600));
            employees.Add(new Employee("Daniel Bolton", JobPosition.Developer, new DateTime(2012, 4, 24), 2900));
            employees.Add(new Employee("Lucas Smith", JobPosition.Manager, new DateTime(2007, 2, 12), 4100));
            employees.Add(new Employee("George Stones", JobPosition.QA, new DateTime(2009, 5, 6), 2850));
            employees.Add(new Employee("Victoria Sloane", JobPosition.Manager, new DateTime(2004, 8, 31), 3150));
            employees.Add(new Employee("Patrick Holmes", JobPosition.Developer, new DateTime(2001, 9, 18), 4200));
            employees.Add(new Employee("Thomas Porter", JobPosition.Developer, new DateTime(2006, 4, 12), 3450));
            return employees;
        }

        public class Employee
        {
            public string Name { get; set; }

            public JobPosition JobPosition { get; set; }

            public DateTime HireDate { get; set; }

            public double Salary { get; set; }

            public Employee(string name, JobPosition jobPosition, DateTime hireDate, double salary)
            {
                this.Name = name;
                this.JobPosition = jobPosition;
                this.HireDate = hireDate;
                this.Salary = salary;
            }
        }

        public enum JobPosition
        {
            Developer,
            QA,
            Manager
        }
```

## See Also

- [RadSpreadProcessing]({%slug radspreadprocessing-overview%})
- [Getting Started with RadSpreadProcessing Volume 1](https://www.telerik.com/blogs/getting-started-with-radspreadprocessing-volume-1)
- [Getting Started with RadSpreadProcessing Volume 2](https://www.telerik.com/blogs/getting-started-with-radspreadprocessing-vol2)
- [Getting Started with RadSpreadProcessing Vol3](https://www.telerik.com/blogs/getting-started-with-radspreadprocessing-vol3)
