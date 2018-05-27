<%@ Page Title="" Language="C#" MasterPageFile="~/FinalProject.Master" AutoEventWireup="true"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div id="rcorners2">
        <br />
        <span class="auto-style1">Please enter your details below:</span><br />
        <br />
        <div class="auto-style2">Name:</div>
        <div class="leftaligned">
            <input type="text" id="nameTextBox" runat="server" />
        </div>
        <div class="auto-style2">Login Name:</div>
        <div class="leftaligned">
            <input type="text" id="loginTextBox" runat="server" />
        </div>
        <div class="auto-style2">Email address:</div>
        <div class="leftaligned">
            <input type="text" id="emailTextBox" runat="server" />
        </div>

        <span class="auto-style1">
            <br />
            Reaon for access?
            <br />
            <input type="text" id="dataTextBox" runat="server" style="width: 80%; height: 150px; margin-left: 0px" /><br />
            <br />
            <%-- <asp:Button ID="Button1" runat="server" Text="ASPSubmit" OnClick="Button1_Click" class="button" ClientIDMode="Static" /><br />
            --%>
            <input type="submit" class="button" onclick="Button1_Click" runat="server" />
            <br />
            Pasword will be sent to you once a staff member has manually gone over your request.</span>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
