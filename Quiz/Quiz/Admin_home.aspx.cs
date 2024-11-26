using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quiz
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["userid"] == null)
            {
                Response.Redirect("Admin_login.aspx");
            }
            //Redirect directly to Release_system.aspx file after loading 
            else
            {
                Response.Redirect("Release_system.aspx");
            }

        }


    }
}



