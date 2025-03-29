<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Simulador_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="PlanDePago" runat="server" Height="60px" Width="100%">
                <asp:TableRow runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                    <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black">Plan de Pagos</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
        <br />
        <asp:Table ID="ComentariosDePagos" runat="server" Width="629px">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" Font-Size="X-Large">Plan de pagos para para el crédito de libre inversión de $<span id="valorPrestamo"></span> pagando a 48 cuotas</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" Font-Size="Small">Resultados aproximados y sujetos a estudio de crédito y políticas de la entidad.</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <% for (int i = 1; i <= 3; i++) { %>
                <div class="bg-white border rounded-lg p-4 shadow-sm">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-lg font-semibold">Mes <%= i %></h3>
                        <p class="text-gray-600"><strong>Cuota mensual </strong><br /> <span class="text-black">$ 32,552</span></p>
                    </div>
                    <p class="text-gray-600"><strong>Abono intereses: </strong><br /> <span class="text-black">$ 17,800</span></p>
                    <p class="text-gray-600"><strong>Abono a capital: </strong><br /> <span class="text-black">$ 13,359</span></p>
                    <p class="text-gray-600"><strong>Seguro de Vida: </strong><br /> <span class="text-black">$ 1,393</span></p>
                    <p class="text-gray-600"><strong>Saldo </strong><br /> <span class="text-black">$ 1,000,000</span></p>
                </div>
                <% } %>
            </div>
        </div>
    </form>
</body>
</html>
