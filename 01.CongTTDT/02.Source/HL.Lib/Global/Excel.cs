using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Aspose.Cells;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib
{
    public class Excel
    {
        public static void Export(List<List<object>> list, int start_row, string oldExcelFile, string newExcelFile)
        {
            if (list == null || !System.IO.File.Exists(oldExcelFile))
                return;

            Workbook workbook = new Workbook();
            workbook.Open(oldExcelFile);

            Cells cells = workbook.Worksheets[0].Cells;

            for (int i = 0; i < list.Count; i++)
            {
                for (int j = 0; j < list[i].Count; j++)
                {
                    cells[start_row + i, j].PutValue(list[i][j]);
                }
            }
            workbook.Save(newExcelFile);
            //Error.Write("sau khi save");
        }

        public static int ImportExcel(string file)
        {
            Workbook workbook = new Workbook();
            if (file.EndsWith(".xls") || file.EndsWith(".xlsx"))
                workbook.Open(file);
            ModIncidentEntity item = null;
            //save data
            string key = string.Empty;
            int count = 0;
            try
            {
                for (int i = 1; workbook.Worksheets[0] != null && i < workbook.Worksheets[0].Cells.Rows.Count; i++)
                {
                    count++;
                    item = new ModIncidentEntity();
                    item.Name = workbook.Worksheets[0].Cells[i, 0].Value.ToString();
                    item.Code = Data.GetCode(item.Name);
                    //item.Address = workbook.Worksheets[0].Cells[i, 1].Value.ToString();
                    //item.Phone = workbook.Worksheets[0].Cells[i, 3].Value.ToString();
                    //item.Fax = workbook.Worksheets[0].Cells[i, 4].Value.ToString();
                    //item.License = workbook.Worksheets[0].Cells[i, 5].Value.ToString();
                    //item.Create = workbook.Worksheets[0].Cells[i, 6].Value.ToString();
                    //item.AccNumber = workbook.Worksheets[0].Cells[i, 7].Value.ToString();
                    //item.Website = workbook.Worksheets[0].Cells[i, 8].Value.ToString();
                    //item.Email = workbook.Worksheets[0].Cells[i, 9].Value.ToString();
                    //item.Director = workbook.Worksheets[0].Cells[i, 10].Value.ToString();
                    //item.Mobile = workbook.Worksheets[0].Cells[i, 11].Value.ToString();
                    //item.EmailD = workbook.Worksheets[0].Cells[i, 12].Value.ToString();
                    ModIncidentService.Instance.Save(item);
                }
            }
            catch (Exception ex)
            { Error.Write(ex.Message); }
            return count;
        }

    }
}
