<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Vista._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-primary">AGENDA DE VUELOS AEREOS<small><br>Reserva de pasajes online<span class="glyphicon glyphicon-send" aria-hidden="true"></span></small></h1>
                <p class="lead">Raúl Rosero H.</p>
            </div>                       
        </div>

    </div>

    <div class="row">
        <div class="col-md-4">
            <h2 class="text-info">Consultar Vuelos <span class="glyphicon glyphicon-plane" aria-hidden="true"></span></h2>
            <p>
                Pordrá realizar la reserva de vuelos, dependiendo de su disponibilidad de tiempo, seleccionando su lugar de origen y su lugar de destino.
            </p>
            <p>
                <a class="btn btn-primary" href="Account/Login">Comenzar &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2 class="text-info">Vuelos por fechas <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></h2>            
            <p>
                Puede separar sus vuelos mediante fechas y considerando varios precios a su eleccion.
            </p>
            <p>
                <br><a class="btn btn-primary" href="Account/Login">Comenzar&raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2 class="text-info">Clientes <span class="glyphicon glyphicon-user" aria-hidden="true"></span></h2>            
            <p>
                Registrese en nuestra plataforma y sea parte de una gran compañía que ofrece y garantiza a usted los mejores servicios de reserva de vuelos.
            </p>
            <p>
                <a class="btn btn-primary" href="Account/Login">Comenzar &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
