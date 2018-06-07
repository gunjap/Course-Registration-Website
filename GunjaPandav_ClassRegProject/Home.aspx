<%@ Page Title="" Language="C#" MasterPageFile="~/FinalProject.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="rcorners2">
        <br />
        <p class="auto-style1" style="padding-left:30px; padding-right:30px; line-height:30px">Welcome to the class registration project. From here you can view the list of available courses and register for them. You would need a login to register for courses. If you dont' have one, please use "Request Login" button on the login page. If for some reason you need to unregister from a class, feel free to give us a call. Thank you for visiting.</p>
        <asp:HyperLink ID="RegisterButton" runat="server" Class="button" Text="View Courses" NavigateUrl="~/Register.aspx" Target="_self" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
