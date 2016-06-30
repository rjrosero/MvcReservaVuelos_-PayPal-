using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controlador;

namespace Vista.Pages
{
    public partial class Usuario : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void AgregarUsuario(object sender, EventArgs e)
        {
            Boolean success = false;
            if (validarCampos())
            {
                success = RegistroDAO.registrarUsuario(Name.Text, Phone.Text, Email.Text, Password.Text);
                if (success)
                {
                    cleanFields();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Información", "alert('Registro realizado con éxito.');", true);
                    GridView1.DataBind();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Ha ocurrido un error - Intente de nuevo.');", true);
            }
        }

        private Boolean validarCampos()
        {
            if (Name.Text == "")
            {
                return false;
            }
            if (Phone.Text == "")
            {
                return false;
            }
            if (Email.Text == "")
            {
                return false;
            }
            if (Password.Text == "" || ConfirmPassword.Text == "")
            {
                return false;
            }
            else
            {
                if (Password.Text.CompareTo(ConfirmPassword.Text) != 0)
                {
                    return false;
                }
            }
            return true;
        }

        private void cleanFields()
        {
            Name.Text = "";
            Phone.Text = "";
            Email.Text = "";
            Password.Text = "";
            ConfirmPassword.Text = "";
        }

    }
}