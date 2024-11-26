using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Quiz
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btn_register_Click(object sender, EventArgs e)
        {
            // code to register item to student table
            SqlCommand cmd = new SqlCommand("insert into students (userid,full_name,dob,gender,contact_no,email_id,pwd,confirm_pwd)values('" + txt_unm.Text + "' , '" + txt_fnm.Text + "','" + txt_dob.Text + "','" + DropDownList1.Text + "','" + txt_cno.Text + "','" + txt_email.Text + "','" + txt_password.Text + "','" + txt_cpwd.Text + "' )", sqlConnection);
            sqlConnection.Open();
            cmd.ExecuteNonQuery();
            Response.Write("<div style='color: green; font-size: 24px;'>" + "- Registered Successfully!" + "</div>");

        }


        

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lnk_login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}