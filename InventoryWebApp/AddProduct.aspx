<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="InventoryWebApp.AddProduct" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Product | Details</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/steps/jquery.steps.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

 
    <script src="js/plugins/steps/jquery.steps.min.js"></script>

    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>

    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to delete the product?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
</head>

<body class="">



    <div id="page-wrapper" class="gray-bg">
       
          <div class="wrapper wrapper-content">
           
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <div class="ibox-title text-center">
                                <asp:Label id="lblNew" runat="server" Text="New Product" Font-Bold="true"></asp:Label>
                            </div>
                            <div class="ibox-content">
                                
                                <form id="form1" runat="server">
                                   
                                    <div><br /></div>
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <asp:Label ID="lblAddProduct" runat="server" Text="Product Information" Font-Bold="True" Font-Size="Larger"></asp:Label><br />
                                            <div class="form-group" style="margin-top: 21px" >
                                                <asp:Label ID="lblPid" runat="server" Text="Product Id"></asp:Label><br />
                                                 <asp:TextBox runat="server" ID="txtPid" TextMode="SingleLine" CssClass="form-control widthtxt" Enabled="false"/><br />
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblPname" runat="server" Text="Product Name"></asp:Label><br />
                                                 <asp:TextBox runat="server" ID="txtPname" TextMode="SingleLine" CssClass=" form-control widthtxt"/>
                                           </div>
                                            <div class="form-group">  
                                               
                                                  <asp:Label ID="lblPcat" runat="server" Text="Category"></asp:Label>   <br />  
                                                <p style="display:flex;">
                                                <asp:DropDownList ID="ddlPcat" runat="server" CssClass="form-control widthtxt ddlht"></asp:DropDownList>
                                                    <asp:TextBox ID="txtAddcat" runat="server" CssClass="form-control widthtxt txtCat" Visible="false" />
                                                
                                              <button type="button" runat="server" id="btnAddcat" class="btn btn-success" style="margin-left:10px" onserverclick="addCat"><i class="fa fa-plus"></i></button>
                                                    <button type="button" runat="server" id="btnAddcat2" class="btn btn-success" style="margin-left:10px" visible="false" onserverclick="addCat2"><i class="fa fa-plus"></i></button>
                                                  </p>
                                            </div> 
                                            <div class="form-group">
                                                <asp:Label ID="lblPnou" runat="server" Text="No. of Units"></asp:Label><br />
                                                 <asp:TextBox runat="server" ID="txtPnou" TextMode="SingleLine" CssClass="form-control widthtxt"/><br />
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblPrice" runat="server" Text="Unit price"></asp:Label><br />
                                                 <asp:TextBox runat="server" ID="txtPrice" TextMode="SingleLine" CssClass="form-control widthtxt"/><br />
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblTax" runat="server" Text="VAT/unit"></asp:Label><br />
                                                 <asp:TextBox runat="server" ID="txtTax" TextMode="SingleLine" CssClass="form-control widthtxt"/><br />
                                            </div>
        
                                            <br/>
                                          <div>
                                              <asp:button  style=" margin-right:50px;" runat="server" ID="btnSave" text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />
                                          
                                              <asp:button  style="margin-right:50px" runat="server" ID="btnClear" text="Clear" CssClass="btn btn-success" OnClick="btnClear_Click" />

                                             <asp:button  style="margin-right:50px" runat="server" ID="btnDelete" text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click" OnClientClick="Confirm()"/>
                                          </div>
                                            
                                        </div>
                                        </div>
                                       

                                  
                                </form>
                              
                            </div>
                        </div>
                    </div>

                </div>
           </div> 
        </div>

 </body>  


</html>
