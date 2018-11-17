<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="InventoryWebApp.Expense" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Expenses</title>
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
    <link href="plugins/dataTables/datatables.min.css" rel="stylesheet" />
    <script src="js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
    <script src="js/plugins/dataTables/datatables.min.js"></script>

    <script src="js/plugins/steps/jquery.steps.min.js"></script>

    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [

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
</head>
<body class="">
    <form id="form2" runat="server">
        <div id="wrapper">
            <nav class="navbar-default navbar-static-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav metismenu" id="side-menu">
                        <li class="nav-header">
                            <div class="dropdown profile-element">
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
                            <a href="Purchase.aspx"><i class="fa fa-shopping-cart"></i><span class="nav-label">Purchase<span class="fa arrow"></span></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li><a href="PurchaseReturn.aspx">Purchase Return</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="Sales.aspx"><i class="fa fa-window-restore"></i><span class="nav-label">Sales<span class="fa arrow"></span></span></a>
                            <ul class="nav nav-second-level collapse">
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
                                <h5>Other Expenses</h5>
                            </div>
                            <div class="ibox-content">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
                                            <asp:TextBox runat="server" ID="txtDate" TextMode="Date" CssClass="form-control" Style="width: 16% !important; display: inline-block !important; margin-left: 50px"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblType" runat="server" Text="Type"></asp:Label>
                                            <asp:DropDownList runat="server" ID="ddlType" CssClass="form-control ddlht" Style="width: 16% !important; display: inline-block !important; margin-left: 50px">
                                                <asp:ListItem Text="General Expenses"></asp:ListItem>
                                                <asp:ListItem Text="Other"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblAmt" runat="server" Text="Net Amount"></asp:Label>
                                            <asp:TextBox runat="server" ID="txtAmt" TextMode="SingleLine" CssClass="form-control ddlht width" Style="display: inline-block !important; margin-left: 5px"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblDetails" runat="server" Text="Description"></asp:Label>
                                            <br />
                                            <asp:TextBox runat="server" ID="txtDetails" TextMode="MultiLine" CssClass="form-control" Style="width: 24%"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click"></asp:Button>
                                            <asp:Button runat="server" ID="btnClear" Text="Clear" CssClass="btn btn-success" OnClick="btnClear_Click"></asp:Button>
                                        </div>
                                        <br />
                                        <div class="form-group text-center">
                                            <asp:Label ID="lblFrom" runat="server" Text="From:"></asp:Label>
                                            <asp:TextBox runat="server" ID="txtFrom" TextMode="Date" CssClass="form-control" Style="width: 16% !important; display: inline-block !important" AutoPostBack="true" OnTextChanged="txtFrom_TextChanged"></asp:TextBox>
                                            <asp:Label ID="lblTo" runat="server" Text="To:"></asp:Label>
                                            <asp:TextBox runat="server" ID="txtTo" TextMode="Date" CssClass="form-control" Style="width: 16% !important; display: inline-block !important" AutoPostBack="true" OnTextChanged="txtTo_TextChanged" />
                                        </div>
                                        <div class="table-responsive">
                                            <asp:Repeater ID="rptData" runat="server">
                                                <HeaderTemplate>
                                                    <table class="table table-striped table-hover dataTables-example">
                                                        <thead style="background-color: #1c84c6; color: white">
                                                            <tr>
                                                                <th>No.</th>
                                                                <th>Date</th>
                                                                <th>Description</th>
                                                                <th>Amount</th>
                                                                <th>Expense Type</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr class="gradeX">
                                                        <td><%# ++count%></td>
                                                        <td><%# Convert.ToDateTime(Eval("Date")).Date.ToString("dd-MM-yyyy") %></td>
                                                        <td><%# Eval("Details")%></td>
                                                        <td><%# Eval("Amount")%></td>
                                                        <td><%# Eval("Type")%></td>
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
            </div>
        </div>
    </form>
</body>
</html>

