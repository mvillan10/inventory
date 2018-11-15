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
<body class="">
    <div id="page-wrapper" class="gray-bg">
          <div class="wrapper wrapper-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <div class="ibox-title text-center">
                                <h5>Credit Repay</h5>
                            </div>
                            <div class="ibox-content">   
                                <form id="form1" runat="server">
                                            <div class="form-group row">
                                                <div class="col-sm-10">
                                                    <asp:TextBox runat="server" type="search" ID="txtSearch" list="datalist" CssClass="form-control form-control-sm width" required="" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                    <%--<input class="form-control form-control-sm width" type="search" list="datalist" id="txtbox" runat="server" />--%>
                                                </div>
                                                <datalist id="datalist" runat="server"></datalist>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblCredit" runat="server" Text="Credit Amount" ></asp:Label> 
                                                <asp:TextBox runat="server" ID="txtCredit" TextMode="SingleLine"  Enabled="false" CssClass="form-control width" style="display:inline-block !important"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblAmt" runat="server" Text="Amount to pay" ></asp:Label>
                                                <asp:TextBox runat="server" ID="txtAmt" TextMode="SingleLine"  CssClass="form-control width" style="display:inline-block !important"></asp:TextBox>
                                            </div><br />
                                            <div class="form-group">
                                                <asp:Button runat="server" ID="btnPay" Text="Pay" CssClass="btn btn-success" OnClick="btnPay_Click"/>
                                                <asp:Button runat="server" ID="btnClear" Text="Clear" CssClass="btn btn-success" OnClick="btnClear_Click" />
                                             </div>
                                    </form>
                                </div>
                        </div>
                        </div>
                     </div>
                        </div>
        </div>
    </body>
    </html>

