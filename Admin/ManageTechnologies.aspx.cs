using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChatRoom.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        ChatProperties PS = new ChatProperties();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillTechnologies();
            }
        }

        private void FillTechnologies()
        {
            GridTech.DataSource = PS.GetAllTechnologies();
            GridTech.DataBind();
        }

        protected void GridTech_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                PS.TechName = ((TextBox)GridTech.HeaderRow.FindControl("TextBox2")).Text;
                PS.TechEmail = ((TextBox)GridTech.HeaderRow.FindControl("TextBox4")).Text;
                PS.IsActive = ((CheckBox)GridTech.HeaderRow.FindControl("CheckBox2")).Checked;
                PS.InsertNewTechnology(PS);
                FillTechnologies();
            }

            if (e.CommandName == "NotActive")
            {
                PS.ManageTechnolgies(Convert.ToInt16(e.CommandArgument), false);
                FillTechnologies();
            }
            if (e.CommandName == "Active")
            {
                PS.ManageTechnolgies(Convert.ToInt16(e.CommandArgument), true);
                FillTechnologies();
            }
        }

        protected void GridTech_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridTech.EditIndex = e.NewEditIndex;
            FillTechnologies();
        }

        protected void GridTech_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridTech.EditIndex = -1;
            FillTechnologies();
        }

        protected void GridTech_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            PS.TechName = ((TextBox)GridTech.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            PS.TechEmail = ((TextBox)GridTech.Rows[e.RowIndex].FindControl("TextBox3")).Text;
            PS.TechID = Convert.ToInt16(GridTech.DataKeys[e.RowIndex].Value);
            PS.UpdateTechnology(PS);

            GridTech.EditIndex = -1;
            FillTechnologies();
        }

        protected void GridTech_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            PS.TechID = Convert.ToInt16(GridTech.DataKeys[e.RowIndex].Value);
            PS.DeleteTechology(PS.TechID);
            FillTechnologies();
        }

        protected void GridTech_DataBound(object sender, EventArgs e)
        {
            if (GridTech.EditIndex == -1)
            {
                for (int i = 0; i < GridTech.Rows.Count; i++)
                {
                    LinkButton lnkTStatus = (LinkButton)GridTech.Rows[i].FindControl("LinkButton1");
                    if (lnkTStatus.Text == "True")
                    {
                        lnkTStatus.CommandName = "NotActive";
                    }
                    else if (lnkTStatus.Text == "False")
                    {
                        lnkTStatus.CommandName = "Active";
                    }

                }
            }
        }
    }
}