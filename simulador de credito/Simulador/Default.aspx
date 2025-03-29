<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Simulador_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Simulador De Credito</title>
    <style type="text/css">
        .text-gray-600 {
            width: 147px;
            height: 44px;
        }
        .font-semibold {
            width: 122px;
            height: 9px;
        }
        .auto-style1 {
            width: 444px;
            background-color: lightgray;
        }
        .auto-style2 {
            width: 129px;
        }
        #ComentariosDePagos {
            width: 630px;
        }
        .auto-style3 {
            width: 316px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
                    <table id="PlanDePago" style="height:60px;width:100%;">
	<tr align="center" valign="middle">
		<td align="center" valign="middle" style="color:Black;font-size:XX-Large;font-weight:bold;">Plan de Pagos</td>
	</tr>
</table>
        <% 
        int valorPrestamo = 1000000;
        int numeroDeCuotas = 48;
        %>
        <table id="ComentariosDePagos">
	<tr>
		<td style="font-size:X-Large;">Plan de pagos para para el crédito de libre inversión de $<span class="text-black" id="valorPrestamo"></span> pagando a <span id="numeroDeCuotas"></span> cuotas</td>
	</tr><tr>
		<td style="font-size:Small;">Resultados aproximados y sujetos a estudio de crédito y políticas de la entidad.</td>
	</tr>
</table>
<br />
        <table id="PagosDetalladosMensual" style="width:359px;" border= "1">
        <tr>
            <% 
            double abonoInteres = 0;
            double abonoCapital = 0;
            double seguroDeVida = 1393;
            double interesMensual = 0.0178;
            double cuotaMensual = valorPrestamo * ((interesMensual * Math.Pow(1 + interesMensual, numeroDeCuotas)) / (Math.Pow(1 + interesMensual, numeroDeCuotas) - 1));
            double saldoRestante = valorPrestamo;
            for (int i = 1; i <= numeroDeCuotas; i++) { 
            abonoInteres = Math.Round(saldoRestante * interesMensual);
            abonoCapital = Math.Round(cuotaMensual - abonoInteres);
            %>
            <td class="auto-style1">
            <div class="bg-white border rounded-lg p-4 shadow-sm">
                <div class="flex justify-between items-center mb-4">
                    <table>
                        <tr>
                            <th class="auto-style2"><h3 class="text-lg font-semibold">Mes <%= i %></h3></th>
                            <th><p class="text-gray-600">Cuota mensual<br /> <span class="text-black">$ <%= Math.Round(cuotaMensual + seguroDeVida)%></span></p></th>
                        </tr></table>
                </div>
                <table>
                    <tr>
                        <th>
                            <p class="text-gray-600">Abono intereses: 
                                <br />
                                <span class="text-black">$ <%= abonoInteres %></span></p>
                            <p class="text-gray-600">Abono a capital: <br />$ <%= abonoCapital %></p>
                            <p class="text-gray-600">Seguro de Vida: <br />$ <%= seguroDeVida %></p>
                        </th>
                        <th>
                            <p class="text-gray-600">&nbsp;</p>
                            <p class="text-gray-600">&nbsp;</p>
                            <p class="text-gray-600"><strong>Saldo </strong><br /><span class="text-black">$ <%= saldoRestante %></span></p>
                        </th>
                    </tr>
                </table>
            </div>
            </td>
            <% saldoRestante -= abonoCapital;
                } %>
		<td class="auto-style3" ></td>
	</tr>
</table>
        <div>
        </div>
    </form>
</body>
</html>