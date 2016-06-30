<%@ Page Title="Reserva" Language="C#" MasterPageFile="~/cliente.Master" AutoEventWireup="true" CodeBehind="Reserva.aspx.cs" Inherits="Vista.Pages.Reserva" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-primary">Separa tu Boleto</h2>
    <h4>Selecciona los parámetros para la cotización de tus vuelos.</h4>
    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Ciudad Origen:" AssociatedControlID="dropOrigen" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="dropOrigen" runat="server" Width="200px" CssClass="form-control" OnSelectedIndexChanged="dropOrigen_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="Seleccione" Value="0" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Quito" Value="Quito"></asp:ListItem>
                    <asp:ListItem Text="Guayaquil" Value="Guayaquil"></asp:ListItem>
                    <asp:ListItem Text="Cuenca" Value="Cuenca"></asp:ListItem>
                    <asp:ListItem Text="Loja" Value="Loja"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Ciudad Destino:" AssociatedControlID="dropDestino" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="dropDestino" runat="server" Width="200px" CssClass="form-control" OnSelectedIndexChanged="dropDestino_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="Seleccione" Value="0" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Quito" Value="Quito"></asp:ListItem>
                    <asp:ListItem Text="Guayaquil" Value="Guayaquil"></asp:ListItem>
                    <asp:ListItem Text="Cuenca" Value="Cuenca"></asp:ListItem>
                    <asp:ListItem Text="Loja" Value="Loja"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Numero de Asientos:" AssociatedControlID="txtNumero" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtNumero" runat="server" Width="200px" OnTextChanged="txtNumero_TextChanged" TextMode="Number" AutoPostBack="True" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Fecha Salida:" AssociatedControlID="calendarSalida" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-10">
                <asp:Calendar ID="calendarSalida" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BorderWidth="0" BackColor="#f4f4da">
                    <WeekendDayStyle BorderColor="#607D8B"></WeekendDayStyle>
                    <DayHeaderStyle ForeColor="#ffffff" BorderColor="#ffffff" BackColor="#78909C" CssClass="HeaderClass"></DayHeaderStyle>
                    <OtherMonthDayStyle ForeColor="#787777" BorderColor="#f4f4da"></OtherMonthDayStyle>
                    <TitleStyle BackColor="#607D8B" ForeColor="#ffffff" BorderColor="#263238"></TitleStyle>
                </asp:Calendar>
            </div>

        </div>
    </div>

    <h3 class="text-primary">Lista de Vuelos</h3>
    &nbsp;
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="VUELO_CODIGO" DataSourceID="SqlDataSource1" EmptyDataText="No se encontraron vuelos con los requisitos solicitados." CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField DataField="VUELO_CODIGO" HeaderText="VUELO_CODIGO" InsertVisible="False" ReadOnly="True" SortExpression="VUELO_CODIGO" Visible="False" />
                <asp:BoundField DataField="VUELO_ORIGEN" HeaderText="ORIGEN" SortExpression="VUELO_ORIGEN" />
                <asp:BoundField DataField="VUELO_DESTINO" HeaderText="DESTINO" SortExpression="VUELO_DESTINO" />
                <asp:BoundField DataField="VUELO_NUMERO" HeaderText="NUMERO" SortExpression="VUELO_NUMERO" />
                <asp:BoundField DataField="VUELO_SALIDA" HeaderText="SALIDA" SortExpression="VUELO_SALIDA" />
                <asp:BoundField DataField="VUELO_LLEGADA" HeaderText="LLEGADA" SortExpression="VUELO_LLEGADA" />
                <asp:BoundField DataField="VUELO_CAPACIDAD" HeaderText="CAPACIDAD" SortExpression="VUELO_CAPACIDAD" />
                <asp:BoundField DataField="VUELO_DISPONIBLES" HeaderText="DISPONIBLES" SortExpression="VUELO_DISPONIBLES" />
                <asp:CommandField ButtonType="Button" SelectText="Cotizar" ShowSelectButton="True">
                    <ItemStyle CssClass="btn-Primary" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AgenciaContext %>" SelectCommand="SELECT [VUELO_CODIGO], [VUELO_ORIGEN], [VUELO_DESTINO], [VUELO_NUMERO], [VUELO_SALIDA], [VUELO_LLEGADA], [VUELO_CAPACIDAD],[VUELO_DISPONIBLES]  FROM [VUELO] WHERE (([VUELO_ORIGEN] = @VUELO_ORIGEN) AND ([VUELO_DESTINO] = @VUELO_DESTINO) AND (CONVERT(DATE,[VUELO_SALIDA] )=CONVERT(DATE,@VUELO_SALIDA)) AND ([VUELO_DISPONIBLES] &gt;= @VUELO_DISPONIBLES))">
        <SelectParameters>
            <asp:ControlParameter ControlID="dropOrigen" Name="VUELO_ORIGEN" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="dropDestino" Name="VUELO_DESTINO" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="calendarSalida" Name="VUELO_SALIDA" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtNumero" Name="VUELO_DISPONIBLES" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />

    <div class="panel panel-info">
        <div class="panel-heading">Realizar Reserva</div>
        <div class="panel-body">
            <div class="form-horizontal">
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Tipo de asiento:" AssociatedControlID="dropTarifasDisponibles" CssClass="col-md-2 control-label"></asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList ID="dropTarifasDisponibles" Width="200px" runat="server" DataSourceID="SqlDataSource2" DataTextField="TARIFA_TIPO" DataValueField="TARIFA_COSTO" OnSelectedIndexChanged="dropTarifasDisponibles_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AgenciaContext %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="SELECT DISTINCT T.TARIFA_TIPO,T.TARIFA_PORCENTAJE,T.TARIFA_COSTO FROM Agencia.DBO.TARIFA T,Agencia.DBO.VUELO V WHERE  V.VUELO_CAPACIDAD*T.TARIFA_PORCENTAJE/100 &gt; @DISPONIBLES AND V.VUELO_CODIGO=@VUELO_SELECCIONADO;">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtNumero" Name="DISPONIBLES" PropertyName="Text" DefaultValue="7" />
                                <asp:ControlParameter ControlID="GridView1" DefaultValue="" Name="VUELO_SELECCIONADO" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtSubtotal" CssClass="col-md-2 control-label">Subtotal:</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="txtSubtotal" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtIVA" CssClass="col-md-2 control-label">IVA (14%):</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="txtIVA" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtTotal" CssClass="col-md-2 control-label">Costo Total:</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="txtTotal" runat="server" ReadOnly="True" CssClass="form-control text-success"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" OnClick="ReservarVuelo" Text="Reservar" CssClass="btn btn-primary" ID="btnReservar" Visible="False" />
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>

</asp:Content>
