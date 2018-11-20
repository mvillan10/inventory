<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="InventoryWebApp.Register" %>

<!DOCTYPE html>
<style>
    #compConfirm{
        margin-left:-175px;
    }

    </style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>INVENTORY | Register</title>
    <link href="CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/default.css" rel="stylesheet" />
    <link href="CSS/style.css" rel="stylesheet" />
    <link href="CSS/animate.css" rel="stylesheet" />

</head>
    
<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <%--<div style="background-color:#3ba255;color:white;height:34px">
                <asp:Label runat="server" Text="ed"></asp:Label>
            </div>--%>
           <asp:Panel ID="Panel1" runat="server" Visible="false">
                            <div style="padding:6px;background-color:#3ba255;color:white;height:34px">Registration Successful </div>
                       
             </asp:Panel>
     <div>

                <h1 class="logo-name">IN+</h1>

            </div>
            <h3>Register to IN+</h3>
            <p>Create account to see it in action.</p>
            <form id="form1" runat="server" class="m-t">
                 <div class="form-group">
                    <asp:Textbox ID="txtUserid" runat="server" CssClass="form-control" placeholder="User id" required OnTextChanged="txtUserid_TextChanged" AutoPostBack="true"/>
                     <%--<asp:RequiredFieldValidator ID="reqUid" runat="server" ControlToValidate="txtUserid" ErrorMessage="Enter User id" ForeColor="Red" />--%>
                    <asp:Label runat="server" ID="lblUid" Text="" style="margin-left:-76px" ForeColor="Red"/>
                </div>
                <div class="form-group">
                    <asp:Textbox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" required OnTextChanged="txtUsername_TextChanged" AutoPostBack="true"/>
                    <%--<asp:RequiredFieldValidator ID="reqUname" runat="server" ControlToValidate="txtUsername" ErrorMessage="Enter a username" ForeColor="Red" style="margin-left:-203px" />--%>
                    <asp:Label runat="server" ID="lblUname" Text="" style="margin-left:-105px" ForeColor="Red"/>
                </div>
                <div class="form-group">
                    <asp:Textbox ID="txtPassword" runat="server"  CssClass="form-control" placeholder="Password" TextMode="Password" required/>
                    <asp:RegularExpressionValidator ID="regPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter valid password" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,}$"></asp:RegularExpressionValidator>
                  
                 </div>
                <div class="form-group">
                    <asp:Textbox ID="txtConfirm" runat="server"  CssClass="form-control" placeholder="Confirm Password" TextMode="Password" required/>
                    <asp:CompareValidator ID="compConfirm" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirm" ErrorMessage="Password mismatch!" ForeColor="Red"></asp:CompareValidator>
                </div>
                <asp:Button ID="btnReg" runat="server" Text="Register" CssClass="btn btn-success block full-width m-b" OnClick="btnReg_Click"/>
                
             </form>
            
        </div>
    </div>
   <%-- <div class="footer">
          <p class="text-center"> <small>The IN+ app is developed by ictcodes Pvt. Ltd. &copy; 2018</small> </p>
   </div>--%>



</body>


</html>

