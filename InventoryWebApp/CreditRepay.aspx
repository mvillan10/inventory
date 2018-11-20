<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreditRepay.aspx.cs" Inherits="InventoryWebApp.CreditRepay" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Credit | Repay</title>
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


</head>
<body class="">
    <form id="form2" runat="server">
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
                            <a href="Products.aspx"><i class="fa fa-shopping-basket"></i><span class="nav-label">Products</span></a>
                        </li>
                        <li>
                            <a href="AddOrder.aspx"><i class="fa fa-cart-plus"></i><span class="nav-label">Order</span></a>
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
                            <a href="CustomerDetails.aspx"><i class="fa fa-user-circle"></i><span class="nav-label">Customer Details</span></a>
                        </li>
                        <li>
                            <a href="SupplierDetails.aspx"><i class="fa fa-users"></i><span class="nav-label">Supplier Details</span></a>
                        </li>
                        <li>
                            <a href="CreditRepay.aspx"><i class="fa fa-credit-card"></i><span class="nav-label">Credit Repay</span></a>
                        </li>
                        <li>
                            <a href="Expense.aspx"><i class="fa fa-shopping-bag"></i><span class="nav-label">Other Expense</span></a>
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
                                <span class="m-r-sm text-muted welcome-message">Welcome to ...... Dashboard.</span>
                            </li>

                            <li>
                                <asp:LinkButton runat="server" ID="btnLogout" OnClick="logout">
                            <i class="fa fa-sign-out"></i>Logout</asp:LinkButton>
                            </li>

                        </ul>

                    </nav>
                    <div class="col-sm">
                        <div class="ibox">
                            <div class="ibox-title text-center">
                                <h5>Credit Repay</h5>
                            </div>
                            <div class="ibox-content">
                                <div class="form-group">
                                    <asp:RadioButton runat="server" ID="rbCustomer" Text="Customer" GroupName="Option" OnCheckedChanged="rbCustomer_CheckedChanged" Style="margin-left: 20px" AutoPostBack="true" />
                                    <asp:RadioButton runat="server" ID="rbSupplier" Text="Supplier" GroupName="Option" OnCheckedChanged="rbSupplier_CheckedChanged" Style="margin-left: 20px" AutoPostBack="true" />
                                </div>
                                <asp:Panel runat="server" ID="panel" Visible="false">
                                    <div class="form-group row">
                                        <div class="col-sm-10">
                                            <asp:TextBox runat="server" type="search" ID="txtSearch" list="datalist" CssClass="form-control form-control-sm width" required="" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            <asp:TextBox runat="server" type="search" ID="txtSearchSupplier" list="datalist2" CssClass="form-control form-control-sm width" required="" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" Visible="false"></asp:TextBox>
                                            <%--<input class="form-control form-control-sm width" type="search" list="datalist" id="txtbox" runat="server" />--%>
                                        </div>
                                        <datalist id="datalist" runat="server"></datalist>
                                        <datalist id="datalist2" runat="server"></datalist>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblCredit" runat="server" Text="Credit Amount"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtCredit" TextMode="SingleLine" Enabled="false" CssClass="form-control width" Style="display: inline-block !important"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblAmt" runat="server" Text="Amount to pay"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtAmt" TextMode="SingleLine" CssClass="form-control width" Style="display: inline-block !important"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <asp:Button runat="server" ID="btnPay" Text="Pay" CssClass="btn btn-success" OnClick="btnPay_Click" />
                                        <asp:Button runat="server" ID="btnClear" Text="Clear" CssClass="btn btn-success" OnClick="btnClear_Click" />
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

