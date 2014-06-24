using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChatRoom.Admin
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        ChatProperties PS = new ChatProperties();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();
            }
        }

        private void FillGrid()
        {
            GridView1.DataSource = PS.GetTechReqest();
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "StatusF")
            {
                PS.ReqID = Convert.ToInt16(e.CommandArgument);
                PS.IsApprove = true;
                PS.TechReqStatus(PS.ReqID, PS.IsApprove);
                FillGrid();
            }

            if (e.CommandName == "StatusT")
            {
                PS.ReqID = Convert.ToInt16(e.CommandArgument);
                PS.IsApprove = false;
                PS.TechReqStatus(PS.ReqID, PS.IsApprove);
                FillGrid();
            }

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                LinkButton lnkStatus = (LinkButton)GridView1.Rows[i].FindControl("LinkButton1");
                if (lnkStatus.Text == "False")
                {
                    lnkStatus.CommandName = "StatusF";
                    GridView1.Rows[i].BackColor = System.Drawing.Color.FromArgb(46, 46, 54);
                    GridView1.Rows[i].ForeColor = System.Drawing.Color.Snow;
                    lnkStatus.ForeColor = System.Drawing.Color.Snow;
                }
                else
                {
                    lnkStatus.CommandName = "StatusT";
                    GridView1.Rows[i].BackColor = System.Drawing.Color.Snow;
                    GridView1.Rows[i].ForeColor = System.Drawing.Color.FromArgb(46, 46, 54);
                    lnkStatus.ForeColor = System.Drawing.Color.FromArgb(46, 46, 54);
                }
            }
        }
    }
}