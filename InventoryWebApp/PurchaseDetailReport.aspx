<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseDetailReport.aspx.cs" Inherits="InventoryWebApp.PurchaseDetailReport1" %>



<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Purchase | Detailed Report</title>
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
    <script src="js/plugins/pace/pace.min.js"></script>

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
            var month = document.getElementById("ddlMonth");
            var year = document.getElementById("ddlYear");
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url+'?Month='+month.value+'&Year='+year.value, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
    }
        </script>
    <script>
        function MyPopUpWin1(url, width, height) {
            var year = document.getElementById("ddlYr");
           
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url+'?Year='+year.value, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
    }
        </script>
</head>

<body class="">
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
                                <li><a href="Search.aspx">Sales Invoice</a></li>
                                <li><a href="SearchByDate.aspx">Detail Report</a></li>

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
                                <span class="m-r-sm text-muted welcome-message">Welcome to ..... Dashboard.</span>
                            </li>

                            <li>
                                <asp:LinkButton runat="server" ID="btnLogout" OnClick="logout">
                            <i class="fa fa-sign-out"></i>Logout</asp:LinkButton>
                            </li>

                        </ul>

                    </nav>
                    <div class="ibox">
                        <div class="ibox-title text-center">
                            <h5>Purchase Detailed Report</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <asp:RadioButton runat="server" ID="rbMonth" Text="Monthly Report" GroupName="Option" OnCheckedChanged="rbMonth_CheckedChanged" Style="margin-left: 20px" AutoPostBack="true" />
                                        <asp:RadioButton runat="server" ID="rbYear" Text="Annual Report" GroupName="Option" OnCheckedChanged="rbYear_CheckedChanged" Style="margin-left: 20px" AutoPostBack="true" />
                                    </div>
                                    <asp:Panel runat="server" ID="monthPanel" Visible="false">
                                        <div class="form-group text-center">
                                            <asp:Label ID="lblMonth" runat="server" Text="Month" Style="margin-left: 0px"></asp:Label>
                                            <asp:DropDownList runat="server" ID="ddlMonth" CssClass="form-control ddlht width" Style="display: inline-block !important">
                                                <asp:ListItem Text="January" Value="01"></asp:ListItem>
                                                <asp:ListItem Text="February" Value="02"></asp:ListItem>
                                                <asp:ListItem Text="March" Value="03"></asp:ListItem>
                                                <asp:ListItem Text="April" Value="04"></asp:ListItem>
                                                <asp:ListItem Text="May" Value="05"></asp:ListItem>
                                                <asp:ListItem Text="June" Value="06"></asp:ListItem>
                                                <asp:ListItem Text="July" Value="07"></asp:ListItem>
                                                <asp:ListItem Text="August" Value="08"></asp:ListItem>
                                                <asp:ListItem Text="September" Value="09"></asp:ListItem>
                                                <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                                <asp:ListItem Text="December" Value="12"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label ID="lblYear" runat="server" Text="Year" Style="margin-left: 0px"></asp:Label>
                                            <asp:DropDownList runat="server" ID="ddlYear" CssClass="form-control ddlht width" Style="display: inline-block !important">
                                                <asp:ListItem Text="2018"></asp:ListItem>
                                                <asp:ListItem Text="2019"></asp:ListItem>
                                                <asp:ListItem Text="2020"></asp:ListItem>
                                                <asp:ListItem Text="2021"></asp:ListItem>
                                                <asp:ListItem Text="2022"></asp:ListItem>
                                                <asp:ListItem Text="2023"></asp:ListItem>
                                                <asp:ListItem Text="2024"></asp:ListItem>
                                                <asp:ListItem Text="2025"></asp:ListItem>
                                                <asp:ListItem Text="2026"></asp:ListItem>
                                                <asp:ListItem Text="2027"></asp:ListItem>
                                                <asp:ListItem Text="2028"></asp:ListItem>
                                                <asp:ListItem Text="2029"></asp:ListItem>
                                                <asp:ListItem Text="2030"></asp:ListItem>
                                                <asp:ListItem Text="2031"></asp:ListItem>
                                                <asp:ListItem Text="2032"></asp:ListItem>

                                            </asp:DropDownList>
                                            <a runat="server" onclick="MyPopUpWin('/PurchaseMonthlyReport.aspx',1100,600); return false;" id="A1" class="btn btn-success"><i class="fa fa-print"></i>&nbsp;Print</a>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="yearPanel" Visible="false">
                                        <div class="form-group text-center">
                                            <asp:Label ID="lblYr" runat="server" Text="Year" Style="margin-left: 0px"></asp:Label>
                                            <asp:DropDownList runat="server" ID="ddlYr" CssClass="form-control ddlht width" Style="display: inline-block !important">
                                                <asp:ListItem Text="2018"></asp:ListItem>
                                                <asp:ListItem Text="2019"></asp:ListItem>
                                                <asp:ListItem Text="2020"></asp:ListItem>
                                                <asp:ListItem Text="2021"></asp:ListItem>
                                                <asp:ListItem Text="2022"></asp:ListItem>
                                                <asp:ListItem Text="2023"></asp:ListItem>
                                                <asp:ListItem Text="2024"></asp:ListItem>
                                                <asp:ListItem Text="2025"></asp:ListItem>
                                                <asp:ListItem Text="2026"></asp:ListItem>
                                                <asp:ListItem Text="2027"></asp:ListItem>
                                                <asp:ListItem Text="2028"></asp:ListItem>
                                                <asp:ListItem Text="2029"></asp:ListItem>
                                                <asp:ListItem Text="2030"></asp:ListItem>
                                                <asp:ListItem Text="2031"></asp:ListItem>
                                                <asp:ListItem Text="2032"></asp:ListItem>
                                            </asp:DropDownList>
                                            <a runat="server" onclick="MyPopUpWin1('/PurchaseYearReport.aspx',1100,600); return false;" id="A2" class="btn btn-success"><i class="fa fa-print"></i>&nbsp;Print</a>
                                        </div>
                                    </asp:Panel>
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

