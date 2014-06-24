using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChatRoom.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        ChatProperties PS = new ChatProperties();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FIllLocations();
            }
        }

        private void FIllLocations()
        {
            GridLocation.DataSource = PS.GetAllLocation();
            GridLocation.DataBind();
        }

        protected void GridLocation_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                PS.InsertNewLocation(((TextBox)GridLocation.HeaderRow.FindControl("TextBox2")).Text, ((CheckBox)GridLocation.HeaderRow.FindControl("CheckBox2")).Checked);
                FIllLocations();
            }

            if (e.CommandName == "Active")
            {
                PS.ManageLocation(Convert.ToInt16(e.CommandArgument), true);
                FIllLocations();
            }

            if (e.CommandName == "NotActive")
            {
                PS.ManageLocation(Convert.ToInt16(e.CommandArgument), false);
                FIllLocations();
            }
        }


        protected void GridLocation_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridLocation.EditIndex = e.NewEditIndex;
            FIllLocations();

        }

        protected void GridLocation_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridLocation.EditIndex = -1;
            FIllLocations();
        }

        protected void GridLocation_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            PS.DeleteLocation(Convert.ToInt16(GridLocation.DataKeys[e.RowIndex].Value));
            FIllLocations();
        }
        protected void GridLocation_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            PS.UpdateLocation(Convert.ToInt16(GridLocation.DataKeys[e.RowIndex].Value), ((TextBox)GridLocation.Rows[e.RowIndex].FindControl("TextBox1")).Text);
            GridLocation.EditIndex = -1;
            FIllLocations();
        }

        protected void GridLocation_DataBound(object sender, EventArgs e)
        {
            if (GridLocation.EditIndex == -1)
            {
                for (int i = 0; i < GridLocation.Rows.Count; i++)
                {
                    LinkButton lnkStatus = (LinkButton)GridLocation.Rows[i].FindControl("LinkButton1");
                    if (lnkStatus.Text == "True")
                    {
                        lnkStatus.CommandName = "NotActive";
                    }
                    else if (lnkStatus.Text == "False")
                    {
                        lnkStatus.CommandName = "Active";
                    }
                }
            }
        }
    }
}