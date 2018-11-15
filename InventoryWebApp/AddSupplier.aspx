<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSupplier.aspx.cs" Inherits="InventoryWebApp.AddSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Supplier</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/datatables.min.css" rel="stylesheet" />
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

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   
</head>
<body>

    <form id="form1" runat="server">
        <div id="page-wrapper" class="gray-bg">
        <div class="wrapper wrapper-content">
            <div class="col-lg-12">
                <div class="ibox">
                    <div class="ibox-title text-center">
                        <h5>Add Supplier</h5>
                    </div>
                    <div class="ibox-content">

                        <asp:Label ID="lblName" runat="server" Text="Supplier Name"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control-sm form-control width"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" style="margin-left: 51px" CssClass="form-control-sm form-control width" TextMode="Phone"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblAddr" runat="server" Text="Address"></asp:Label>
                        <asp:TextBox ID="txtAddr" runat="server" style="margin-left: 40px" CssClass="form-control-sm form-control width" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="btnAdd" runat="server" style="margin-left: 200px" class=" btn btn-success m-t-n-xs" Text="Add" OnClick="btnAdd_Click" />

                        

                    </div>
                </div>

            </div>
        </div>
            </div>
    </form>
</body>

</html>

