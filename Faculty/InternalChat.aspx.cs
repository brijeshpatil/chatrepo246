using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace ChatRoom.Faculty
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        ChatProperties PS = new ChatProperties();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillChatData();
            }
        }

        private void FillChatData()
        {
            if (Session["FProfile"] != null)
            {
                PS.LocationID = Convert.ToInt16(((DataTable)Session["FProfile"]).Rows[0]["LocationID"].ToString());
                DataList1.DataSource = PS.GetAllInernalChat(PS);
                DataList1.DataBind();
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            //TextBox2.Text += ((Label)e.Item.FindControl("Label2")).Text;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            FillChatData();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            PS.LocationID = Convert.ToInt16(((DataTable)Session["FProfile"]).Rows[0]["LocationID"].ToString());
            PS.FacultyID = Guid.Parse(((DataTable)Session["FProfile"]).Rows[0]["FacultyID"].ToString());
            PS.Message = TextBox1.Text;
            PS.MakeInterChat(PS);
            FillChatData();
            TextBox1.Text="";
        }
    }
}
