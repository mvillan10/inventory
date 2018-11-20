<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="InventoryWebApp.Purchase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Purchase</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />


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

    <script src="Scripts/jquery.searchabledropdown-1.0.8.min.js" type="text/javascript"></script>
    <%-- <script type="text/javascript">
        $(document).ready(function () {
            $("select").searchable({
                maxListSize: 200, // if list size are less than maxListSize, show them all
                maxMultiMatch: 300, // how many matching entries should be displayed
                exactMatch: false, // Exact matching on search
                wildcards: true, // Support for wildcard characters (*, ?)
                ignoreCase: true, // Ignore case sensitivity
                latency: 200, // how many millis to wait until starting search
                warnMultiMatch: 'top {0} matches ...',
                warnNoMatch: 'no matches ...',
                zIndex: 'auto'
            });
        });

    </script>--%>
    <script>
        function MyPopUpWin(url, width, height) {
            var pino = document.getElementById("txtPurchaseInvoice");
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            //window.open(url + '?pno=' + pno.value + '&pIno=' + pIno.value, "Window2",
            window.open(url + '?pino=' + pino.value, "Window2",
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
            //window.open(url + '?pno=' + pno.value + '&pIno=' + pIno.value, "Window2",
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
                                <h5>Purchase</h5>
                            </div>
                            <div class="ibox-content">


                                <div class="row">
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label1" runat="server" Text="Purchase No. "></asp:Label>
                                        <asp:TextBox ID="txtPurchaseNo" runat="server" CssClass="form-control ddlht width" AutoPostBack="true" style="margin-left: 10px" OnTextChanged="txtPurchaseNo_TextChanged" Font-Bold="True"></asp:TextBox>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label4" runat="server" Text="Payment Type "></asp:Label>
                                        <asp:DropDownList ID="ddlPaymentType" runat="server" CssClass="form-control ddlht width" style="margin-left: 5px">
                                            <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                            <asp:ListItem Value="Credit">Credit</asp:ListItem>
                                            <asp:ListItem Value="Card">Card</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="lblDate" runat="server" Text="Purchase Date"></asp:Label>
                                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control ddlht width" TextMode="Date"></asp:TextBox>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label5" runat="server" Text="Supplier"></asp:Label>

                                        <asp:DropDownList ID="ddlSupplier" CssClass="form-control ddlht width" runat="server" style="margin-left: 38px"></asp:DropDownList>

                                        <a onclick="MyPopUpWin1('/AddSupplier.aspx',500,500); return false;" style="margin-left: 4px; color: #fff" class=" btn btn-success m-t-n-xs"><i class="fa fa-plus"></i></a>

                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label3" runat="server" CssClass="float-right" Text="Purchase Invoice No" Style="margin-right: 10px"></asp:Label>
                                        <asp:TextBox ID="txtPurchaseInvoice" runat="server" CssClass="form-control ddlht width" Font-Bold="True" Enabled="false"></asp:TextBox>

                                    </div>
                               
                            </div>



                            <br />
                            <br />



                            <table border="1" style="border-collapse: collapse" class="table table-striped table-bordered table-hover dataTables-example">
                                        <tr>

                                            <td >Category:<br />
                                                <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" CssClass="form-control ddlht" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td ">Item:<br />
                                                <asp:DropDownList ID="ddlItem" runat="server" AutoPostBack="true" CssClass="form-control ddlht" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td >Qty:<br />
                                                <asp:TextBox ID="txtNoOfUnit" runat="server" AutoPostBack="true" CssClass="form-control ddlht" OnTextChanged="txtNoOfUnit_TextChanged"></asp:TextBox>
                                            </td>
                                            <td >Unit Price:<br />
                                                <asp:TextBox ID="txtSellingCost" runat="server" CssClass="form-control ddlht"></asp:TextBox>
                                            </td>
                                            <td >Amount:<br />
                                                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control ddlht"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnUpdate" Style="margin-left: 20px" CssClass="btn btn-success m-t-n-xs" runat="server" Text="Update" Visible="false" OnClick="Update" />
                                                <br />
                                                <asp:Button ID="btnAdd" Style="margin-left: 20px" CssClass="btn btn-success m-t-n-xs" runat="server" Text="Add" OnClick="Insert" />
                                                <br />
                                                <asp:Button ID="btnClear" Style="margin-left: 20px" CssClass="btn btn-success m-t-n-xs" runat="server" Text="Cancel" Visible="false" OnClick="btnClear_Click" />
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                            <asp:DataGrid ID="Grid" runat="server" PageSize="10" AllowPaging="True" CssClass="table table-striped table-hover" AutoGenerateSelectButton="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" OnPageIndexChanged="Grid_PageIndexChanged" OnCancelCommand="Grid_CancelCommand" OnDeleteCommand="Grid_DeleteCommand" OnEditCommand="Grid_EditCommand">

                                <Columns>
                                    <asp:BoundColumn HeaderText="Sl." DataField="IndexNo" HeaderStyle-Width="50px" />
                                    <asp:BoundColumn HeaderText="Category" DataField="Category" HeaderStyle-Width="300px"></asp:BoundColumn>
                                    <asp:BoundColumn HeaderText="Item" DataField="Item" HeaderStyle-Width="400px"></asp:BoundColumn>
                                    <asp:BoundColumn HeaderText="Qty" DataField="NoOfUnit" HeaderStyle-Width="150px"></asp:BoundColumn>
                                    <asp:BoundColumn HeaderText="Unit Price" DataField="P_price" HeaderStyle-Width="150px"></asp:BoundColumn>
                                    <asp:BoundColumn HeaderText="Amount" DataField="Total" HeaderStyle-Width="200px"></asp:BoundColumn>

                                    <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" HeaderText="Edit"></asp:EditCommandColumn>
                                    <asp:ButtonColumn CommandName="Delete" HeaderText="Delete" Text="Delete"></asp:ButtonColumn>
                                </Columns>

                                <FooterStyle BackColor="#dee2e6" Font-Bold="True" ForeColor="White" />
                                <SelectedItemStyle BackColor="#2f4050" Font-Bold="True" ForeColor="Navy" />
                                <PagerStyle BackColor="#afd7e8" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />
                                <AlternatingItemStyle BackColor="White" />
                                <ItemStyle BackColor="#dfeef7" ForeColor="#333333" />
                                <HeaderStyle BackColor="#1c84c6" Font-Bold="True" ForeColor="White" />

                            </asp:DataGrid>
                            <br />
                            <asp:Label ID="lblDiscount" runat="server" Text="Bill Discount"></asp:Label>
                            <asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control ddlht width" AutoPostBack="true" OnTextChanged="txtDiscount_TextChanged"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                            <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control ddlht width" style="margin-left: 39px" TextMode="MultiLine"></asp:TextBox>
                            
                            <div class="text-align1">
                                <asp:Label ID="lblSubTotal" runat="server" Text="Sub Total"></asp:Label>
                                <asp:TextBox ID="txtSubTotal" runat="server" CssClass="form-control width" style="margin-left: 10px" Enabled="false"></asp:TextBox>
                                <asp:Label ID="lblNetAmount" runat="server" Text="Total" style="margin-left: 24px" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control width" style="margin-left: 10px" Font-Bold="True" Enabled="false"></asp:TextBox>
                            </div>
                            


                            <br />
                            <br />

                            <div style="text-align: end">
                                <asp:Button ID="btnPurchase" runat="server" Style="margin-right: 10px" class=" btn btn-success m-t-n-xs float-right" Text="Purchase" OnClick="btnPurchase_Click" />
                                <asp:Button ID="btnCancel" runat="server" Style="margin-right: 10px" class=" btn btn-success m-t-n-xs float-right" Text="Cancel" OnClick="btnCancel_Click" />
                                <a onclick="MyPopUpWin('/ReportPurchase.aspx',1100,600); return false;" style="margin-right: 10px; color: #fff" class=" btn btn-success m-t-n-xs float-right"><i class="fa fa-print"></i>&nbsp;Print</a>
                                <a href="Purchase.aspx" style="margin-right: 10px" class="btn btn-success m-t-n-xs float-right">&nbsp;New</a>
                            </div>
                                <br />
                            <br />
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>

    </form>
</body>

</html>
