<%@ Page Title="Tarifas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tarifas.aspx.cs" Inherits="Vista.Pages.Tarifas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-primary"><%: Title %></h2>

    <div>
        <div class="form-horizontal">
            <h4>Crear nueva tarifa</h4>
            <hr />
            <asp:ValidationSummary runat="server" CssClass="text-danger" />

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Tipo" CssClass="col-md-2 control-label">Tipo</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Tipo" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Costo" CssClass="col-md-2 control-label">Costo</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Costo" CssClass="form-control"  />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Descripcion" CssClass="col-md-2 control-label">Descripción</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Descripcion" CssClass="form-control" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Porcentaje" CssClass="col-md-2 control-label">Adicionales</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Porcentaje" CssClass="form-control" TextMode="Number" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" OnClick="AgregarTarifa" Text="Agregar" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>

    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TARIFA_CODIGO" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." CssClass="table table-hover table-striped" GridLines="None" Font-Size="Small">
            <Columns>
                <asp:BoundField DataField="TARIFA_CODIGO" HeaderText="CODIGO" ReadOnly="True" SortExpression="TARIFA_CODIGO" InsertVisible="False" Visible="False" />
                <asp:BoundField DataField="TARIFA_TIPO" HeaderText="TIPO" SortExpression="TARIFA_TIPO" />
                <asp:BoundField DataField="TARIFA_COSTO" HeaderText="COSTO" SortExpression="TARIFA_COSTO" />
                <asp:BoundField DataField="TARIFA_DESCRIPCION" HeaderText="DESCRIPCION" SortExpression="TARIFA_DESCRIPCION" />
                <asp:BoundField DataField="TARIFA_PORCENTAJE" HeaderText="PORCENTAJE" SortExpression="TARIFA_PORCENTAJE" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"/>                
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AgenciaContext %>" DeleteCommand="DELETE FROM [TARIFA] WHERE [TARIFA_CODIGO] = @TARIFA_CODIGO" InsertCommand="INSERT INTO [TARIFA] ([TARIFA_TIPO], [TARIFA_COSTO], [TARIFA_DESCRIPCION], [TARIFA_PORCENTAJE]) VALUES (@TARIFA_TIPO, @TARIFA_COSTO, @TARIFA_DESCRIPCION, @TARIFA_PORCENTAJE)" SelectCommand="SELECT [TARIFA_CODIGO], [TARIFA_TIPO], [TARIFA_COSTO], [TARIFA_DESCRIPCION], [TARIFA_PORCENTAJE] FROM [TARIFA]" UpdateCommand="UPDATE [TARIFA] SET [TARIFA_TIPO] = @TARIFA_TIPO, [TARIFA_COSTO] = @TARIFA_COSTO, [TARIFA_DESCRIPCION] = @TARIFA_DESCRIPCION, [TARIFA_PORCENTAJE] = @TARIFA_PORCENTAJE WHERE [TARIFA_CODIGO] = @TARIFA_CODIGO">
            <DeleteParameters>
                <asp:Parameter Name="TARIFA_CODIGO" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TARIFA_TIPO" Type="String" />
                <asp:Parameter Name="TARIFA_COSTO" Type="Decimal" />
                <asp:Parameter Name="TARIFA_DESCRIPCION" Type="String" />
                <asp:Parameter Name="TARIFA_PORCENTAJE" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TARIFA_TIPO" Type="String" />
                <asp:Parameter Name="TARIFA_COSTO" Type="Decimal" />
                <asp:Parameter Name="TARIFA_DESCRIPCION" Type="String" />
                <asp:Parameter Name="TARIFA_PORCENTAJE" Type="Decimal" />
                <asp:Parameter Name="TARIFA_CODIGO" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>









</asp:Content>
