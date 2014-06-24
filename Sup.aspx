<%@ Page Title="" Language="C#" MasterPageFile="~/Common.Master" AutoEventWireup="true"
    CodeBehind="Sup.aspx.cs" Inherits="ChatRoom.WebForm3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div id="cl-wrapper" class="login-container">
                <div class="middle-login" style="margin-top: -300px;">
                    <div class="block-flat">
                        <div class="header">
                            <h3 class="text-center">
                                <img class="logo-img" src="images/logo.png" alt="logo" />Chat Room</h3>
                        </div>
                        <div style="margin-bottom: 0px !important;" class="form-horizontal">
                            <div class="content">
                                <h4 class="title">
                                    Register Here...</h4>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <asp:TextBox ID="txtfname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <asp:TextBox ID="txtlname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-male"></i></span>
                                            <div class="col-sm-6" style="padding-left: 0px;">
                                                <asp:RadioButtonList ID="rdogender" runat="server" RepeatDirection="Horizontal" Style="border-top: 1px solid #dadada;">
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                            <asp:TextBox ID="txtdob" runat="server" class="form-control" placeholder="Date Of Birth"></asp:TextBox>
                                            <asp:CalendarExtender ID="txtdob_CalendarExtender" runat="server" Enabled="True"
                                                TargetControlID="txtdob">
                                            </asp:CalendarExtender>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-briefcase"></i></span>
                                            <asp:DropDownList ID="drpLocation" runat="server" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-windows"></i></span>
                                            <asp:DropDownList ID="drpTechnology" runat="server" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="EmailID"
                                                AutoPostBack="True" OnTextChanged="txtEmail_TextChanged"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                            <asp:FileUpload ID="fpImage" runat="server" CssClass="form-control" Required="Required"/>
                                            <%--<asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="EmailID"
                                                AutoPostBack="True" OnTextChanged="txtEmail_TextChanged"></asp:TextBox>--%>
                                        </div>
                                    </div>
                                </div>
                                <%--    <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <asp:TextBox ID="txtUname" runat="server" class="form-control" placeholder="User Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <asp:TextBox ID="txtpass" runat="server" class="form-control" TextMode="Password"
                                        placeholder="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <asp:TextBox ID="txtcpass" runat="server" class="form-control" placeholder="Confirm Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>--%>
                            </div>
                            <div class="foot">
                                <asp:Button ID="Button1" runat="server" Text="Register" class="btn btn-primary" data-dismiss="modal"
                                    OnClick="Button1_Click" />
                                <asp:Button ID="Button2" runat="server" Text="Cancel" class="btn btn-default" data-dismiss="modal"
                                    PostBackUrl="~/Login.aspx" />
                            </div>
                        </div>
                    </div>
                    <div class="text-center out-links">
                        <a href="#">&copy; 2014 Chat Room</a></div>
                </div>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div id="Div1" class="login-container">
                <div class="middle-login" style="margin-top: -200px; margin-left: -250px;">
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
