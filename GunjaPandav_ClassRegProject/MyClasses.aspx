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
                List<string> ClassList = sqlConn.ListMyClasses(StudentID);

                //var labels = this.Controls.OfType<Label>()
                //              .Where(c => c.ID.Contains("class"))
                //              .ToList();

                //Response.Write(ClassList.Count().ToString()+"  "+labels.Count().ToString());

                foreach (string className in ClassList)
                {
                    Label myLabel = new Label();

                    // Set the label's Text and ID properties.
                    myLabel.Text = className;
                    myLabel.ID = "Label" + className;
                    myLabel.CssClass = "floating-box p";
                    Panel1.Controls.Add(myLabel);

                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="rcorners2">
    <br />
    <br />
        <span class="auto-style1">You are registered for following courses. To see a list of available classes, click <a href="Register.aspx">here</a></span><br />
        <span class="auto-style1">To unregister from a class, please give us a call at 111-222-3333</span>
        <br />
       <asp:Panel ID="Panel1" runat="server"></asp:Panel>
     <%--    <div class="floating-box">
            <asp:Label runat="server" Visible="false" ID="class1" CssClass="auto-style1"  ClientIDMode="Static"/>
            
        </div>
        <div class="floating-box">
            <asp:Label runat="server" Visible="false" ID="class2" CssClass="auto-style1"  ClientIDMode="Static"/>
            
        </div>
        <div class="floating-box">
            <asp:Label runat="server" Visible="false" ID="class3" CssClass="auto-style1"  ClientIDMode="Static"/>
            
        </div>
        <div class="floating-box">
            <asp:Label runat="server" Visible="false" ID="class4" CssClass="auto-style1"  ClientIDMode="Static"/>
            
        </div>
        <div class="floating-box">
            <asp:Label runat="server" Visible="false" ID="class5" CssClass="auto-style1"  ClientIDMode="Static"/>
            
        </div>
        <div class="floating-box">
            <asp:Label runat="server" Visible="false" ID="class6" CssClass="auto-style1"  ClientIDMode="Static"/>
            
        </div>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
