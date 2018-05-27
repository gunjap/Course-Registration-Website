<%@ Page Title="" Language="C#" MasterPageFile="~/FinalProject.Master" AutoEventWireup="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="rcorners2">
    <br />
            <span class="auto-style1">This is home page</span><br /><br />
        <br />
    <asp:HyperLink ID="RegisterButton" runat="server" Class="button" Text="View Courses" NavigateUrl="~/Register.aspx" Target="_self" />
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
