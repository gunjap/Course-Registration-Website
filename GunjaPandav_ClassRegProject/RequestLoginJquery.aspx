<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery.validate.js"></script>
    <script type="text/javascript">
       $(document).ready(function () {

           $('#rcorners2').validate({ // initialize the plugin
               rules: {
                   nameTextBox: {
                       required: true
                   },
                   loginTextBox: {
                       required: true,
                       minlength: 5
                   },
                   emailTextBox: {
                       required: true,
                       email: true
                   }
               },
               errorPlacement: function(error, element) {
                       error.insertBefore(element);
               },
              
               submitHandler: function (form) { // for demo
                   alert('valid form submitted'); // for demo
                   return false; // for demo
               }
           });

       });
    </script>

    <style type="text/css">
        #dataTextBox {
            height: 167px;
            width: 437px;
        }

        #nameTextBox {
            margin-left: 0px;
            width: 250px;
        }

        #loginTextBox {
            margin-left: 0px;
            width: 250px;
        }

        #emailTextBox {
            margin-left: 0px;
            width: 250px;
        }

        .auto-style1 {
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            font-size: 16px;
            text-align: left;
        }

        .auto-style2 {
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            display: inline-block;
            width: 40%;
            height: 25px;
            margin: 0px;
            /*border: 3px solid #73AD21;*/
            text-align: right;
        }

        .leftaligned {
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            display: inline-block;
            width: 40%;
            height: 25px;
            margin: 0px;
            /*border: 3px solid #73AD21;*/
            text-align: left;
        }

        .center {
            text-align: center;
            border: 3px solid green;
        }

        #rcorners1 {
            border-radius: 15px;
            background-color: bisque;
            padding: 20px 0px 10px;
            width: 50%;
            height: 50px;
            text-align: center;
            margin: 0 auto;
        }

        #rcorners2 {
            border-radius: 25px;
            background-color: antiquewhite;
            padding: 0px;
            width: 50%;
            height: 500px;
            text-align: center;
            margin: 0 auto;
        }

        .button {
            background-color: burlywood;
            border: none;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            padding: 10px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 15px;
        }
    </style>
</head>
<body>

    <form id="rcorners2" runat="server">
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
            <input type="submit" class=button onclick="Button1_Click" runat="server" />
            <br />
            Pasword will be sent to you once a staff member has manually gone over your request.</span>
    </form>
</body>
</html>
