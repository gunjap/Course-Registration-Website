<%@ Page Title="" Language="C#" MasterPageFile="~/FinalProject.Master" AutoEventWireup="true"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentID"]==null)
            {
                logoutBT.Visible = false;
                loginBT.Visible = true;
            }
            else
            {
                 logoutBT.Visible = true;
                loginBT.Visible = false;
            }
        }
        protected void Login(object sender, EventArgs e)
        {
            ClassReg sqlConn = new ClassReg();

            int StudentID = sqlConn.WebsiteLogin(loginTextBox.Value,passwordTextBox.Value);

            if(StudentID == -1) //Login failed
            {
                LabelMessage.Text = "Invalid Credentials, please try again with correct credentials.";
            }
            else
            {
                LabelMessage.Text = "Login successful!";
                Session["StudentID"] = StudentID;
                logoutBT.Visible = true;
                loginBT.Visible = false;
                Response.Redirect("MyClasses.aspx");
            }

        }
        protected void Logout(object sender, EventArgs e)
        {
            loginBT.Visible = true;
            logoutBT.Visible = false;
            Session["StudentID"] = null;
        }
    </script>
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
            <asp:Button Text="Login" id="loginBT" visible="true" class="button" onclick="Login" runat="server" />
        <asp:Button Text="Logout" id="logoutBT"  visible="false" class="button" onclick="Logout" runat="server" />
            <br />
        <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label>
       <br />

        <span class="auto-style1">
            <br />
            Need to request for a login?
            <br />
            <asp:HyperLink ID="RequestLoginButton" runat="server" Class="button" Text="Request a Login" NavigateUrl="~/RequestLogin.aspx" Target="_self" />
            <br />
          </span>  
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
