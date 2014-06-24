<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacultyMain.Master" AutoEventWireup="true"
    CodeBehind="InternalChat.aspx.cs" Inherits="ChatRoom.Faculty.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .DataTable tr td, .DataTable tr th, .DataTable tr, .DataTable
        {
            border: 0px;
        }
        
        .DataTable td:last-child
        {
            border-right: 0px solid #dadada;
        }
        
        .tttt
        {
            resize: none;
            border: 0px;
            background-color: White;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <h1>
            Welcome to Inter Chat</h1>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="85%" Height="50px"
                        Required="Required" PlaceHolder="What's in Your Mind?" CssClass="txtclass"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Post" 
        CommandName="AddChat" class="btn btn-primary"
                        Height="50px" Width="10%" onclick="Button1_Click" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
        </Triggers>
        <ContentTemplate>
            <asp:DataList ID="DataList1" runat="server" Width="100%" CssClass="DataTable" OnItemCommand="DataList1_ItemCommand"
                CellPadding="10" CellSpacing="10" OnItemDataBound="DataList1_ItemDataBound">
                <HeaderTemplate>

                </HeaderTemplate>
                <ItemTemplate>
                    <table width="100%" class="MyChatTable">
                        <tr>
                            <th valign="middle">
                                <asp:Image CssClass="MySmallImage" ID="imgFImage" runat="server" Height="50px" Width="50px"
                                    ImageUrl='<%# Eval("FImage") %>' />&nbsp;
                                <asp:Label ID="Label1" ForeColor="#4D90FD" runat="server" Text='<%# Eval("Fname")+" "+Eval("Lname") %>'></asp:Label>
                            </th>
                            <th align="right">
                                <div align="right" style="margin-right: 50px; color: ThreeDFace;">
                                    <asp:Label ID="Label3" runat="server" Text='<%#bind("IChatDate") %>'></asp:Label>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div style="margin-left: 50px;">
                                    <strong>&nbsp;<asp:TextBox ID="Label2" Font-Bold="true" runat="server" CssClass="tttt"
                                        TextMode="MultiLine" Width="100%"  Enabled="false" Text='<%# Bind("Msg") %>'></asp:TextBox></strong>
                                    <br />
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <%--<hr style="height: 2px; background-color: Gray;" />
            <br />--%>
                </ItemTemplate>
            </asp:DataList>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Timer ID="Timer1" runat="server" Interval="2500" OnTick="Timer1_Tick">
    </asp:Timer>
</asp:Content>
