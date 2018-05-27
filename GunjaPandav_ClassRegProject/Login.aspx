<%@ Page Title="" Language="C#" MasterPageFile="~/FinalProject.Master" AutoEventWireup="true"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div id="rcorners2">
        <br />
        <span class="auto-style1">Use your login ID and password below:</span><br />
        <br />
        
        <div class="auto-style2">Login Name:</div>
        <div class="leftaligned">
            <input type="text" id="loginTextBox" runat="server" />
        </div>
        <div class="auto-style2">Password:</div>
        <div class="leftaligned">
            <input type="text" id="passwordTextBox" runat="server" />
        </div>
       <br />
            <input type="submit" class="button" onclick="Button1_Click" runat="server" />
            <br />

        <span class="auto-style1">
            <br />
            Need to request for a login?
            <br />
            <asp:HyperLink ID="RequestLoginButton" runat="server" Class="button" Text="Request a Login" NavigateUrl="~/RequestLogin.aspx" Target="_self" />
            <br />
            
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
