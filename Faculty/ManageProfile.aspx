<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacultyMain.Master" AutoEventWireup="true"
    CodeBehind="ManageProfile.aspx.cs" Inherits="ChatRoom.Faculty.ManageProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .PopupBack
        {
            background-color: Black;
            opacity: 0.8;
        }
        
        .MyDrp
        {
            height: 30px;
            width: 300px;
            
        }
        .pnl
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:FormView ID="FormView1" runat="server" OnModeChanging="FormView1_ModeChanging"
        OnItemUpdating="FormView1_ItemUpdating" OnItemCommand="FormView1_ItemCommand">
        <ItemTemplate>
            <div class="block-flat">
                <div class="header">
                    <h3>
                        Manage Your Profile</h3>
                </div>
                <div class="content">
                    <table>
                        <tr>
                            <td>
                                First Name
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# bind("Fname") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Last Name
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# bind("Lname") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text='<%#bind("Gender") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Birth Date</td>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text='<%#bind("DOB") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                EmailID
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text='<%# bind("EmailID") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                Change Password
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Image Buttons/change_password_button.gif"
                                    PostBackUrl="~/Faculty/ChangePassword.aspx" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Current Location
                            </td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text='<%# bind("LocationName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                Technologies
                            </td>
                            <td valign="top" nowrap style="width: 500px;">
                                <asp:Label ID="Label3" runat="server" Text='<%# bind("TechName") %>'></asp:Label>&nbsp;
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Image Buttons/RiG4xy9iL.png"
                                    CommandName="AddTech" Height="20px" Width="20px" ToolTip="Add New Technology" />
                                <br />
                                <br />
                                <asp:DropDownList ID="drpTechnology" runat="server" CssClass="form-control" Visible="false">
                                </asp:DropDownList>
                                <br />
                                <div align="right">
                                <asp:Button ID="Button3" runat="server" Text="Add" class="btn btn-primary" Visible="false" CommandName="AddNewTech" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Registration Date
                            </td>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text='<%# bind("RegDate") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="Make Change in Profile" class="btn btn-primary"
                                    CommandName="Edit" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="block-flat">
                <div class="header">
                    <h3>
                        Input Groups</h3>
                </div>
                <div class="content">
                    <table>
                        <tr>
                            <td>
                                First Name
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# bind("Fname") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Last Name
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# bind("Lname") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>Birth Date</td>
                            <td>
                                <asp:TextBox ID="txtDOB" runat="server" Text='<%#bind("DOB") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                EmailID
                            </td>
                            <td>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# bind("EmailID") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Current Location
                            </td>
                            <td>
                                <asp:Label ID="Label61" runat="server" Text='<%# bind("LocationName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Technologies
                            </td>
                            <td>
                               <asp:Label ID="Label31" runat="server" Text='<%# bind("TechName") %>'></asp:Label>&nbsp;


                            </td>
                        </tr>
                        <tr>
                            <td>
                                Registration Date
                            </td>
                            <td>
                                <asp:Label ID="lblRegDAte" runat="server" Text='<%# bind("RegDate") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="Update Changes" class="btn btn-primary"
                                    CommandName="Update" />
                                <asp:Button ID="Button1" runat="server" Text="Cancel Changes" class="btn btn-default"
                                    CommandName="Cancel" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </EditItemTemplate>
    </asp:FormView>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="HiddenField1"
        PopupControlID="Panel1" BackgroundCssClass="PopupBack">
    </asp:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" CssClass="pnl">
        <div class="header">
            <h3 class="text-center">
                <img class="logo-img" src="images/logo.png" alt="logo" />Chat Room</h3>
        </div>
        <h1>
            Panel Called</h1>
        <%--<asp:DropDownList ID="drpTechnology" runat="server" CssClass="MyDrp">
        </asp:DropDownList>--%>
    </asp:Panel>
</asp:Content>
<%--<div class="block-flat">
    <div class="header">
        <h3>
            Input Groups</h3>
    </div>
    <div class="content">
        <form class="form-horizontal group-border-dashed" action="#" style="border-radius: 0px;">
        <div class="form-group">
            <label class="col-sm-3 control-label">
                Input Text</label>
            <div class="col-sm-6">
                <div class="input-group">
                    <span class="input-group-addon">@</span>
                    <input type="text" class="form-control" placeholder="Username">
                </div>
                <div class="input-group">
                    <input type="text" class="form-control">
                    <span class="input-group-addon">.00</span>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">$</span>
                    <input type="text" class="form-control">
                    <span class="input-group-addon">.00</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">
                Input Sizing</label>
            <div class="col-sm-6">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon">@</span>
                    <input type="text" class="form-control" placeholder="Username">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">@</span>
                    <input type="text" class="form-control" placeholder="Username">
                </div>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon">@</span>
                    <input type="text" class="form-control" placeholder="Username">
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">
                Checkbox & Radio</label>
            <div class="col-sm-6">
                <div class="input-group">
                    <span class="input-group-addon">
                        <input type="checkbox">
                    </span>
                    <input type="text" class="form-control">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        <input type="radio">
                    </span>
                    <input type="text" class="form-control">
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">
                Button Addons</label>
            <div class="col-sm-6">
                <div class="input-group">
                    <input type="text" class="form-control">
                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="button">
                            Go!</button>
                    </span>
                </div>
                <div class="input-group">
                    <input type="text" class="form-control">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                            Action <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                        </ul>
                    </div>
                </div>
                <div class="input-group">
                    <input type="text" class="form-control">
                    <div class="input-group-btn">
                        <button tabindex="-1" class="btn btn-default" type="button">
                            Action</button>
                        <button tabindex="-1" data-toggle="dropdown" class="btn btn-primary dropdown-toggle"
                            type="button">
                            <span class="caret"></span><span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <ul role="menu" class="dropdown-menu pull-right">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">
                Readonly Input</label>
            <div class="col-sm-6">
                <input type="text" readonly="readonly" class="form-control" value="Readonly input text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">
                Textarea</label>
            <div class="col-sm-6">
                <textarea class="form-control"></textarea>
            </div>
        </div>
        </form>
    </div>
</div>--%>
