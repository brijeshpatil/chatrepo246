using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChatRoom.Faculty
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        static int i = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if (i == 11)
            {
                Response.Redirect("InternalChat.aspx");
            }
            Label1.Text = i.ToString();
            i++;
            
        }
    }
}