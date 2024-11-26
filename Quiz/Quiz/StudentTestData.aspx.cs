using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Xml.Linq;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text;


namespace Quiz

{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection connectionString = new SqlConnection(ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString);

        //
        //SELECT students.stu_id, students.full_name, result.tot_ques, result.tot_attempt, result.tot_nt_attempt, result.tot_corr_anss, result.tot_wro_anss FROM students, result WHERE students.stu_id = result.stu_id AND students.full_name="manish sharma";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Admin_login.aspx");
            }
            
            else
            {


                string userid = Request.QueryString["userid"];
                string test_name = Request.QueryString["test_name"];

                try
                {
                    // code to fill the selected student result data to a table
                    Session["panel"] = Panel1;
                    using (SqlConnection connectionString = new SqlConnection(ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString))
                    {
                        string query = "SELECT result.userid, students.full_name, result.test_name, result.test_date, result.test_giv_at, result.test_duration, result.tot_ques, result.tot_attempt, result.tot_nt_attempt, result.tot_corr_anss, result.tot_wro_anss FROM students, result WHERE students.userid = result.userid AND students.userid=@userid AND result.test_name=@test_name";
                        //string query = "SELECT students.stu_id, students.full_name";
                        SqlCommand cmd = new SqlCommand(query, connectionString);
                        cmd.Parameters.AddWithValue("@userid", userid);
                        cmd.Parameters.AddWithValue("@test_name", test_name);
                        connectionString.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            User_id.Text = reader["userid"].ToString();
                            Stu_name.Text = reader["full_name"].ToString();
                            Label3.Text = reader["full_name"].ToString();
                            tes_name.Text = reader["test_name"].ToString();
                            tes_date.Text = reader["test_date"].ToString();
                            tes_gvn_time.Text = reader["test_giv_at"].ToString();
                            tes_dura.Text = reader["test_duration"].ToString();
                            No_of_Questions.Text = reader["tot_ques"].ToString();
                            Total_attempt.Text = reader["tot_attempt"].ToString();
                            Total_nt_attempt.Text = reader["tot_nt_attempt"].ToString();
                            Tot_Corrans.Text = reader["tot_corr_anss"].ToString();
                            Tot_Wroans.Text = reader["tot_wro_anss"].ToString();
                            //Label1.Text = reader["tot_corr_anss"].ToString();
                            //Label2.Text = reader["tot_ques"].ToString();
                            

                        }
                        reader.Close();
                    }
                    
                }
                catch (Exception ex)
                {
                    User_id.Text = "Error retrieving data: " + ex.Message;
                    Stu_name.Text = "Error retrieving data: " + ex.Message;
                    tes_name.Text = "Error retrieving data: " + ex.Message;
                    tes_date.Text = "Error retrieving data: " + ex.Message;
                    tes_gvn_time.Text = "Error retrieving data: " + ex.Message;
                    tes_dura.Text = "Error retrieving data: " + ex.Message;
                    No_of_Questions.Text = "Error retrieving data: " + ex.Message;
                    Total_attempt.Text = "Error retrieving data: " + ex.Message;
                    Total_nt_attempt.Text = "Error retrieving data: " + ex.Message;
                    Tot_Corrans.Text = "Error retrieving data: " + ex.Message;
                    Tot_Wroans.Text = "Error retrieving data: " + ex.Message;
                    //Label1.Text = "Error retrieving data: " + ex.Message;
                    //Label2.Text = "Error retrieving data: " + ex.Message;
                }



                //"SELECT * from INNER JOIN result ON students.stu_id = result.stu_id WHERE full_name = @full_name"
                //SqlCommand cmd = new SqlCommand("SELECT * from students WHERE full_name = @full_name", connectionString);
                //cmd.Parameters.AddWithValue("@full_name", full_name);
                //connectionString.Open();
                //SqlDataReader reader = cmd.ExecuteReader();
                //if(reader.Read())
                //{
                //    Stu_pid.Text = reader["stu_id"].ToString();
                //    Stu_name.Text = reader["full_name"].ToString();


                //}
                //reader.Close();

            }

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            // code to add marks to the selected student test data

            Session["panel"] = Panel1;
            int mark = int.Parse(TextBox1.Text);
            int neg_mark = int.Parse(TextBox2.Text);

            int total_marks = mark * int.Parse(No_of_Questions.Text);
            int total_neg_marks = neg_mark * int.Parse(Tot_Wroans.Text);
            int total_pos_marks = mark * int.Parse(Tot_Corrans.Text);

            int tot_cal_marks = total_pos_marks - total_neg_marks;

            Label1.Text = tot_cal_marks.ToString();
            Label2.Text = total_marks.ToString();
            

        }
        


        public void DownloadPdf()
        {
            // code to download student test data in pdf..
            Document document = new Document(PageSize.A4, 10, 10, 10, 10);
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
            Panel1.RenderControl(htmlWriter);
            string htmlContent = stringWriter.ToString();

            MemoryStream outputStream = new MemoryStream();
            TextReader reader = new StringReader(htmlContent);
            PdfWriter writer = PdfWriter.GetInstance(document, outputStream);
            HTMLWorker worker = new HTMLWorker(document);
            document.Open();
            worker.StartDocument();
            worker.Parse(reader);
            worker.EndDocument();
            worker.Close();
            document.Close();

            byte[] pdfBytes = outputStream.ToArray();
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=panel.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(pdfBytes);
            Response.End();

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            //Response.ContentType = "application/pdf";
            //Response.AddHeader("content-disposition", "attachment;filename=Result_report.pdf");
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter hw = new HtmlTextWriter(sw);
            //Panel1.RenderControl(hw);
            //StringReader sr = new StringReader(sw.ToString());
            //Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //PdfWriter
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Session["panel"] = Panel1;
            DownloadPdf();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
