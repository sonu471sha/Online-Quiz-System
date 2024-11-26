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
using System.Configuration;

namespace Quiz
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        //string excelConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source = C:\Users\MG21024\source\repos\Quiz\Quiz\ExcelFile\Book1.xlsx; Extended Properties = 'Excel 12.0 Xml;HDR=YES;'";
        string sqlConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Admin_login.aspx");
            }
            else
            {

                Panel1.Visible = false;
                Panel2.Visible = false;
                Image1.ImageUrl = "./Images/CaptureF.PNG";

            }

            
        }



        //private void ExcelConn(string FilePath)
        //{
        //    file_path = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 12.0 Xml;HDR=YES';""", FilePath);
        //    Econ = new OleDbConnection(file_path);
        //}




        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            string filename = Path.GetFileName(FileUploadControl.FileName);
            string filepath = Server.MapPath("./ExcelFile/") + filename;
            string fileExtension = Path.GetExtension(filename);
            if (FileUploadControl.HasFile)
            {
                if(fileExtension == ".xlsx" || fileExtension == ".xls"){
                    try
                    {
                        FileUploadControl.SaveAs(filepath);

                        //string excelConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source = C:\Users\MG21024\source\repos\Quiz\Quiz\ExcelFile\Book1.xlsx; Extended Properties = 'Excel 12.0 Xml;HDR=YES;'";
                        string excelConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ='" + filepath + "'; Extended Properties = 'Excel 12.0 Xml;HDR=YES;'";
                        try
                        {

                            using (OleDbConnection excelConnection = new OleDbConnection(excelConnectionString))
                            {
                                // Validation before updating excelsheet to database
                                excelConnection.Open();
                                string selectQuery = "SELECT * FROM [Sheet1$]";
                                OleDbCommand excelCommand = new OleDbCommand(selectQuery, excelConnection);
                                OleDbDataReader excelReader = excelCommand.ExecuteReader();
                                DataTable dt;
                                using (OleDbDataAdapter dataAdapter = new OleDbDataAdapter(selectQuery, excelConnection))
                                {
                                    dt = new DataTable();
                                    dataAdapter.Fill(dt);

                                }

                                excelReader.Close();
                                excelConnection.Close();

                                HashSet<object> uniqueValues = new HashSet<object>();
                                bool isQuesUnique = true;
                                foreach (DataRow row in dt.Rows)
                                {
                                    if (uniqueValues.Contains(row[0]))
                                    {
                                        isQuesUnique = false;
                                        break;
                                    }
                                    else
                                    {
                                        uniqueValues.Add(row[0]);
                                    }
                               
                                }

                                

                                bool allRowsNotNull = true;

                                foreach(DataRow row in dt.Rows)
                                {
                                    foreach (var item in row.ItemArray)
                                    {
                                        if(item == null || item == DBNull.Value)
                                        {
                                            allRowsNotNull = false;
                                            break;
                                        }
                                    }
                                }

                                bool areValuesNotEqual = true;

                                foreach (DataRow row in dt.Rows)
                                {

                                    var distintValues = row.ItemArray.Skip(1).Take(4).Distinct();
                                    if (distintValues.Count() !=4)
                                    {
                                        areValuesNotEqual = false;
                                        break;
                                    }
                                    
                               
                                }

                                bool sixcolumn = true;
                                if (dt.Columns.Count != 6)
                                {
                                    sixcolumn = false;
                                }


                                bool hasSpecificValue = true;
                                foreach (DataRow row in dt.Rows)
                                {
                                    List<string> myList = new List<string> { "A", "B", "C", "D" };
                                    if (!myList.Contains(row[5].ToString()))
                                    {
                                        hasSpecificValue = false;
                                        break;
                                    }
                                }

                                bool tes_nam_ntus = true;
                                SqlConnection connec = new SqlConnection(sqlConnectionString);
                                connec.Open();
                                string qry = "SELECT COUNT(*) FROM result WHERE test_name = @tes_nam";
                                SqlCommand comm = new SqlCommand(qry, connec);
                                comm.Parameters.AddWithValue("@tes_nam", TextBox2.Text);
                                int count = (int)comm.ExecuteScalar();

                                connec.Close();

                                if(count > 0)
                                {
                                    tes_nam_ntus = false;
                                }

                                try
                                {
                                    // if test name already exists show an error..
                                    if (!tes_nam_ntus)
                                    {
                                        Label1.Text = "Test name is already used in result data! Please enter a different Test Name";
                                    }

                                    // else update the excelsheet to database..
                                    else if (isQuesUnique && allRowsNotNull && areValuesNotEqual && hasSpecificValue && sixcolumn)
                                    {
                                        string query = "TRUNCATE TABLE ques_book";
                                        using (SqlConnection connection = new SqlConnection(sqlConnectionString))
                                        {
                                            connection.Open();
                                            using (SqlCommand command = new SqlCommand(query, connection))
                                            {
                                                command.ExecuteNonQuery();
                                            }
                                        }

                                        string query2 = "INSERT INTO ques_book (ques, opt1, opt2, opt3, opt4, corr_opt) VALUES (@val_ques, @val_opt1, @val_opt2, @val_opt3, @val_opt4, @val_corr_opt)";

                                        using (SqlConnection connection = new SqlConnection(sqlConnectionString))
                                        {
                                            connection.Open();

                                            SqlCommand command = new SqlCommand(query2, connection);

                                            command.Parameters.Add("@val_ques", SqlDbType.NVarChar);
                                            command.Parameters.Add("@val_opt1", SqlDbType.NVarChar);
                                            command.Parameters.Add("@val_opt2", SqlDbType.NVarChar);
                                            command.Parameters.Add("@val_opt3", SqlDbType.NVarChar);
                                            command.Parameters.Add("@val_opt4", SqlDbType.NVarChar);
                                            command.Parameters.Add("@val_corr_opt", SqlDbType.NVarChar);

                                            foreach (DataRow row in dt.Rows)
                                            {
                                                command.Parameters["@val_ques"].Value = row[0].ToString();
                                                command.Parameters["@val_opt1"].Value = row[1].ToString();
                                                command.Parameters["@val_opt2"].Value = row[2].ToString();
                                                command.Parameters["@val_opt3"].Value = row[3].ToString();
                                                command.Parameters["@val_opt4"].Value = row[4].ToString();
                                                command.Parameters["@val_corr_opt"].Value = row[5].ToString();

                                                command.ExecuteNonQuery();

                                            }

                                            connection.Close();
                                            
                                            string filePath = Server.MapPath("./Text_file/TextFile1.txt");
                                            File.WriteAllText(filePath, "");

                                            string fileContents2 = File.ReadAllText(filePath);
                                            string examname = TextBox2.Text;
                                            fileContents2 = examname + Environment.NewLine + fileContents2;
                                            File.WriteAllText(filePath, fileContents2);

                                            string fileContents1 = File.ReadAllText(filePath);
                                            string examtime = TextBox1.Text;
                                            fileContents1 = examtime + Environment.NewLine + fileContents1;
                                            File.WriteAllText(filePath, fileContents1);

                                            Label1.Text = "Details Saved!";

                                        }
                                        


                                    }
                                    else
                                    {
                                        
                                        File.Delete(filepath);
                                        //Label1.Text = "Upload status: The file could not be uploaded. Please check your Excelsheet for the following conditions: 1) Questions must be Unique. 2) Option in a row must be Unique. 3) Any Cell in the Excelsheet Table should not have a Null Value. 4) Correct Option column can only accept either 'A','B','C' or 'D'. 5) The table in the Excelsheet must have exactly 6 columns. Also check the given example on how a table in an Excelsheet should look.";
                                        Panel2.Visible = false;
                                        Panel1.Visible = true;

                                    }

                                }
                                catch (Exception ex)
                                {
                                    File.Delete(filepath);
                                    Label1.Text = Label1.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                                }

                                
                            }
                        }
                        catch (Exception ex)
                        {
                            File.Delete(filepath);
                            Label1.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                        }
                        
                    }
                    catch (Exception ex)
                    {
                        File.Delete(filepath);
                        Label1.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    }
                }
                else
                {
                    Label1.Text = "Upload status: The file could not be uploaded. Please select a valid excel extension that is either '.xlsx' or 'xls'";
                }
                
            }
            else
            {
                Label1.Text = "Upload status: Please select a file to upload.";
            }

        }



        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}