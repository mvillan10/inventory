<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierDetails.aspx.cs" Inherits="InventoryWebApp.SupplierDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier | Details</title>
 <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link href="css/plugins/steps/jquery.steps.css" rel="stylesheet"/>
    <link href="css/animate.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>
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
    
    
</head>
<body>

    <form id="form1" runat="server">
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
                        <h5>Supplier Details</h5>
                    </div>
                    <div class="ibox-content">
                        <asp:Label ID="Label1" runat="server" Text="Search Supplier Name" ></asp:Label>
                        <br />
                        <asp:TextBox ID="txtSupplierName" runat="server" CssClass="form-control-sm form-control width" OnTextChanged="Search" AutoCompleteType="none" AutoPostBack="true"></asp:TextBox>
                        <br />
                        <br />
                        <asp:DataGrid ID="Grid" runat="server" CssClass="table table-striped table-hover dataTables-example" PageSize="25" AllowPaging="True" AutoGenerateSelectButton="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" OnPageIndexChanged="Grid_PageIndexChanged" >

                            <Columns>
                                <asp:BoundColumn HeaderText="Supplier Name" DataField="S_name" HeaderStyle-Width="150px" />
                                <asp:BoundColumn HeaderText="Address" DataField="S_address" HeaderStyle-Width="350px"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Phone" DataField="S_phone" HeaderStyle-Width="100px"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Balance Amount" DataField="Balance" HeaderStyle-Width="150px"></asp:BoundColumn>
 
                            </Columns>

                            <FooterStyle BackColor="#dee2e6" Font-Bold="True" ForeColor="White" />
                            <SelectedItemStyle BackColor="#2f4050" Font-Bold="True" ForeColor="Navy" />
                            <PagerStyle BackColor="#afd7e8" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />
                            <AlternatingItemStyle BackColor="White" />
                            <ItemStyle BackColor="#dbf1ff" ForeColor="#333333" />
                            <HeaderStyle BackColor="#1c84c6" Font-Bold="True" ForeColor="White" />

                        </asp:DataGrid>

                    </div>
                </div>
            </div>
            </div>
        </div>
            </div>
    </form>
</body>
    <script>
        $(document).ready(function(){
            $('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                   
                    {extend: 'print',
                     customize: function (win){
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
</html>
