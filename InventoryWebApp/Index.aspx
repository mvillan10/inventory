<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="InventoryWebApp.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/default.css" rel="stylesheet" />
    <link href="CSS/style.css" rel="stylesheet" />
    <link href="CSS/animate.css" rel="stylesheet" />
</head>
<body class="gray-bg">
    
        <div class="middle-box text-center loginscreen animated fadeInDown">
            <div>
            <div>

                <h1 class="logo-name">IN+</h1>

            </div>
                <h3>Welcome to Inventory Plus</h3>

                <p>Login to access the dashboard.</p>
                <form id="form1" runat="server" class="m-t">
                <div class="form-group">
                    <asp:Textbox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" required=""/>
                </div>
                <div class="form-group">
                    <asp:Textbox ID="txtpassword" runat="server"  CssClass="form-control" placeholder="Password" TextMode="Password" required=""/>
                </div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success block full-width m-b" OnClick="btnLogin_Click"/>

                    <p class="text-muted text-center"><small>Do not have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="Register.aspx">Register an account</a>

                </form>
             
               
            </div>
        </div>
   <div class="footer">
          <p class="text-center"> <small>The IN+ app is developed by ictcodes Pvt. Ltd. &copy; 2018</small> </p>
   </div>
</body>
</html>
