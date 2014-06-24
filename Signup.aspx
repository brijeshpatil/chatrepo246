<%@ Page Title="" Language="C#" MasterPageFile="~/Common.Master" AutoEventWireup="true"
    CodeBehind="Signup.aspx.cs" Inherits="ChatRoom.WebForm4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #ContentPlaceHolder1_RdoGender tr td
        {
            border: 0px;
        }
        
        .mytbl, .mytbl tbody, .mytbl tbody tr, .mytbl tbody tr td, .mytbl tbody tr th
        {
            border: 0px;
        }
        
        .cal_Theme1 .ajax__calendar_container
        {
            background-color: #DEF1F4;
            border: solid 1px #77D5F7;
        }
        
        .cal_Theme1 .ajax__calendar_header
        {
            background-color: #ffffff;
            margin-bottom: 4px;
        }
        
        .cal_Theme1 .ajax__calendar_title, .cal_Theme1 .ajax__calendar_next, .cal_Theme1 .ajax__calendar_prev
        {
            color: #004080;
            padding-top: 3px;
        }
        
        .cal_Theme1 .ajax__calendar_body
        {
            background-color: #ffffff;
            border: solid 1px #77D5F7;
        }
        
        .cal_Theme1 .ajax__calendar_dayname
        {
            text-align: center;
            font-weight: bold;
            margin-bottom: 4px;
            margin-top: 2px;
            color: #004080;
        }
        
        .cal_Theme1 .ajax__calendar_day
        {
            color: #004080;
            text-align: center;
        }
        
        .cal_Theme1 .ajax__calendar_hover .ajax__calendar_day, .cal_Theme1 .ajax__calendar_hover .ajax__calendar_month, .cal_Theme1 .ajax__calendar_hover .ajax__calendar_year, .cal_Theme1 .ajax__calendar_active
        {
            color: #004080;
            font-weight: bold;
            background-color: #DEF1F4;
        }
        
        .cal_Theme1 .ajax__calendar_today
        {
            font-weight: bold;
        }
        
        .cal_Theme1 .ajax__calendar_other, .cal_Theme1 .ajax__calendar_hover .ajax__calendar_today, .cal_Theme1 .ajax__calendar_hover .ajax__calendar_title
        {
            color: #bbbbbb;</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div id="Div1" class="login-container">
                <div class="middle-login" style="margin-top: -280px; margin-left: -250px;">
                    <div class="block-flat">
                        <div class="header">
                            <h3 class="text-center">
                                <img class="logo-img" src="images/logo.png" alt="logo" />Chat Room</h3>
                        </div>
                        <div style="margin-bottom: 0px !important;" class="form-horizontal">
                            <div class="content" style="color: Black; font-family: Verdana;">
                                <%--  <div class="alert alert-success alert-white rounded">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                        ×</button>
                                    <div class="icon">
                                        <i class="fa fa-check"></i>
                                    </div>
                                    <strong>Success!</strong> Registered successfully!
                                </div>--%>
                                <div class="alert alert-info alert-white rounded">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                        ×</button>
                                    <div class="icon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <strong>Personal Information!</strong>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <asp:TextBox ID="txtfname" runat="server" class="form-control" placeholder="First Name" Required="Required"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <asp:TextBox ID="txtlname" runat="server" class="form-control" placeholder="Last Name"  Required="Required"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-male"></i></span>
                                            <asp:RadioButtonList CssClass="form-control" ID="RdoGender" runat="server" RepeatDirection="Horizontal"  Required="Required">
                                                <asp:ListItem Value="Male" Selected="True">&nbsp;Male</asp:ListItem>
                                                <asp:ListItem Value="Female">&nbsp;Female</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                            <asp:TextBox ID="txtdob" runat="server" class="form-control" placeholder="Date Of Birth"  Required="Required"></asp:TextBox>
                                            <cc1:CalendarExtender CssClass="cal_Theme1" ID="CalendarExtender1" runat="server"
                                                TargetControlID="txtdob">
                                            </cc1:CalendarExtender>
                                        </div>
                                    </div>
                                </div>
                                <div align="right">
                                    <asp:Button ID="btnPersonal" CssClass="btn btn-primary" runat="server" Text="Submit Info"
                                        OnClick="btnPersonal_Click" />
                                </div>
                                <%--<table class="mytbl">
                            <tr>
                                <td>
                                    FirstName
                                </td>
                                <td>
                                    <asp:TextBox ID="txtfname" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    LastName
                                </td>
                                <td>
                                    <asp:TextBox ID="txtlname" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Gender
                                </td>
                                <td>
                                    <asp:RadioButtonList CssClass="form-control" ID="rdoGender" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    BirthDate
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td align="right">
                                    <asp:Button ID="btnPersonal" CssClass="btn btn-primary" runat="server" Text="Submit Info" />
                                </td>
                            </tr>
                        </table>--%>
                                <br />
                                <div align="right">
                                    --------------------<br />
                                    Thanks and Regards,<br />
                                    Chat Room<br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center out-links">
                        <a href="#">&copy; 2014 Chat Room</a></div>
                </div>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div id="Div2" class="login-container">
                <div class="middle-login" style="margin-top: -280px; margin-left: -250px;">
                    <div class="block-flat">
                        <div class="header">
                            <h3 class="text-center">
                                <img class="logo-img" src="images/logo.png" alt="logo" />Chat Room</h3>
                        </div>
                        <div style="margin-bottom: 0px !important;" class="form-horizontal">
                            <div class="content" style="color: Black; font-family: Verdana;">
                                <div class="alert alert-info alert-white rounded">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                        ×</button>
                                    <div class="icon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <strong>Account Information!</strong>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <asp:TextBox ID="txtEmailID" runat="server" class="form-control" AutoPostBack="true"   Required="Required"
                                                placeholder="EmailID" ontextchanged="EmailID_TextChanged"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-laptop"></i></span>
                                            <asp:DropDownList ID="drpTEchnology" runat="server" CssClass="form-control"  Required="Required">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-location-arrow"></i></span>
                                            <asp:DropDownList ID="drpLocation" runat="server" CssClass="form-control"  Required="Required">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <%--<div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-picture-o"></i></span>
                                            <asp:FileUpload ID="fpImage" runat="server" CssClass="form-control"   Required="Required"/>
                                        </div>
                                    </div>
                                </div>--%>
                                <div align="right">
                                    <asp:Button ID="btnInformation" CssClass="btn btn-primary" runat="server" 
                                        Text="Submit Info" onclick="btnInformation_Click" />
                                </div>
                                <%--<table class="mytbl">
                            <tr>
                                <td>
                                    FirstName
                                </td>
                                <td>
                                    <asp:TextBox ID="txtfname" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    LastName
                                </td>
                                <td>
                                    <asp:TextBox ID="txtlname" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Gender
                                </td>
                                <td>
                                    <asp:RadioButtonList CssClass="form-control" ID="rdoGender" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    BirthDate
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td align="right">
                                    <asp:Button ID="btnPersonal" CssClass="btn btn-primary" runat="server" Text="Submit Info" />
                                </td>
                            </tr>
                        </table>--%>
                                <br />
                                <div align="right">
                                    --------------------<br />
                                    Thanks and Regards,<br />
                                    Chat Room<br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center out-links">
                        <a href="#">&copy; 2014 Chat Room</a></div>
                </div>
            </div>
        </asp:View>
         <asp:View ID="View3" runat="server">
            <div id="Div3" class="login-container">
                <div class="middle-login" style="margin-top: -280px; margin-left: -250px;">
                    <div class="block-flat">
                        <div class="header">
                            <h3 class="text-center">
                                <img class="logo-img" src="images/logo.png" alt="logo" />Chat Room</h3>
                        </div>
                        <div style="margin-bottom: 0px !important;" class="form-horizontal">
                            <div class="content" style="color: Black; font-family: Verdana;">
                                <div class="alert alert-success alert-white rounded">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                        ×</button>
                                    <div class="icon">
                                        <i class="fa fa-check"></i>
                                    </div>
                                    <strong>Success!</strong> Registered successfully!
                                </div>
                                <div class="alert alert-info alert-white rounded">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                        ×</button>
                                    <div class="icon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <strong>Info!</strong> Verification Code sent on your Mail,<br />
                                    Please Check your Email for Verification Link..
                                </div>
                                
                                <br />
                                <div align="right">
                                    --------------------<br />
                                    Thanks and Regards,<br />
                                    Chat Room<br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center out-links">
                        <a href="#">&copy; 2014 Chat Room</a></div>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
