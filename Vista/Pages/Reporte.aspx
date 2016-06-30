<%@ Page Title="Reportes" Language="C#" MasterPageFile="~/cliente.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="Vista.Pages.Reporte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-primary"><%: Title %></h2>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="VUELO_CODIGO,RESERVA_CODIGO" DataSourceID="SqlDataSource1" EmptyDataText="No hay vuelos reservados." CssClass="table table-hover table-striped" GridLines="None" Font-Size="Small">
        <Columns>
            <asp:BoundField DataField="VUELO_CODIGO" HeaderText="VUELO CODIGO" ReadOnly="True" SortExpression="VUELO_CODIGO" />
            <asp:BoundField DataField="RESERVA_CODIGO" HeaderText="CODIGO RESERVA" SortExpression="RESERVA_CODIGO" ReadOnly="True" />
            <asp:BoundField DataField="VR_NUM_ASIENTOS" HeaderText="ASIENTOS RESERVADOS" SortExpression="VR_NUM_ASIENTOS" />
            <asp:BoundField DataField="COSTO_TOTAL" HeaderText="COSTO" SortExpression="COSTO_TOTAL" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AgenciaContext %>" DeleteCommand="DELETE FROM [VUELO_RESERVA] WHERE [VUELO_CODIGO] = @VUELO_CODIGO AND [RESERVA_CODIGO] = @RESERVA_CODIGO" InsertCommand="INSERT INTO [VUELO_RESERVA] ([VUELO_CODIGO], [RESERVA_CODIGO], [VR_NUM_ASIENTOS], [COSTO_TOTAL]) VALUES (@VUELO_CODIGO, @RESERVA_CODIGO, @VR_NUM_ASIENTOS, @COSTO_TOTAL)" SelectCommand="SELECT VUELO_CODIGO, RESERVA_CODIGO, VR_NUM_ASIENTOS, COSTO_TOTAL FROM VUELO_RESERVA where reserva_codigo in (select reserva_codigo from reserva where usuario_codigo =  @USER_COD) " UpdateCommand="UPDATE [VUELO_RESERVA] SET [VR_NUM_ASIENTOS] = @VR_NUM_ASIENTOS, [COSTO_TOTAL] = @COSTO_TOTAL WHERE [VUELO_CODIGO] = @VUELO_CODIGO AND [RESERVA_CODIGO] = @RESERVA_CODIGO">
        <DeleteParameters>
            <asp:Parameter Name="VUELO_CODIGO" Type="Int32" />
            <asp:Parameter Name="RESERVA_CODIGO" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="VUELO_CODIGO" Type="Int32" />
            <asp:Parameter Name="RESERVA_CODIGO" Type="Int32" />
            <asp:Parameter Name="VR_NUM_ASIENTOS" Type="Int32" />
            <asp:Parameter Name="COSTO_TOTAL" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="USER_COD" SessionField="cod_usuario" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="VR_NUM_ASIENTOS" Type="Int32" />
            <asp:Parameter Name="COSTO_TOTAL" Type="Decimal" />
            <asp:Parameter Name="VUELO_CODIGO" Type="Int32" />
            <asp:Parameter Name="RESERVA_CODIGO" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    &nbsp;





</asp:Content>
