<%@ Page Title="Vuelos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vuelos.aspx.cs" Inherits="Vista.Pages.Vuelos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-primary"><%: Title %></h2>
    <div>
        <div class="form-horizontal">
            <h4>Crear Nueva Ruta</h4>
            <hr />
            <asp:ValidationSummary runat="server" CssClass="text-danger" />

            <div class="container">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Origen" CssClass="col-md-2 control-label">Origen:</asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList ID="Origen" runat="server" Width="200px" CssClass="form-control">
                            <asp:ListItem Text="Seleccione" Value="0" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Quito" Value="Quito"></asp:ListItem>
                            <asp:ListItem Text="Guayaquil" Value="Guayaquil"></asp:ListItem>
                            <asp:ListItem Text="Cuenca" Value="Cuenca"></asp:ListItem>
                            <asp:ListItem Text="Loja" Value="Loja"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Destino" CssClass="col-md-2 control-label">Destino:</asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList ID="Destino" runat="server" Width="200px" CssClass="form-control">
                            <asp:ListItem Text="Seleccione" Value="0" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Quito" Value="Quito"></asp:ListItem>
                            <asp:ListItem Text="Guayaquil" Value="Guayaquil"></asp:ListItem>
                            <asp:ListItem Text="Cuenca" Value="Cuenca"></asp:ListItem>
                            <asp:ListItem Text="Loja" Value="Loja"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Salida" CssClass="col-md-2 control-label">Fecha de Salida:</asp:Label>
                    <div class="col-md-10">
                        <asp:Calendar ID="Salida" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BorderWidth="0" BackColor="#f4f4da">
                            <WeekendDayStyle BorderColor="#607D8B"></WeekendDayStyle>
                            <DayHeaderStyle ForeColor="#ffffff" BorderColor="#ffffff" BackColor="#78909C" CssClass="HeaderClass"></DayHeaderStyle>
                            <OtherMonthDayStyle ForeColor="#787777" BorderColor="#f4f4da"></OtherMonthDayStyle>
                            <TitleStyle BackColor="#607D8B" ForeColor="#ffffff" BorderColor="#263238"></TitleStyle>
                        </asp:Calendar>
                        <br />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtHoras" CssClass="col-md-2 control-label">Hora de viaje:</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="txtHoras" runat="server" Width="200px" OnTextChanged="txtHoras_Changed" TextMode="Number" AutoPostBack="True" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Capacidad" CssClass="col-md-2 control-label">Capacidad de Asientos:</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Capacidad" Width="200px" CssClass="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" OnClick="AgregarVuelo" Text="Agregar" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="VUELO_CODIGO" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." CssClass="table table-hover table-striped" GridLines="None" Font-Size="Small">
            <Columns>
                <asp:BoundField DataField="VUELO_CODIGO" HeaderText="VUELO_CODIGO" ReadOnly="True" SortExpression="VUELO_CODIGO" Visible="False" />
                <asp:BoundField DataField="AGENCIA_CODIGO" HeaderText="AGENCIA_CODIGO" SortExpression="AGENCIA_CODIGO" Visible="False" />
                <asp:BoundField DataField="VUELO_ORIGEN" HeaderText="ORIGEN" SortExpression="VUELO_ORIGEN" />
                <asp:BoundField DataField="VUELO_DESTINO" HeaderText="DESTINO" SortExpression="VUELO_DESTINO" />
                <asp:BoundField DataField="VUELO_NUMERO" HeaderText="NUMERO" SortExpression="VUELO_NUMERO" />
                <asp:BoundField DataField="VUELO_SALIDA" HeaderText="HORA SALIDA" SortExpression="VUELO_SALIDA" />
                <asp:BoundField DataField="VUELO_LLEGADA" HeaderText="HORA LLEGADA" SortExpression="VUELO_LLEGADA" />
                <asp:BoundField DataField="VUELO_CAPACIDAD" HeaderText="CAPACIDAD" SortExpression="VUELO_CAPACIDAD" />
                <asp:BoundField DataField="VUELO_DISPONIBLES" HeaderText="DISPONIBLES" SortExpression="VUELO_DISPONIBLES" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AgenciaContext %>" DeleteCommand="DELETE FROM [VUELO] WHERE [VUELO_CODIGO] = @VUELO_CODIGO" InsertCommand="INSERT INTO [VUELO] ([AGENCIA_CODIGO], [VUELO_ORIGEN], [VUELO_DESTINO], [VUELO_NUMERO], [VUELO_SALIDA], [VUELO_LLEGADA], [VUELO_CAPACIDAD], [VUELO_DISPONIBLES]) VALUES (@AGENCIA_CODIGO, @VUELO_ORIGEN, @VUELO_DESTINO, @VUELO_NUMERO, @VUELO_SALIDA, @VUELO_LLEGADA, @VUELO_CAPACIDAD, @VUELO_DISPONIBLES)" SelectCommand="SELECT [VUELO_CODIGO], [AGENCIA_CODIGO], [VUELO_ORIGEN], [VUELO_DESTINO], [VUELO_NUMERO], [VUELO_SALIDA], [VUELO_LLEGADA], [VUELO_CAPACIDAD], [VUELO_DISPONIBLES] FROM [VUELO]" UpdateCommand="UPDATE [VUELO] SET [AGENCIA_CODIGO] = @AGENCIA_CODIGO, [VUELO_ORIGEN] = @VUELO_ORIGEN, [VUELO_DESTINO] = @VUELO_DESTINO, [VUELO_NUMERO] = @VUELO_NUMERO, [VUELO_SALIDA] = @VUELO_SALIDA, [VUELO_LLEGADA] = @VUELO_LLEGADA, [VUELO_CAPACIDAD] = @VUELO_CAPACIDAD, [VUELO_DISPONIBLES] = @VUELO_DISPONIBLES WHERE [VUELO_CODIGO] = @VUELO_CODIGO">
            <DeleteParameters>
                <asp:Parameter Name="VUELO_CODIGO" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AGENCIA_CODIGO" Type="Int32" />
                <asp:Parameter Name="VUELO_ORIGEN" Type="String" />
                <asp:Parameter Name="VUELO_DESTINO" Type="String" />
                <asp:Parameter Name="VUELO_NUMERO" Type="String" />
                <asp:Parameter Name="VUELO_SALIDA" Type="DateTime" />
                <asp:Parameter Name="VUELO_LLEGADA" Type="DateTime" />
                <asp:Parameter Name="VUELO_CAPACIDAD" Type="Int32" />
                <asp:Parameter Name="VUELO_DISPONIBLES" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AGENCIA_CODIGO" Type="Int32" />
                <asp:Parameter Name="VUELO_ORIGEN" Type="String" />
                <asp:Parameter Name="VUELO_DESTINO" Type="String" />
                <asp:Parameter Name="VUELO_NUMERO" Type="String" />
                <asp:Parameter Name="VUELO_SALIDA" Type="DateTime" />
                <asp:Parameter Name="VUELO_LLEGADA" Type="DateTime" />
                <asp:Parameter Name="VUELO_CAPACIDAD" Type="Int32" />
                <asp:Parameter Name="VUELO_DISPONIBLES" Type="Int32" />
                <asp:Parameter Name="VUELO_CODIGO" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
