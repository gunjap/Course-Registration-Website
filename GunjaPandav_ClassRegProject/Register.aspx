<%@ Page Title="" Language="C#" MasterPageFile="~/FinalProject.Master" AutoEventWireup="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script runat="server">
      protected void Page_Load(object sender, EventArgs e)
      {
          ClassReg sqlConn = new ClassReg();
          Dictionary<string, List<String>> ClassList = sqlConn.ListAllClasses();

          foreach (KeyValuePair<string, List<string>> kvp in ClassList)
          {

              Label myLabel = new Label();
              Button myButton = new Button();
              Panel myPanel = new Panel();

              // Set the label's Text and ID properties.
              string classDetails = "<p>"+kvp.Value[0]+"</p><p>"+kvp.Value[2]+"</p><p>"+kvp.Value[1]+"</p>";
              myLabel.Text = classDetails;
              myLabel.ID = "Label" + kvp.Key;
              myPanel.Controls.Add(myLabel);

              myButton.Text = "Register";
              myButton.ID = "Button" + kvp.Key;
              myButton.CssClass = "register";
              myButton.CommandArgument = kvp.Key;
              myButton.Command += new CommandEventHandler(register_buttonclick);
              myPanel.Controls.Add(myButton);

              myPanel.CssClass = "floating-box";
              Panel1.Controls.Add(myPanel);

          }
      }
      protected void register_buttonclick(object sender, CommandEventArgs e)
      {
         
          if (Session["StudentID"] == null)
          {
              Response.Redirect("Login.aspx");
          }
          else
          {
              int classID = int.Parse((string)e.CommandArgument);
              int StudentID = (int)Session["StudentID"];

              ClassReg sqlConn = new ClassReg();
              int registerResult = sqlConn.RegisterForClass(StudentID, classID);

              //Response.Write("Registration Results is "+registerResult.ToString());

              if (registerResult != 0)
                  registered.Visible = true;
              else
                  Response.Redirect("MyClasses.aspx");
          }
      }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="rcorners2">
        <br />
        <span class="auto-style1">List of available classes</span><br />
        <asp:Label class="auto-style1" ID="registered" Text="You are already regisitered for this class" runat="server" Visible="false" ClientIDMode="Static" />
        <br />
        <asp:Panel ID="Panel1" runat="server"></asp:Panel>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
