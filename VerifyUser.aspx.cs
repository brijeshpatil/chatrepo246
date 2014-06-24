using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChatRoom
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        ChatProperties PS = new ChatProperties();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["UserID"] != null)
                {
                    PS.FacultyID = Guid.Parse(Request.QueryString["UserID"].ToString());
                    if (PS.IsFacultyVerified(PS.FacultyID))
                    {
                        Response.Redirect("Login.aspx");
                        //Response.Write("You are already Verified....");
                    }
                    else
                    {
                        MultiView1.ActiveViewIndex = 0;
                        lblFirstMessage.Text = "Create Password";
                    }
                }
                else
                {
                    Response.Redirect("Signup.aspx");
                }
                

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            PS.CreateFacultyPass(PS.FacultyID = Guid.Parse(Request.QueryString["UserID"].ToString()), TextBox2.Text);
            MultiView1.ActiveViewIndex = 1;

        }
    }
}