using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Quiz
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Admin_login.aspx");
            }

           

            else
            {
                // code to fill items from ResultCompleteData folder to listview..
                Button1.Enabled = false;
                Button2.Enabled = false;
                GridView1.Visible = false;
                if (!IsPostBack)
                {
                    string folderPath = Server.MapPath("./ResultCompleteData/");
                    string[] fileNames = Directory.GetFiles(folderPath);

                    ListBox1.Items.Clear();

                    foreach (string fileName in fileNames)
                    {
                        ListBox1.Items.Add(Path.GetFileName(fileName));
                    }

                    // add confirm script to button1
                    string confirmMessage = "Are you sure you want to delete the selected items?";
                    string confirmScript = "return confirm('" + confirmMessage + "');";
                    Button1.Attributes.Add("onclick", confirmScript);


                }



            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            // code to remove single item from listview
            string fileName = ListBox1.SelectedItem.Text;
            string filePath = Server.MapPath("./ResultCompleteData/");
            File.Delete(filePath + fileName);
            ListBox1.Items.Remove(fileName);

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            {
                // code to fill selected excel item to gridview..
                int selectedIndex = ListBox1.SelectedIndex;

                if (selectedIndex != -1)
                {
                    // Open the selected Excel file in a GridView control
                    string folderPath = Server.MapPath("./ResultCompleteData/");
                    string filePath = folderPath + ListBox1.Items[selectedIndex].Value;
                    string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties=\"Excel 12.0;HDR=YES;\"";
                    using (OleDbConnection conn = new OleDbConnection(connectionString))
                    {
                        conn.Open();
                        DataTable dt = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            string sheetName = dt.Rows[0]["TABLE_NAME"].ToString();
                            OleDbDataAdapter da = new OleDbDataAdapter("SELECT * FROM [" + sheetName + "]", conn);
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            GridView1.DataSource = ds;
                            GridView1.DataBind();
                            

                        }
                    }
                }
                GridView1.Visible = true;

            }
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            // code to delete selected excel file..
            while (ListBox1.Items.Count > 0)
            {
                string fileName = ListBox1.Items[0].Text;
                string filePath = Server.MapPath("./ResultCompleteData/");
                File.Delete(filePath + fileName);
                ListBox1.Items.RemoveAt(0);
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // code to enable and disable buttons based on listview selection and non selection..
            if (ListBox1.SelectedIndex != -1)
            {
                Button1.Enabled = true;
                Button2.Enabled = true;

            }
            else
            {
                Button1.Enabled = false;
                Button2.Enabled = true;

            }
        }
    }
}