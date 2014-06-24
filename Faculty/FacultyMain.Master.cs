using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace ChatRoom.Faculty
{
    public partial class FacultyMain : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FProfile"] != null)
            {
                lblUserName.Text = ((DataTable)Session["FProfile"]).Rows[0]["Fname"].ToString() + " " + ((DataTable)Session["FProfile"]).Rows[0]["Lname"].ToString();
                imgUser.ImageUrl =((DataTable)Session["FProfile"]).Rows[0]["FImage"].ToString();
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../Login.aspx");
        }
    }
}
