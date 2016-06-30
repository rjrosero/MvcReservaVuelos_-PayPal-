<%@ Page Title="Usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="Vista.Pages.Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-primary"><%: Title %></h2>
    <div>
        <div class="form-horizontal">
            <h4>Crear nueva cuenta de usuario</h4>
            <hr />
            <asp:ValidationSummary runat="server" CssClass="text-danger" />

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Nombre</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Name" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Phone" CssClass="col-md-2 control-label">Teléfono</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Phone" CssClass="form-control" TextMode="Phone" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" OnClick="AgregarUsuario" Text="Agregar" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>

    <br />
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USUARIO_CODIGO" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." CssClass="table table-hover table-striped" GridLines="None" Font-Size="Small" >
            <Columns>
                <asp:BoundField DataField="USUARIO_CODIGO" HeaderText="USUARIO_CODIGO" InsertVisible="False" ReadOnly="True" SortExpression="USUARIO_CODIGO" Visible="False" />
                <asp:BoundField DataField="USUARIO_NOMBRE" HeaderText="NOMBRE" SortExpression="USUARIO_NOMBRE" />
                <asp:BoundField DataField="USUARIO_CORREO" HeaderText="CORREO" SortExpression="USUARIO_CORREO" />
                <asp:BoundField DataField="USUARIO_TELEFONO" HeaderText="TELÉFONO" SortExpression="USUARIO_TELEFONO" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AgenciaContext %>" DeleteCommand="DELETE FROM [USUARIO] WHERE [USUARIO_CODIGO] = @USUARIO_CODIGO" InsertCommand="INSERT INTO [USUARIO] ([USUARIO_NOMBRE], [USUARIO_CORREO], [USUARIO_TELEFONO]) VALUES (@USUARIO_NOMBRE, @USUARIO_CORREO, @USUARIO_TELEFONO)" SelectCommand="SELECT [USUARIO_CODIGO], [USUARIO_NOMBRE], [USUARIO_CORREO], [USUARIO_TELEFONO] FROM [USUARIO]" UpdateCommand="UPDATE [USUARIO] SET [USUARIO_NOMBRE] = @USUARIO_NOMBRE, [USUARIO_CORREO] = @USUARIO_CORREO, [USUARIO_TELEFONO] = @USUARIO_TELEFONO WHERE [USUARIO_CODIGO] = @USUARIO_CODIGO">
            <DeleteParameters>
                <asp:Parameter Name="USUARIO_CODIGO" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USUARIO_NOMBRE" Type="String" />
                <asp:Parameter Name="USUARIO_CORREO" Type="String" />
                <asp:Parameter Name="USUARIO_TELEFONO" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USUARIO_NOMBRE" Type="String" />
                <asp:Parameter Name="USUARIO_CORREO" Type="String" />
                <asp:Parameter Name="USUARIO_TELEFONO" Type="String" />
                <asp:Parameter Name="USUARIO_CODIGO" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
