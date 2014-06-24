<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacultyMain.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="ChatRoom.Faculty.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <div class="alert alert-warning">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
            ×</button>
        <i class="fa fa-warning sign"></i><strong>Alert!</strong> Site is under construction, Please wait for some time..
    </div>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
        </Triggers>
        <ContentTemplate>
            <div align="center">
                <div style="height: 200px; width: 200px; text-align: center; box-shadow: 0px 0px 10px black;
                    border-radius: 200px 200px 200px 200px; padding: 8%; font-size: xx-large;">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000">
    </asp:Timer>
</asp:Content>
