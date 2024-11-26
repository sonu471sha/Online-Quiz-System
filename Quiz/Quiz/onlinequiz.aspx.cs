using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient; 
using System.Configuration;
using System.Timers;
using System.Web.Services;
using System.Drawing;
using System.IO;
using System.Text;




namespace Quiz
{
    public partial class onlinequiz : System.Web.UI.Page
    {
        DataTable dt;
        int i { get; set; }
        SqlDataAdapter sda;
        SqlConnection con;
        public int t_q = 0;
        public int exam_time = 0;



          protected void Page_Load(object sender, EventArgs e)
          {
            if (Session["userid"] == null)
            {

                Response.Redirect("Login.aspx");

            }

            else
            {
                // Exam time and test name is being taken from text file
                string filePath = Server.MapPath("./Text_file/TextFile1.txt");
                using (StreamReader reader = new StreamReader(filePath))
                {
                    string exa_time = reader.ReadLine();
                    string exa_nam = reader.ReadLine();

                    Label4.Text = exa_nam;
                    exam_time = int.Parse(exa_time);

                }

                string ConnectionStr = (ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString);
                string query = "SELECT COUNT(*) FROM ques_book;";

                using (SqlConnection con = new SqlConnection(ConnectionStr))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        int rowCount = (int)command.ExecuteScalar();
                        t_q = rowCount;
                        //Page.ClientScript.RegisterStartupScript(Type.GetType("System.String"), "addScript", "showTab(" + rowCount + ");", true);
                        ////string html = $"<script> var t_q = {t_q}; </script>";
                    }
                    con.Close();
                }


