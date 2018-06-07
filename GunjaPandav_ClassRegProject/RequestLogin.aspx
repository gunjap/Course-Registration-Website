<%@ Page Title="" Language="C#" MasterPageFile="~/FinalProject.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">
        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = nameTextBox.Value;
            string email = emailTextBox.Value;
            string login = loginTextBox.Value;
            string reason = dataTextBox.Value;
            string NR = NRTextBox.Value;
            DateTime requireby;
            int StudentID;
            ClassReg sqlConn = new ClassReg();
            if (Calendar1.SelectedDate.Date == DateTime.MinValue)
                StudentID = sqlConn.RequestLogin(name, email, reason, login, NR);
            else
            {
                requireby = Calendar1.SelectedDate;
                StudentID = sqlConn.RequestLogin(name, email, reason, login, NR, requireby);
            }

            Label1.Text = "Your login id is " + StudentID;
            //Response.Write("Your login id is " + StudentID);

            //EmptyTextboxes();
        }
        protected void EmptyTextboxes()
        {
            nameTextBox.Value = "";
            emailTextBox.Value = "";
            loginTextBox.Value = "";
            dataTextBox.Value = "";
        }
    </script>
    <style type="text/css">
        #NRTextBox {
            width: 249px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="rcorners2">
        <br />
        <span class="auto-style1">Please enter your details below:</span><br />
        <br />
        <div class="auto-style2">Name:</div>
        <div class="leftaligned">
            <input type="text" id="nameTextBox" runat="server" clientidmode="Static" />
        </div>
        <div class="auto-style2">Login Name:</div>
        <div class="leftaligned">
            <input type="text" id="loginTextBox" runat="server" clientidmode="Static" />
        </div>
        <div class="auto-style2">Email address:</div>
        <div class="leftaligned">
            <input type="text" id="emailTextBox" runat="server" clientidmode="Static" />
        </div>
        <div class="auto-style2">New or Reactivate:</div>
        <div class="leftaligned">
            <input type="text" id="NRTextBox" runat="server" clientidmode="Static" />
        </div>

        <div class="auto-style1">
            <p style="text-align: center">Reaon for access?</p>
            <input type="text" id="dataTextBox" runat="server" style="width: 70%; height: 50px" clientidmode="Static" /><br />

            <br />
            Required by<br />
            <asp:Calendar ID="Calendar1" runat="server" BorderWidth="1px" DayNameFormat="Shortest" Height="40px" ShowGridLines="True" Width="30%" Style="width: 200px; margin-left: auto; margin-right: auto" />
            <br />

            <input type="hidden" name="<%= ASPSubmit.ClientID %>" value="Submit" />
            <asp:Button runat="server" ID="ASPSubmit" OnClick="Button1_Click" Text="Submit" class="button" ClientIDMode="Static" />

            <br />
            <asp:Label Style="align-content: center" ID="Label1" runat="server" ClientIDMode="Static" />
            <p style="text-align: center">Pasword will be sent to you once a staff member has manually gone over your request.</p>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
