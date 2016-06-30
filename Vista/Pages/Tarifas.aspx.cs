using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controlador;

namespace Vista.Pages
{
    public partial class Tarifas : System.Web.UI.Page
    {
        private TarifaDAO objT = new TarifaDAO();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AgregarTarifa(object sender, EventArgs e)
        {
            TarifaDAO td = new TarifaDAO();
            Boolean success = false;
            if (validateCampos())
            {
                if (validarPorcentajes(0))
                {
                    success = td.registrarTarifa(Tipo.Text, Decimal.Parse(Costo.Text), Descripcion.Text, Decimal.Parse(Porcentaje.Text));
                    if (success)
                    {
                        cleanFields();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Información", "alert('Registro realizado con éxito.');", true);
                        GridView1.DataBind();
                    }
                }
                else {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('No se puede exceder el 100%');", true);
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Ha ocurrido un error - Intente de nuevo.');", true);
            }
        }

        private Boolean validateCampos()
        {
            if (Tipo.Text=="")
            {
                return false;
            }
            if (Costo.Text == "")
            {
                return false;
            }
            if (Descripcion.Text == "")
            {
                return false;
            }
            if (Porcentaje.Text == "")
            {
                return false;
            }
            return true;
        }

        private void cleanFields()
        {
            Tipo.Text = "";
            Costo.Text = "";
            Descripcion.Text = "";
            Porcentaje.Text = "";
        }

        private Boolean validarPorcentajes(Decimal last_value)
        {
            return objT.validatePercents(last_value, Convert.ToDecimal(Porcentaje.Text.ToString()));
        }

    }
}