﻿
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="InventoryWebApp.Sales" %>

<!DOCTYPE html>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Invoice | Dashboard</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">


    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script src="js/plugins/flot/jquery.flot.js"></script>
    <script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="js/plugins/flot/jquery.flot.symbol.js"></script>
    <script src="js/plugins/flot/jquery.flot.time.js"></script>

    <!-- Peity -->
    <script src="js/plugins/peity/jquery.peity.min.js"></script>
    <script src="js/demo/peity-demo.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <%--<script src="js/plugins/pace/pace.min.js"></script>--%>

    <!-- jQuery UI -->
    <script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- Jvectormap -->
    <script src="js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

    <!-- EayPIE -->
    <script src="js/plugins/easypiechart/jquery.easypiechart.js"></script>

    <!-- Sparkline -->
    <script src="js/plugins/sparkline/jquery.sparkline.min.js"></script>

    <!-- Sparkline demo data  -->
    <script src="js/demo/sparkline-demo.js"></script>
    <script src="js/plugins/dataTables/datatables.min.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
   <script>
        function MyPopUpWin(url, width, height) {
            var date = document.getElementById("txtDate");
            var no = document.getElementById("txtNo");
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url+'?InvoiceNo='+no.value+'&Date='+date.value, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
    }
        </script>
    <script>
    function MyPopUpWin1(url, width, height) {
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
 <body>
<form id="form1" runat="server">
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            
                            <a class="dropdown-toggle" href="#">
                                    <span class="block m-t-xs font-bold"><%=Session["User"]%></span>
                                    <span class="text-muted text-xs block"><%=Session["UserId"]%> </span>
                                </a>
                            
                        </div>
                        <div class="logo-element">
                            IN+
                        </div>
                    </li>
                    <li>
                        <a href="Home.aspx"><i class="fa fa-th-large"></i><span class="nav-label">Dashboards</span> </a>

                    </li>
                    <li>
                        <a  href="Products.aspx" ><i class="fa fa-shopping-basket"></i><span class="nav-label">Products</span></a>
                    </li>
                    <li>
                        <a  href="AddOrder.aspx" ><i class="fa fa-cart-plus"></i><span class="nav-label">Order</span></a>
                    </li>
                    <li>
                        <a href="Purchase.aspx"><i class="fa fa-shopping-cart"></i><span class="nav-label">Purchase</span></a>
                    </li>
                    <li>
                        <a href="Sales.aspx"><i class="fa fa-window-restore"></i><span class="nav-label">Sales</span></a>
                    </li>
                    <li>
                        <a href="PurchaseReturn.aspx"><i class="fa fa-cart-arrow-down"></i><span class="nav-label">Return<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="PurchaseReturn.aspx">Purchase Return</a></li>
                            <li><a href="SalesReturn.aspx">Sales Return</a></li>
                        </ul>
                    </li>
                    <li>
                        <a  href="CustomerDetails.aspx" ><i class="fa fa-user-circle"></i><span class="nav-label">Customer Details</span></a>
                    </li>
                    <li>
                        <a  href="SupplierDetails.aspx" ><i class="fa fa-users"></i><span class="nav-label">Supplier Details</span></a>
                    </li>
                    <li>
                        <a  href="CreditRepay.aspx" ><i class="fa fa-credit-card"></i><span class="nav-label">Credit Repay</span></a>
                    </li>
                    <li>
                        <a  href="Expense.aspx" ><i class="fa fa-shopping-bag"></i><span class="nav-label">Other Expense</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-book"></i><span class="nav-label">Reports</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                                <li><a href="OrderSummary.aspx">Order</a></li>
                                <li><a href="PurchaseDetailReport.aspx">Purchase Detail Report</a></li>
                                <li><a href="Search.aspx">Sales Invoice</a></li>
                                <li><a href="SearchByDate.aspx">Sales Detail Report</a></li>

                        </ul>
                    </li>

                </ul>

            </div>
        </nav>

        <div id="page-wrapper1" class="gray-bg">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li>
                            <span class="m-r-sm text-muted welcome-message">Welcome to Product Dashboard.</span>
                        </li>
                       
                        <li>
                            <asp:LinkButton runat="server" ID="btnLogout" OnClick="logout">
                            <i class="fa fa-sign-out"></i>Logout</asp:LinkButton>
                        </li>

                    </ul>

                </nav>
                <div class=" col-sm">
                     <div class="ibox">
                         <div class="ibox-title text-center">
                             <h5>Invoice Details</h5>
                          </div>
                          <div class="ibox-content">
                                <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group" >
                                                 <asp:Label ID="lblNo" runat="server" Text="Invoice No."></asp:Label>
                                                <asp:TextBox runat="server" ID="txtNo" TextMode="SingleLine" CssClass="form-control" style="width:134px !important; display:inline-block !important" Enabled="false"/>
                                                <asp:Label ID="lblPer" runat="server" Text="Sales Person" style="margin-left:33px"></asp:Label>
                                                <asp:TextBox runat="server" ID="txtPer" TextMode="SingleLine" CssClass="form-control" style="width:185px !important; display:inline-block !important" Enabled="false"/>
                                                <asp:Label ID="lblDate" runat="server" Text="Date:" style="margin-left:270px" ></asp:Label>
                                               <asp:TextBox runat="server" ID="txtDate" TextMode="SingleLine" CssClass="form-control" style="width:120px !important; display:inline-block !important"/>
                                                <asp:Button ID="btnNew" runat="server" OnClick="btnNew_Click" Text="New" CssClass="btn btn-success" />
                                                <a runat="server" onclick="MyPopUpWin('/SalesReport.aspx',1100,600); return false;" id="btnPrint" class="btn btn-success" Visible="false"><i class="fa fa-print"></i>&nbsp;Print</a>
                                            </div> <br />
                                            <div class="form-group" >
                                                <asp:Label ID="lblType" runat="server" Text="Payment Type"></asp:Label>
                                                <asp:DropDownList runat="server" ID="ddlType" CssClass="form-control ddlht width">
                                                      <asp:ListItem Text="card"></asp:ListItem>
                                                      <asp:ListItem Text="cash"></asp:ListItem>
                                                      <asp:ListItem Text="credit"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:Label ID="lblCus" runat="server" Text="Customer Name" style="margin-left: 75px"></asp:Label>
                                                <asp:DropDownList runat="server" ID="ddlCus" CssClass="form-control ddlht width" AutoPostBack="true"/>
                                                <a onclick="MyPopUpWin1('/AddCustomer.aspx',1000,600);" class="btn btn-success float-left m-t-n-xs" style="margin-left: 0px;color:#fff"><i class="fa fa-plus"></i></a>
                                                <br /><br />
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblCat" runat="server" Text="Category"></asp:Label>
                                                <asp:Label ID="lblItem" runat="server" Text="Product Name" style="margin-left:133px"></asp:Label>
                                                <asp:Label ID="lblUnit" runat="server" Text="Units" style="margin-left:99px"></asp:Label> 
                                               
                                                <asp:Label ID="lblPrice" runat="server" Text="Unit Price" style="margin-left:98px"></asp:Label>
                                                <asp:Label ID="lblTotal" runat="server" Text="Sold Price" style="margin-left:126px"></asp:Label>  
                                                 <asp:Label ID="lblVat" runat="server" Text="VAT" style="margin-left:124px"></asp:Label> 
                                                      
                                                <p style="display:flex">
                                                        <asp:DropDownList ID="ddlCat" runat="server" CssClass="form-control ddlht" style="width:172px" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:DropDownList ID="ddlItem" runat="server" CssClass="form-control ddlht" style="margin-left:18px;width:172px" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:TextBox runat="server" ID="txtUnit" TextMode="SingleLine" CssClass=" form-control" style="margin-left:18px;width:114px" OnTextChanged="txtUnit_TextChanged" AutoPostBack="true" />
                                                        <asp:TextBox runat="server" ID="txtPrice" TextMode="SingleLine" CssClass=" form-control" style="margin-left:18px;width:170px" Enabled="false"/>
                                                         <asp:TextBox runat="server" ID="txtTotal" TextMode="SingleLine" CssClass=" form-control" style="margin-left:18px;width:170px" Enabled="false"/>   
                                                    <asp:TextBox runat="server" ID="txtVat" TextMode="SingleLine" CssClass=" form-control" style="margin-left:18px;width:114px" Enabled="false"/>
                                                        
                                                        <asp:button runat="server" ID="btnAdd" class="btn btn-success" style="margin-left:18px" Text="Add" OnClick="btnAdd_Click"></asp:button>
                                                </p>
                                                <p>
                                                    <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" style="margin-left:379px" ></asp:Label> 
                                                </p>
                                            </div>
                                             
                                        <div class="ibox-content">
                                             <div class="table-responsive">
                                                <asp:Repeater ID="rptData" runat="server" OnItemDataBound="rptData_ItemDataBound" >
                                                    <HeaderTemplate>
                                                        <table class="table table-striped table-hover">
                                                            <thead style="background-color: #1c84c6;color: white">
                                                                <tr class="gradeX">
                                                                   
                                                                     <th>No.</th>
                                                                    <th>Product Name</th>
                                                                    <th>Category</th>
                                                                    <th>Units</th>
                                                                     <th>Unit Price</th>
                                                                    <th>VAT</th>
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
                                                              <td><%# Eval("Cat_name")%></td>
                                                              <td><%# Eval("P_qty")%></td>
                                                              <td><%# Eval("P_price")%></td>
                                                            <td><asp:Literal ID="litTax" runat="server"></asp:Literal></td>
                                                             <td><%# Eval("P_tot")%></td>
                                                            <td><asp:LinkButton runat="server" ID="btnDelete" Text="Delete" OnCommand="btnDelete_Command" CommandName="Delete" CommandArgument='<%# Eval("P_no") %>'  ></asp:LinkButton></td>
                                                               
                                                             <asp:HiddenField runat="server" ID="hid" Value='<%# Eval("P_no") %>' />
                                                            
                                                       </tr>
                                                   </ItemTemplate>
                                                 <FooterTemplate>
                                                        </tbody>
                       
                                            </table>
                                                     
                                              </FooterTemplate>
                                               
                                         </asp:Repeater>
                                                
                                                 <br />
                                                 <br />
                                    <asp:Panel runat="server" ID="Panel1" >
                                        <div class="form-group">
                                            <asp:Label ID="lblBill" runat="server" Text="Bill discount" ></asp:Label>
                                                <asp:TextBox runat="server" ID="txtBill" TextMode="SingleLine" CssClass="form-control width" /><br />
                                        </div>
                                         <div class="form-group">
                                            <asp:Label ID="lblCamt" runat="server" Text="Amount paid by Customer" ></asp:Label>
                                                <asp:TextBox runat="server" ID="txtCamt" TextMode="SingleLine" CssClass="form-control width" OnTextChanged="txtCamt_TextChanged" AutoPostBack="true" /><br />
                                        </div><br />
                                        <div class="form-group">
                                                    
                                                    <asp:Label ID="lblBal" runat="server" Text="Balance" style="margin-left:75px"></asp:Label>
                                                    <asp:Label ID="lblCredit" runat="server" Text="Credit" style="margin-left:155px" Visible="false"></asp:Label>
                                                   <asp:Label ID="lblSub" runat="server" Text="Total Amount" style="margin-left:167px"></asp:Label>
                                               
                                                <asp:Label ID="lblTax" runat="server" Text="VAT" style="margin-left:123px"></asp:Label>
                                                
                                                 <asp:Label ID="lblAmount" runat="server" Text="Net Amount" style="margin-left:183px"></asp:Label>
                                            <p style="display:flex">
                                            <asp:TextBox runat="server" ID="txtBal" TextMode="SingleLine" style="margin-left:73px;font-weight:bold" CssClass="form-control width" Enabled="false" />
                                                <asp:TextBox runat="server" ID="txtCredit" TextMode="SingleLine" CssClass="form-control width" style="margin-left:20px" Visible="false" Enabled="false" />
                                             <asp:TextBox runat="server" ID="txtSub" TextMode="SingleLine" CssClass="form-control width" style="margin-left:20px" Enabled="false" />
                                            <asp:TextBox runat="server" ID="txtTax" TextMode="SingleLine" CssClass="form-control width " style="margin-left:20px" Enabled="false" />
                                                <asp:TextBox runat="server" ID="txtAmount" TextMode="SingleLine" style="margin-left:20px;font-weight:bold" CssClass="form-control width" Enabled="false" />
                                            </p>
                                         </div>
                                    </asp:Panel>
                                     </div>
                                            <asp:Button ID="btnSale" runat="server" CssClass="btn btn-success" Text="Add SALE" OnClick="btnSale_Click" />
                                             <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-success" Text="Cancel" OnClick="btnCancel_Click" />
                                           
                                            </div>
                                        </div>
                                 </div>
                         </div>
                       </div>
                    </div>

                </div>
           </div> 
        </div>
     </form>
 </body>  


</html>
