using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Controlador;
using Vista.Models;

namespace Vista.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            //ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
            Boolean success = false;
            if (validarCampos())
            {
                success = RegistroDAO.registrarUsuario(Name.Text, Phone.Text, Email.Text, Password.Text);
                if (success)
                {
                    cleanFields();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Información", "alert('Registro realizado con éxito.');", true);
                    Response.Redirect("/Account/Login");
                }
            }
            else
            {
                //mensaje de que ingrese informacion correcta
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
            }else
            {
                if (Password.Text.CompareTo(ConfirmPassword.Text)!=0)
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