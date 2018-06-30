using System.Collections.Generic;
using System.IO;

namespace HL.Lib
{
    public class Pdf
    {
        public static void Export(List<List<object>> list, int start_row, string oldExcelFile, string newExcelFile)
        {
            // Instantiate an object PDF class
            Aspose.Pdf.Generator.Pdf pdf = new Aspose.Pdf.Generator.Pdf();
            // add the section to PDF document sections collection
            Aspose.Pdf.Generator.Section section = pdf.Sections.Add();

            // Read the contents of HTML file into StreamReader object
            StreamReader r = System.IO.File.OpenText(@"D:/pdftest/HTML2pdf.html");
            //Create text paragraphs containing HTML text
            Aspose.Pdf.Generator.Text text2 = new Aspose.Pdf.Generator.Text(section, r.ReadToEnd());
            // enable the property to display HTML contents within their own formatting
            text2.IsHtmlTagSupported = true;
            //Add the text paragraphs containing HTML text to the section
            section.Paragraphs.Add(text2);
            // Specify the URL which serves as images database
            pdf.HtmlInfo.ImgUrl = "D:/pdftest/MemoryStream/";

            //Save the pdf document
            pdf.Save("D:/pdftest/MemoryStream/HTML2pdf.pdf");
        }

    }
}
