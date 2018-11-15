<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseReturn.aspx.cs" Inherits="InventoryWebApp.PurchaseReturn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Purchase | Return</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap1.min.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/datatables.min.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />

    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

   

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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
            var pino = document.getElementById("txtInvoiceNo");
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
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
            window.open(url , "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper">
            <div id="page-wrapper" class="gray-bg">
                <div class="row border-bottom">
                    <div class="col-lg-12">
                <div class="ibox">
                    <div class="ibox-title text-center">
                        <h5>Purchase Return</h5>
                    </div>
                    <div class="ibox-content">
                      

                        <div class="row">
                            <div class="col-lg-4">
                                <asp:Label ID="Label1" runat="server" Text="Purchase Return No. "></asp:Label>
                                <asp:TextBox ID="txtBillNo" runat="server" CssClass="form-control-sm form-control width" Style="margin-left: 7px" AutoPostBack="true" OnTextChanged="txtBillNo_TextChanged" Font-Bold="True"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="Purchase Invoice No."></asp:Label>
                                <asp:TextBox ID="txtPInvoiceNo" runat="server" CssClass="form-control-sm form-control width" Style="margin-left: 4px" AutoPostBack="true"  OnTextChanged="txtPInvoiceNo_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-lg-4">
                                <asp:Label ID="lblDate" runat="server" Text="Purchase Date"></asp:Label>
                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control form-control-sm width" TextMode="Date"></asp:TextBox>
                                <br />
                                <br />
                                <div class="row">
                                    <asp:Label ID="Label5" runat="server" Style="margin-left: 15px" Text="Supplier"></asp:Label>
                                 
                                        <asp:DropDownList ID="ddlSupplier" runat="server" CssClass="form-control" style="margin-left: 40px" Enabled="false"></asp:DropDownList>
                                   
                                    <%--<a onclick="MyPopUpWin1('/AddSupplier.aspx',500,500); return false;" style="margin-left: 4px; color: #fff" class=" btn btn-success"><i class="fa fa-plus"></i></a>--%>
                                </div>
                            </div>
                        <div class="col-lg-4">
                            <asp:TextBox ID="txtInvoiceNo" runat="server" CssClass=" col-sm-4 form-control-sm form-control float-right" Font-Bold="True" Enabled="false"></asp:TextBox>
                            <asp:Label ID="Label3" runat="server" CssClass="float-right" Text="Invoice No" style="margin-right: 18px"></asp:Label>
                            <br />
                            <br />
                            <asp:TextBox ID="txtInvoiceDate" runat="server" CssClass="col-sm-4 form-control-sm form-control width float-right" Enabled="false" ></asp:TextBox>
                            <asp:Label ID="Label6" runat="server" CssClass="float-right" style="margin-right: 10px" Text="Return Date"></asp:Label>
                        </div>
                        </div>

                        <br />
                        <br />
                        <asp:DataGrid ID="Grid2" runat="server" PageSize="10" AllowPaging="True" AutoGenerateSelectButton="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" OnPageIndexChanged="Grid_PageIndexChanged" OnCancelCommand="Grid_CancelCommand" OnDeleteCommand="Grid_DeleteCommand" OnEditCommand="Grid_EditCommand">

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
                        <ItemStyle BackColor="#dbf1ff" ForeColor="#333333" />
                        <HeaderStyle BackColor="#1c84c6" Font-Bold="True" ForeColor="White" />

                        </asp:DataGrid>
                        <br />
                        <br />
                       <table border="1" style="border-collapse: collapse" class="table table-striped table-bordered table-hover dataTables-example">
                            <tr>

                                <td style="width: 225px">Category:<br />
                                    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" CssClass="form-control ddlht" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 300px">Item:<br />
                                    <asp:DropDownList ID="ddlItem" runat="server" AutoPostBack="true" CssClass="form-control ddlht" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 75px">Qty:<br />
                                    <asp:TextBox ID="txtNoOfUnit" runat="server" AutoPostBack="true" CssClass="form-control " OnTextChanged="txtNoOfUnit_TextChanged"></asp:TextBox>
                                </td>
                                <td style="width: 75px">Unit Price:<br />
                                    <asp:TextBox ID="txtSellingCost" runat="server" CssClass="form-control "></asp:TextBox>
                                </td>
                                <td style="width: 100px">Amount:<br />
                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control "></asp:TextBox>
                                </td>
                                <td>
                                    <br />
                                    <asp:Button ID="btnAdd" Style="margin-left: 20px" CssClass="btn btn-success m-t-n-xs" runat="server" Text="Add" OnClick="Insert" />
                                    <asp:Button ID="btnUpdate" Style="margin-left: 20px" CssClass="btn btn-success m-t-n-xs" runat="server" Text="Update" Visible="false" OnClick="Update" />
                                    <asp:Button ID="btnClear" Style="margin-left: 10px" CssClass="btn btn-success m-t-n-xs" runat="server" Text="Cancel" Visible="false" OnClick="btnClear_Click" />
                                    <br />
                                </td>
                            </tr>
                        </table>
                         <asp:DataGrid ID="Grid" runat="server" PageSize="10" AllowPaging="True" AutoGenerateSelectButton="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" OnPageIndexChanged="Grid_PageIndexChanged" OnCancelCommand="Grid_CancelCommand" OnDeleteCommand="Grid_DeleteCommand" OnEditCommand="Grid_EditCommand">

                            <Columns>
                                <asp:BoundColumn HeaderText="Sl." DataField="IndexNo" HeaderStyle-Width="50px" />
                                <asp:BoundColumn HeaderText="Category" DataField="Category" HeaderStyle-Width="300px"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Item" DataField="Item" HeaderStyle-Width="400px"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Qty" DataField="NoOfUnit" HeaderStyle-Width="150px"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Unit Price" DataField="P_price" HeaderStyle-Width="150px"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Amount" DataField="Total" HeaderStyle-Width="200px"></asp:BoundColumn>

                              <%--  <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" HeaderText="Edit"></asp:EditCommandColumn>
                                <asp:ButtonColumn CommandName="Delete" HeaderText="Delete" Text="Delete"></asp:ButtonColumn>--%>
                            </Columns>

                            <FooterStyle BackColor="#dee2e6" Font-Bold="True" ForeColor="White" />
                        <SelectedItemStyle BackColor="#2f4050" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#afd7e8" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />
                        <AlternatingItemStyle BackColor="White" />
                        <ItemStyle BackColor="#dbf1ff" ForeColor="#333333" />
                        <HeaderStyle BackColor="#1c84c6" Font-Bold="True" ForeColor="White" />

                        </asp:DataGrid>
                        <br />
                        <br />
                        

                        <asp:Label ID="lblSubTotal" runat="server" Text="Sub Total" Style="margin-left: 950px"></asp:Label>
                        <asp:TextBox ID="txtSubTotal" runat="server" CssClass="form-control-sm form-control width" style="padding-left: 32px" Enabled="false" ></asp:TextBox>
                        <br />  
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Total" Style="margin-left: 950px" Font-Bold="True"></asp:Label>
                        <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control-sm form-control width" style="margin-left:24px" Font-Bold="True" Enabled="false"></asp:TextBox>
                        <br />
                        <br />

                        <a href="PurchaseReturn.aspx" style="margin-right: 10px" class=" btn btn-success m-t-n-xs float-right">&nbsp;New</a>
                        <a onclick="MyPopUpWin('/ReturnPurchaseReport.aspx',1100,600); return false;" style="margin-right: 10px; color:#fff" class=" btn btn-success m-t-n-xs float-right"><i class="fa fa-print"></i>&nbsp;Print</a>
                        <asp:Button ID="btnCancel" runat="server" Style="margin-right: 10px" class="  btn btn-success m-t-n-xs float-right" Text="Cancel" OnClick="btnCancel_Click" />
                        <asp:Button ID="btnReturn" runat="server" Style="margin-right: 10px" class="  btn btn-success m-t-n-xs float-right" Text="Return" OnClick="btnReturn_Click" />
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
