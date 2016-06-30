<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paypal.aspx.cs" Inherits="Vista.Pages.paypal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
        
        <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
            <input type="hidden" name="cmd" value="_s-xclick"/>
            <input type="hidden" name="hosted_button_id" value="MU7F76AAV4WGC"/>
            <table>
            <tr><td><input type="hidden" name="on0" value="Precios">Precios</td></tr><tr><td><select name="os0">
	            <option value="Basica">Basica $34,88 USD</option>
	            <option value="Clasica">Clasica $45,94 USD</option>
	            <option value="MitadPrecio">MitadPrecio $39,90 USD</option>
	            <option value="Premium">Premium $113,98 USD</option>
	            <option value="VIP">VIP $69,08 USD</option>
            </select> </td></tr>
            </table>
            <input type="hidden" name="currency_code" value="USD"/>
            <input type="image" src="https://www.paypalobjects.com/es_ES/ES/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal. La forma rápida y segura de pagar en Internet."/>
            <img alt="" border="0" src="https://www.paypalobjects.com/es_ES/i/scr/pixel.gif" width="1" height="1"/>
            </form>



</body>
</html>
