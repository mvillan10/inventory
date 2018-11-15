<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="InventoryWebApp.AddOrder" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Order | Details</title>
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
    <script>
    function MyPopUpWin(url, width, height) {
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
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
                                <h5>Order Details</h5>
                            </div>
                            <div class="ibox-content">
                                
                                <form id="form1" runat="server">
                                   
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:Label ID="lblOrderProduct" runat="server" Text="Order Product" Font-Bold="True" Font-Size="Larger"></asp:Label><br />
                                            <div class="form-group" style="margin-top: 21px" >
                                                <asp:Label ID="lblOrder" runat="server" Text="Order No."></asp:Label> 
                                                 <asp:TextBox runat="server" ID="txtOrder" TextMode="SingleLine" CssClass="form-control width"/><br />
                                            </div>
                                                  <div class="form-group" >
                                                 <asp:Label ID="lblSup" runat="server" Text="Supplier" ></asp:Label> 
                                                <asp:Label ID="lblProd" runat="server" Text="Product Name" style="margin-left:202px"></asp:Label>
                                                <asp:Label ID="lblPqty" runat="server" Text="Quantity" style="margin-left:0px"></asp:Label>
                                               <br />
                                                 <p style="display:flex;">
                                                     
                                                        <asp:DropDownList ID="ddlSup" runat="server" CssClass="form-control ddlht" style="width:190px" OnSelectedIndexChanged="ddlSup_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        <a onclick="MyPopUpWin('/AddSupplier.aspx',600,1000);" class="btn btn-success" style="margin-left: 4px;color:#fff"><i class="fa fa-plus"></i></a>
                                                       <asp:DropDownList ID="ddlProd" runat="server" CssClass="form-control ddlht" style="margin-left:28px;width:190px" OnSelectedIndexChanged="ddlProd_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:TextBox runat="server" ID="txtPqty" TextMode="SingleLine" CssClass=" form-control width" style="margin-left:20px" />
                                                        <button runat="server" class="btn btn-success" style="margin-left:20px" onserverclick="addOrder"><i class="fa fa-plus "></i>Add Order</button>
                                                 </p>
                                                <p>
                                                <asp:RequiredFieldValidator ID="required" runat="server" style="margin-left:529px" ControlToValidate="txtPqty" ErrorMessage="Enter the quantity" ForeColor="Red" />
                                                 </p>
                                            </div>

                                            
                                            <div class="col-lg-10">        
                                             <div class="table-responsive">
                                                <asp:Repeater ID="rptData" runat="server">
                                                    <HeaderTemplate>
                                                        <table class="table table-striped table-hover">
                                                            <thead style="background-color: #1c84c6;color: white">
                                                                <tr>
                                                                     <th>No.</th>
                                                                    <th>Product Name</th>
                                                                    <th>Qty</th>
                                                                     <th>Unit Price</th>
                                                                     <th>Total</th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                   </HeaderTemplate>
                                                   <ItemTemplate>
                                                        <tr class="gradeX">
                                                            
                                                             <td><%# ++count%></td>
                                                             <td><%# Eval("P_name")%></td>
                                                             <td><%# Eval("P_qty")%></td>
                                                             <td><%# Eval("P_price")%></td>
                                                             <td><%# Eval("P_tot")%></td>
                                                             <td><asp:LinkButton runat="server" ID="btnDelete" Text="Delete" OnCommand="btnDelete_Command" CommandName="Delete" CommandArgument='<%# Eval("No") %>'></asp:LinkButton></td>
                                                            <asp:HiddenField runat="server" ID="hid" Value='<%# Eval("No") %>' />
                                                            
                                                       </tr>
                                                   </ItemTemplate>

                                    <FooterTemplate>
                                        </tbody>
                       
                                </table>
                                        
                                        </FooterTemplate>
                                                    
                                </asp:Repeater>
                                    </div>

                                </div>
                        
                          
                                            <div>
                                              <asp:button runat="server" ID="btnOrder" text="Order" CssClass="btn btn-success" OnClick="btnOrder_Click" Visible="false" />
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

