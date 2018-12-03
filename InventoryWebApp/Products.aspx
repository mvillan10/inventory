<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="InventoryWebApp.ProductDetails" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Product | Dashboard</title>
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
                        <div class="ibox-title">      
                            <a onclick="MyPopUpWin('/AddProduct.aspx',1000,600); return false;" class="btn btn-success" style=""><i class="fa fa-plus"></i>&nbsp;Add Product</a>
                            <br />
                            <br />
                           <h5>Product Details</h5>
                             <button type="button" style="margin-left:0px" class="btn btn-toolbar" runat="server" onserverclick="refresh"><i class="fa fa-refresh"></i></button>
                       </div>
                        <div class="ibox-content">
                           
                            <div class="table-responsive">
                                <asp:Repeater ID="rptData" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-striped table-bordered table-hover dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Product_Id</th>
                                                    <th>Product Name</th>
                                                    <th>Category</th>
                                                    <th>Qty</th>
                                                    <th>Unit Price</th>
                                                    <th>VAT/unit</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <tr class="gradeX">

                                            <td><%#++count%></td>
                                           
                                            <td><a onclick="MyPopUpWin('/AddProduct.aspx?id=<%# Eval("P_id")%>',1000,600); return false;"><%# Eval("P_id")%></a></td>
                                            <td><%# Eval("P_name")%></td>
                                            <td><%# Eval("Cat_name")%></td>
                                            <td><%# Eval("P_unit")%></td> 
                                            <td><%# Eval("P_price")%></td>
                                            <td><%# Eval("P_tax")%></td>
                                        </tr>

                                    </ItemTemplate>

                                    <FooterTemplate>
                                        </tbody>
                       
                                </table>
                                    </FooterTemplate>

                                </asp:Repeater>

                            </div>

                        </div>

                    </div>
                    

                </div>
          

                </div>

            </div>



        </div>
 
    </form>
    




    <!-- Mainly scripts -->

    <script>
        $(document).ready(function () {
            $('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    { extend: 'copy' },
                    { extend: 'csv' },
                    { extend: 'excel', title: 'ExampleFile' },
                    { extend: 'pdf', title: 'ExampleFile' },

                    {
                        extend: 'print',
                        customize: function (win) {
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');

                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                        }
                    }
                ]

            });

        });

    </script>

</body>
</html>