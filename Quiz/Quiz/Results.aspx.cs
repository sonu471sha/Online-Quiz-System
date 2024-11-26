using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Configuration;




namespace Quiz
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        DataTable table;
        SqlDataAdapter adapter;
        SqlConnection connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Admin_login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    // code to fill result table or data to gridview and run session
                    string sqlConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
                    string query = "SELECT userid, tot_ques, tot_attempt, tot_nt_attempt, tot_corr_anss, tot_wro_anss  FROM result";
                    using (connection = new SqlConnection(sqlConnectionString))
                    {
                        connection.Open();
                        using (adapter = new SqlDataAdapter(query, sqlConnectionString))
                        {
                            table = new DataTable();
                            adapter.Fill(table);
                            GridView1.DataSource = table;
                            GridView1.DataBind();
                            Session["ds"] = table;

                        }

                    }

                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Cache.SetExpires(DateTime.Now);

                }



            }

        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //code being run while downloading excelsheet
            table = (DataTable)Session["ds"];
            GridView1.DataSource = table;
            GridView1.DataBind();
            ExportGridToExcel(GridView1);

            //Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();
            //Microsoft.Office.Interop.Excel.Workbook workbook = excel.Workbooks.Add();
            //Microsoft.Office.Interop.Excel.Worksheet worksheet = (Microsoft.Office.Interop.Excel.Worksheet)workbook.ActiveSheet;

            //int row = 1;
            //int col = 1;
            //foreach (GridViewRow gridViewRow in GridView1.Rows)
            //{
            //    foreach (TableCell tabelCell in gridViewRow.Cells)
            //    {
            //        worksheet.Cells[row, col] = tabelCell.Text;
            //        col++;
            //    }
            //    row++;
            //    col = 1;
            //}

            //string fileName = "TestReport.xlsx";
            //workbook.SaveAs(fileName);
            //workbook.Close();
            //excel.Quit();
            //System.Runtime.InteropServices.Marshal.ReleaseComObject(excel);



        }

        private void ExportGridToExcel(GridView gv)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=TestReport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Table table = new Table();
            TableRow trHeader = new TableRow();
            for (int i = 0; i < gv.HeaderRow.Cells.Count; i++)
            {
                TableHeaderCell tcHeader = new TableHeaderCell();
                tcHeader.Text = gv.HeaderRow.Cells[i].Text;
                trHeader.Cells.Add(tcHeader);
            }

            table.Rows.Add(trHeader);

            for (int i = 0; i < gv.Rows.Count; i++)
            {
                TableRow tr = new TableRow();
                for (int j = 0; j < gv.Rows[i].Cells.Count; j++)
                {
                    TableCell tc = new TableCell();
                    tc.Text = gv.Rows[i].Cells[j].Text;
                    tr.Cells.Add(tc);

                }
                table.Rows.Add(tr);
            }
            table.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();

        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            Update_marks();

        }

        private void Update_marks()
        {
            // code to update marks in gridview
            table = (DataTable)Session["ds"];
            int mark = int.Parse(TextBox1.Text);
            int neg_mark = int.Parse(TextBox2.Text);

            if(!table.Columns.Contains("marks_scored") || !table.Columns.Contains("total_marks"))
            {
                table.Columns.AddRange(new DataColumn[2] { new DataColumn("marks_scored"), new DataColumn("total_marks") });
            }
            

            foreach (DataRow row in table.Rows)
            {
                decimal tot_ques = Convert.ToDecimal(row["tot_ques"]);
                decimal tot_corr = Convert.ToDecimal(row["tot_corr_anss"]);
                decimal tot_wro = Convert.ToDecimal(row["tot_wro_anss"]);

                decimal total_neg_marks = neg_mark * tot_wro;
                decimal total_pos_marks = mark * tot_corr;
                decimal tot_cal_marks = total_pos_marks - total_neg_marks;
                decimal tot_marks = mark * tot_ques;

                row["marks_scored"] = tot_cal_marks;
                row["total_marks"] = tot_marks;

            }
            GridView1.DataSource = table;
            GridView1.DataBind();
        }


        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}