                try
                {

                    i = -1;
                    if (!IsPostBack)
                    {
                        // question are being saved to temporary datatable
                        DataTable dt_temp = new DataTable();
                        dt = new DataTable();

                        DataColumn q_id = new DataColumn();
                        q_id.DataType = typeof(Int32);
                        q_id.ColumnName = "q_id";
                        q_id.AutoIncrement = true;
                        q_id.AutoIncrementSeed = 1;
                        q_id.AutoIncrementStep = 1;

                        dt.Columns.Add(q_id);



                        //DataColumn userans = new DataColumn("UserAns");
                        //userans.DefaultValue = "";
                        //dt.Columns.Add(userans);

                        // question are being randomized
                        con = new SqlConnection();
                        con.ConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
                        con.Open();
                        sda = new SqlDataAdapter("select * from ques_book", con);
                        sda.Fill(dt_temp);

                        foreach (DataColumn column in dt_temp.Columns)
                        {
                            dt.Columns.Add(column.ColumnName, column.DataType);
                        }

                        List<int> randomRowsIndexes = new List<int>();

                        for (int j=0; j<dt_temp.Rows.Count; j++)
                        {
                            randomRowsIndexes.Add(j);
                        }

                        randomRowsIndexes = randomRowsIndexes.OrderBy(x => Guid.NewGuid()).ToList();

                        foreach (int rowIndex in randomRowsIndexes)
                        {
                            DataRow row = dt_temp.Rows[rowIndex];
                            dt.ImportRow(row);
                        }

                        // column to add user answer -- final and not final
                        dt.Columns.AddRange(new DataColumn[2] { new DataColumn("UserAns"), new DataColumn("UserAns_F") });
                        dt.Columns["UserAns"].DefaultValue = "";
                        dt.Columns["UserAns_F"].DefaultValue = "";


                        Session["ind"] = i;
                        Session["ds"] = dt;
                        con.Close();
                        FetchQANext();


                        DateTime currentDate = DateTime.Today;
                        string formattedDate = currentDate.ToString("dd-MM-yyyy");
                        Label6.Text = formattedDate;

                        string formattedTime = DateTime.Now.ToString("hh:mm:ss tt");
                        Label9.Text = formattedTime;



                        Label10.BackColor = SystemColors.Control;
                        Label10.BorderWidth = 2;
                        Label11.BackColor = Color.DarkGray;
                        Label11.BorderWidth = 2;
                        Label12.BackColor = Color.BlueViolet;
                        Label12.BorderWidth = 2;
                        Label13.BackColor = Color.ForestGreen;
                        Label13.BorderWidth = 2;


                        Label15.Text = (string)Session["userid"];





                    }



                }
                catch (Exception e1)
                {
                    Response.Write(e1.Message);
                    
                }


            }
            
        }


        private Button findbutton(int i)
        {
            // buttons linked with question number
            Button b = null;
            if(i == 0)
            {
                b = btn_Q1;
            }
            if (i == 1)
            {
                b = btn_Q2;
            }
            if (i == 2)
            {
                b = btn_Q3;
            }
            if (i == 3)
            {
                b = btn_Q4;
            }
            if (i == 4)
            {
                b = btn_Q5;
            }
            if (i == 5)
            {
                b = btn_Q6;
            }
            if (i == 6)
            {
                b = btn_Q7;
            }
            if (i == 7)
            {
                b = btn_Q8;
            }
            if (i == 8)
            {
                b = btn_Q9;
            }
            if (i == 9)
            {
                b = btn_Q10;
            }
            if (i == 10)
            {
                b = btn_Q11;
            }
            if (i == 11)
            {
                b = btn_Q12;
            }
            if (i == 12)
            {
                b = btn_Q13;
            }
            if (i == 13)
            {
                b = btn_Q14;
            }
            if (i == 14)
            {
                b = btn_Q15;
            }
            if (i == 15)
            {
                b = btn_Q16;
            }
            if (i == 15)
            {
                b = btn_Q16;
            }
            if (i == 16)
            {
                b = btn_Q17;
            }
            if (i == 17)
            {
                b = btn_Q18;
            }
            if (i == 18)
            {
                b = btn_Q19;
            }
            if (i == 19)
            {
                b = btn_Q20;
            }
            if (i == 20)
            {
                b = btn_Q21;
            }
            if (i == 21)
            {
                b = btn_Q22;
            }
            if (i == 22)
            {
                b = btn_Q23;
            }
            if (i == 23)
            {
                b = btn_Q24;
            }
            if (i == 24)
            {
                b = btn_Q25;
            }
            if (i == 25)
            {
                b = btn_Q26;
            }
            if (i == 26)
            {
                b = btn_Q27;
            }
            if (i == 27)
            {
                b = btn_Q28;
            }
            if (i == 28)
            {
                b = btn_Q29;
            }
            if (i == 29)
            {
                b = btn_Q30;
            }
            if (i == 30)
            {
                b = btn_Q31;
            }
            if (i == 31)
            {
                b = btn_Q32;
            }
            if (i == 32)
            {
                b = btn_Q33;
            }
            if (i == 33)
            {
                b = btn_Q34;
            }
            if (i == 34)
            {
                b = btn_Q35;
            }
            if (i == 35)
            {
                b = btn_Q36;
            }
            if (i == 36)
            {
                b = btn_Q37;
            }
            if (i == 37)
            {
                b = btn_Q38;
            }
            if (i == 38)
            {
                b = btn_Q39;
            }
            if (i == 39)
            {
                b = btn_Q40;
            }
            if (i == 40)
            {
                b = btn_Q41;
            }
            if (i == 41)
            {
                b = btn_Q42;
            }
            if (i == 42)
            {
                b = btn_Q43;
            }
            if (i == 43)
            {
                b = btn_Q44;
            }
            if (i == 44)
            {
                b = btn_Q45;
            }
            if (i == 45)
            {
                b = btn_Q46;
            }
            if (i == 46)
            {
                b = btn_Q47;
            }
            if (i == 47)
            {
                b = btn_Q48;
            }
            if (i == 48)
            {
                b = btn_Q49;
            }
            if (i == 49)
            {
                b = btn_Q50;
            }
            if (i == 50)
            {
                b = btn_Q51;
            }
            if (i == 51)
            {
                b = btn_Q52;
            }
            if (i == 52)
            {
                b = btn_Q53;
            }
            if (i == 53)
            {
                b = btn_Q54;
            }
            if (i == 54)
            {
                b = btn_Q55;
            }
            if (i == 55)
            {
                b = btn_Q56;
            }
            if (i == 56)
            {
                b = btn_Q57;
            }
            if (i == 57)
            {
                b = btn_Q58;
            }
            if (i == 58)
            {
                b = btn_Q59;
            }
            if (i == 59)
            {
                b = btn_Q60;
            }
            if (i == 60)
            {
                b = btn_Q61;
            }
            if (i == 61)
            {
                b = btn_Q62;
            }
            if (i == 62)
            {
                b = btn_Q63;
            }
            if (i == 3)
            {
                b = btn_Q4;
            }
            if (i == 64)
            {
                b = btn_Q65;
            }
            if (i == 65)
            {
                b = btn_Q66;
            }
            if (i == 66)
            {
                b = btn_Q67;
            }
            if (i == 67)
            {
                b = btn_Q68;
            }
            if (i == 68)
            {
                b = btn_Q69;
            }
            if (i == 69)
            {
                b = btn_Q70;
            }
            if (i == 70)
            {
                b = btn_Q71;
            }
            if (i == 71)
            {
                b = btn_Q72;
            }
            if (i == 72)
            {
                b = btn_Q73;
            }
            if (i == 73)
            {
                b = btn_Q74;
            }
            if (i == 74)
            {
                b = btn_Q75;
            }
            if (i == 75)
            {
                b = btn_Q76;
            }
            if (i == 76)
            {
                b = btn_Q77;
            }
            if (i == 77)
            {
                b = btn_Q78;
            }
            if (i == 78)
            {
                b = btn_Q79;
            }
            if (i == 79)
            {
                b = btn_Q80;
            }
            if (i == 80)
            {
                b = btn_Q81;
            }
            if (i == 81)
            {
                b = btn_Q82;
            }
            if (i == 82)
            {
                b = btn_Q83;
            }
            if (i == 83)
            {
                b = btn_Q84;
            }
            if (i == 84)
            {
                b = btn_Q85;
            }
            if (i == 85)
            {
                b = btn_Q86;
            }
            if (i == 86)
            {
                b = btn_Q87;
            }
            if (i == 87)
            {
                b = btn_Q88;
            }
            if (i == 88)
            {
                b = btn_Q89;
            }
            if (i == 89)
            {
                b = btn_Q90;
            }
            if (i == 90)
            {
                b = btn_Q91;
            }
            if (i == 91)
            {
                b = btn_Q92;
            }
            if (i == 92)
            {
                b = btn_Q93;
            }
            if (i == 93)
            {
                b = btn_Q94;
            }
            if (i == 94)
            {
                b = btn_Q95;
            }
            if (i == 95)
            {
                b = btn_Q96;
            }
            if (i == 96)
            {
                b = btn_Q97;
            }
            if (i == 97)
            {
                b = btn_Q98;
            }
            if (i == 98)
            {
                b = btn_Q99;
            }
            if (i == 99)
            {
                b = btn_Q100;
            }

            return b;
        }


        private void chk_Change(DataTable dt,int i,string op)
        {
            DataRow dr = dt.Rows[i];
            dr["UserAns"] = op;
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            FetchQANext();
            
            
        }
       
        private void FetchQANext()
        {

            i = (int)Session["ind"];
            if (i< (t_q-1))
            {
                i = i + 1;
                dt = (DataTable)Session["ds"];
                DataRow dr = dt.Rows[i];
                userans(dt, i);
                Qno.Text = dr["q_id"].ToString();
                QD.Text = dr["ques"].ToString();
                A.Text = dr["opt1"].ToString();
                B.Text = dr["opt2"].ToString();
                C.Text = dr["opt3"].ToString();
                D.Text = dr["opt4"].ToString();

                Session["ind"] = i;

            }
        
            
        }

        private void clearRadio()
        {
            A.Checked = false;
            B.Checked = false;
            C.Checked = false;
            D.Checked = false;
        }


        private void userans(DataTable dt, int i)
        {
            //user ans being saved to datatable
            clearRadio();
            DataRow dr = dt.Rows[i];
            if(dr["UserAns"].ToString()=="")
            {

            }
            
            else
            {

                if (dr["UserAns"].ToString() == "A")
                {
                    A.Checked = true;
                }
                
                if (dr["UserAns"].ToString() == "B")
                {
                    B.Checked = true;
                }
                if (dr["UserAns"].ToString() == "C"){
                    C.Checked = true;
                }
                if (dr["UserAns"].ToString() == "D"){
                    D.Checked = true;
                }
            }

        }


        protected void btn_Previous_Click(object sender, EventArgs e)
        {
            FetchQAPrevious();
        }


        private void FetchQAPrevious()
        {
            i = (int)Session["ind"];
            if (i >= 1)
            {
                i = i - 1;
                dt = (DataTable)Session["ds"];
                DataRow dr = dt.Rows[i];
                userans(dt, i);
                Qno.Text = dr["q_id"].ToString();
                QD.Text = dr["ques"].ToString();
                A.Text = dr["opt1"].ToString();
                B.Text = dr["opt2"].ToString();
                C.Text = dr["opt3"].ToString();
                D.Text = dr["opt4"].ToString();

                Session["ind"] = i;

            }
        }
        protected void btn_Q1_Click(object sender, EventArgs e)
        {
            // loading question based on question number
            clearRadio();
            int x;
            Button b = (Button)sender;

            x = int.Parse(b.Text);
            i = x - 1;
            dt = (DataTable)Session["ds"];
            DataRow dr = dt.Rows[i];
            Qno.Text = dr["q_id"].ToString();
            QD.Text = dr["ques"].ToString();
            A.Text = dr["opt1"].ToString();
            B.Text = dr["opt2"].ToString();
            C.Text = dr["opt3"].ToString();
            D.Text = dr["opt4"].ToString();

            userans(dt, i);
            Session["ind"] = i;
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            // A CheckedChanged...
            i = (int)Session["ind"];
            dt = (DataTable)Session["ds"];
            chk_Change(dt, i, "A");
            DataRow dr = dt.Rows[i];
            dr["UserAns_F"] = "";
            Button btnObj = findbutton(i);
            btnObj.BackColor = System.Drawing.Color.DarkGray;
            btnObj.ForeColor = System.Drawing.Color.White;

        }

        protected void B_CheckedChanged(object sender, EventArgs e)
        {
            i = (int)Session["ind"];
            dt = (DataTable)Session["ds"];
            chk_Change(dt, i, "B");
            DataRow dr = dt.Rows[i];
            dr["UserAns_F"] = "";
            Button btnObj = findbutton(i);
            btnObj.BackColor = System.Drawing.Color.DarkGray;
            btnObj.ForeColor = System.Drawing.Color.White;

        }

        protected void C_CheckedChanged(object sender, EventArgs e)
        {
            i = (int)Session["ind"];
            dt = (DataTable)Session["ds"];
            chk_Change(dt, i, "C");
            DataRow dr = dt.Rows[i];
            dr["UserAns_F"] = "";
            Button btnObj = findbutton(i);
            btnObj.BackColor = System.Drawing.Color.DarkGray;
            btnObj.ForeColor = System.Drawing.Color.White;
        }

        protected void D_CheckedChanged(object sender, EventArgs e)
        {
            i = (int)Session["ind"];
            dt = (DataTable)Session["ds"];
            chk_Change(dt, i, "D");
            DataRow dr = dt.Rows[i];
            dr["UserAns_F"] = "";
            Button btnObj = findbutton(i);
            btnObj.BackColor = System.Drawing.Color.DarkGray;
            btnObj.ForeColor = System.Drawing.Color.White;
        }



        private void EndExamResult()
        {

            try
            {
                string user = (string)Session["userid"];
                int rightcount = 0;
                int wrongcount = 0;
                int attempt = 0;
                int notattempt = 0;
                string test_name = Label4.Text;
                string tes_date = Label6.Text;
                string tes_time = Label9.Text;



                //total correct ans, wrong ans, attempted and not attempted being saved to database

                dt = (DataTable)Session["ds"];
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["UserAns_F"].ToString() != "")
                    {
                        attempt = attempt + 1;
                        if (dr["UserAns_F"].ToString().ToUpper() == dr["corr_opt"].ToString().ToUpper())
                        {
                            rightcount = rightcount + 1;
                        }
                        else
                        {
                            wrongcount = wrongcount + 1;
                        }
                    }
                    else
                    {
                        notattempt = notattempt + 1;
                    }
                }
                int tot_ques = attempt + notattempt;

                //Response.Write(rightcount);


                con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
                string query = "INSERT INTO result VALUES ( @userid, @test_name, @test_date, @test_giv_at, @test_duration, @tot_ques, @attempt, @notattempt, @rightcount, @wrongcount) ";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@tot_ques", tot_ques);
                command.Parameters.AddWithValue("@attempt", attempt);
                command.Parameters.AddWithValue("@notattempt", notattempt);
                command.Parameters.AddWithValue("@rightcount", rightcount);
                command.Parameters.AddWithValue("@wrongcount", wrongcount);
                command.Parameters.AddWithValue("@userid", user);
                command.Parameters.AddWithValue("@test_name", test_name);
                command.Parameters.AddWithValue("@test_date", tes_date);
                command.Parameters.AddWithValue("@test_giv_at", tes_time);
                command.Parameters.AddWithValue("@test_duration", exam_time);

                con.Open();
                command.ExecuteNonQuery();
                con.Close();

                //student answersheet is being saved


                DataTable ans_sheet = new DataTable();

                ans_sheet.Columns.Add(dt.Columns[0].ColumnName, dt.Columns[0].DataType);
                ans_sheet.Columns.Add(dt.Columns[2].ColumnName, dt.Columns[2].DataType);

                foreach (DataRow row in dt.Rows)
                {
                    DataRow newRow = ans_sheet.NewRow();
                    newRow[0] = row[0];
                    newRow[1] = row[2];

                    ans_sheet.Rows.Add(newRow);

                }

                DataTable temp = new DataTable();

                temp.Columns.Add("Corr_opt");
                temp.Columns.Add("Chosn_opt");

                foreach (DataRow row in dt.Rows)
                {
                    string value1 = row[7].ToString();
                    string value2 = row[9].ToString();

                    string newValue1 = "";
                    string newValue2 = "";

                    switch (value1)
                    {
                        case "A":
                            newValue1 = row[3].ToString();
                            break;
                        case "B":
                            newValue1 = row[4].ToString();
                            break;
                        case "C":
                            newValue1 = row[5].ToString();
                            break;
                        case "D":
                            newValue1 = row[6].ToString();
                            break;
                    }

                    switch (value2)
                    {
                        case "A":
                            newValue2 = row[3].ToString();
                            break;
                        case "B":
                            newValue2 = row[4].ToString();
                            break;
                        case "C":
                            newValue2 = row[5].ToString();
                            break;
                        case "D":
                            newValue2 = row[6].ToString();
                            break;

                    }

                    DataRow newRow = temp.NewRow();
                    newRow["Corr_opt"] = newValue1;
                    newRow["Chosn_opt"] = newValue2;


                    temp.Rows.Add(newRow);

                }

                ans_sheet.Columns.Add("Corr_opt");
                ans_sheet.Columns.Add("Chosn_opt");
                for (int i = 0; i < ans_sheet.Rows.Count; i++)
                {
                    ans_sheet.Rows[i]["Corr_opt"] = temp.Rows[i]["Corr_opt"];
                    ans_sheet.Rows[i]["Chosn_opt"] = temp.Rows[i]["Chosn_opt"];

                }

                // writing student attempted anss in excelfile

                Microsoft.Office.Interop.Excel.Application excelApp = new Microsoft.Office.Interop.Excel.Application();
                Microsoft.Office.Interop.Excel.Workbook excelWorkbook = excelApp.Workbooks.Add();
                Microsoft.Office.Interop.Excel.Worksheet excelWorksheet = (Microsoft.Office.Interop.Excel.Worksheet)excelWorkbook.ActiveSheet;

                excelWorksheet.Name = "Sheet1";

                for (int j = 0; j < ans_sheet.Columns.Count; j++)
                {
                    excelWorksheet.Cells[1, j + 1] = ans_sheet.Columns[j].ColumnName;
                }

                for (int i = 0; i < ans_sheet.Rows.Count; i++)
                {
                    for (int j = 0; j < ans_sheet.Columns.Count; j++)
                    {
                        excelWorksheet.Cells[i + 2, j + 1] = ans_sheet.Rows[i][j].ToString();
                    }

                }

                string folderPath = Server.MapPath("./ResultCompleteData/");
                string filename = tes_date + "_" + test_name + "_" + user + ".xlsx";
                string filePath = Path.Combine(folderPath, filename);
                excelWorkbook.SaveAs(filePath);
                excelWorkbook.Close();
                excelApp.Quit();
                

                Session.Clear();

                Response.Redirect("Login.aspx");

                



            }

            catch(Exception)
            {

                Session.Clear();
                Response.Redirect("Login.aspx");


            }




        }




        protected void btn_last_Click(object sender, EventArgs e)
        {
            FetchQALast();
        }

        private void FetchQALast()
        {
            i = t_q -1;
            dt = (DataTable)Session["ds"];
            DataRow dr = dt.Rows[i];
            userans(dt, i);
            Qno.Text = dr["q_id"].ToString();
            QD.Text = dr["ques"].ToString();
            A.Text = dr["opt1"].ToString();
            B.Text = dr["opt2"].ToString();
            C.Text = dr["opt3"].ToString();
            D.Text = dr["opt4"].ToString();

            Session["ind"] = i;
        }

        private void FetchQAFirst()
        {
            i = 0;
            dt = (DataTable)Session["ds"];
            DataRow dr = dt.Rows[i];
            Qno.Text = dr["q_id"].ToString();
            QD.Text = dr["ques"].ToString();
            A.Text = dr["opt1"].ToString();
            B.Text = dr["opt2"].ToString();
            C.Text = dr["opt3"].ToString();
            D.Text = dr["opt4"].ToString();

            Session["ind"] = i;

        }

        protected void btn_Submit1_Click(object sender, EventArgs e)
        {
            EndExamResult();

        }

        protected void btn_First_Click(object sender, EventArgs e)
        {
            FetchQAFirst();
        }


        private void SaveAns()
        {
            // code to save answer
            i = (int)Session["ind"];
            string temp;
            dt = (DataTable)Session["ds"];
            DataRow dr = dt.Rows[i];
            dr["UserAns_F"] = "";
            temp = dr["UserAns"].ToString();
            dr["UserAns_F"] = temp;

            if (dr["UserAns_F"] == "")
            {

            }
            else
            {
                Button btnObj = findbutton(i);
                btnObj.BackColor = System.Drawing.Color.ForestGreen;
                btnObj.ForeColor = System.Drawing.Color.White;
            }

        }

        private void SaveAndReveiw()
        {
            // code to save answer and mark for review
            i = (int)Session["ind"];
            string temp;
            dt = (DataTable)Session["ds"];
            DataRow dr = dt.Rows[i];
            dr["UserAns_F"] = "";
            temp = dr["UserAns"].ToString();
            dr["UserAns_F"] = temp;

            if (dr["UserAns_F"] == "")
            {

            }
            else
            {
                Button btnObj = findbutton(i);
                btnObj.BackColor = System.Drawing.Color.BlueViolet;
                btnObj.ForeColor = System.Drawing.Color.White;
            }
 
        }

        private void ClearResponse()
        {
            // code to clear saved answer
            clearRadio();
            i = (int)Session["ind"];
            dt = (DataTable)Session["ds"];
            DataRow dr = dt.Rows[i];
            dr["UserAns_F"] = "";
            dr["UserAns"] = "";
            Button btnObj = findbutton(i);
            btnObj.BackColor = SystemColors.Control;
            btnObj.ForeColor = System.Drawing.Color.Black;


        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            SaveAns();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SaveAndReveiw();
        }

        protected void Button4_Click1(object sender, EventArgs e)
        {
            ClearResponse();
        }



        protected void Button1_Click1(object sender, EventArgs e)
        {
            EndExamResult();

        }
    }
}