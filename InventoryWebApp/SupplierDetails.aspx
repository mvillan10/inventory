<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierDetails.aspx.cs" Inherits="InventoryWebApp.SupplierDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier | Details</title>
 <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap1.min.css" rel="stylesheet">
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
    
    
</head>
<body>

    <form id="form1" runat="server">
        <div id="page-wrapper" class="gray-bg">
       
          <div class="wrapper wrapper-content">
            <div class="col-lg-12">
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
