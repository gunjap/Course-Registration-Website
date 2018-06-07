<%@ Page Title="" Language="C#" MasterPageFile="~/FinalProject.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                ClassReg sqlConn = new ClassReg();
                int StudentID = (int)Session["StudentID"];
                Dictionary<string, List<String>> ClassList = sqlConn.ListMyClasses(StudentID);

                foreach (KeyValuePair<string, List<string>> kvp in ClassList)
                {
                    Label myLabel = new Label();
                    Panel myPanel = new Panel();

                    // Set the label's Text and ID properties.
                    string classDetails = "<p>" + kvp.Value[0] + "</p><p>" + kvp.Value[2] + "</p><p>" + kvp.Value[1] + "</p>";
                    myLabel.Text = classDetails;
                    myLabel.ID = "Label" + kvp.Key;
                    myPanel.Controls.Add(myLabel);

                    myPanel.CssClass = "floating-box";
                    Panel1.Controls.Add(myPanel);

                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="rcorners2">
        <br />
        <br />
        <span class="auto-style1">You are registered for following courses. To see a list of available courses, click <a href="Register.aspx">here</a></span><br />
        <span class="auto-style1">To unregister from a course, please give us a call at 111-222-3333</span>
        <br />
        <asp:Panel ID="Panel1" runat="server"></asp:Panel>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
