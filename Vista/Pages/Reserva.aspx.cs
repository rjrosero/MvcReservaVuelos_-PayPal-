using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controlador;

namespace Vista.Pages
{
    public partial class Reserva : System.Web.UI.Page
    {

        private ReservaDAO objR = new ReservaDAO();
        public static Decimal IVA = new Decimal(0.14);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Retrieve Selected Text from Dropdown
            //lblSelectedText.Text = ddlGender.SelectedItem.Text;

            //Retrieve Selected Value from Dropdown
            //lblSelectedValue.Text = ddlGender.SelectedValue;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            emptyFields();

        }

        protected void dropTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            emptyFields();
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void dropTarifasDisponibles_SelectedIndexChanged(object sender, EventArgs e)
        {
            Decimal subtotal = Convert.ToDecimal(dropTarifasDisponibles.SelectedValue.ToString()) * Convert.ToDecimal(txtNumero.Text);
            Decimal ivaSubtotal;
            Decimal total;
            txtSubtotal.Text = subtotal.ToString();
            ivaSubtotal = Convert.ToDecimal(txtSubtotal.Text) * IVA;
            txtIVA.Text = ivaSubtotal.ToString();
            total = Convert.ToDecimal(txtSubtotal.Text) + Convert.ToDecimal(txtIVA.Text);
            txtTotal.Text = total.ToString();
            btnReservar.Visible = true;
        }

        protected void ReservarVuelo(object sender, EventArgs e)
        {
            int numAsientos = Convert.ToInt32(txtNumero.Text.ToString());
            Decimal costo = Convert.ToDecimal(txtTotal.Text.ToString());
            if (objR.registrarReserva(numAsientos, costo, Convert.ToInt32(Session["cod_usuario"]), Convert.ToInt32(GridView1.SelectedValue)))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Información", "alert('Registro realizado con éxito.');", true);
                emptyFields();
                emptyData();
                Server.Transfer("paypal.aspx", true);
            }
            else {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Ha ocurrido un error - Intente de nuevo.');", true);
                emptyFields();
                emptyData();
            }
        }

        public void emptyFields()
        {
            txtSubtotal.Text = "";
            txtIVA.Text = "";
            txtTotal.Text = "";
            dropTarifasDisponibles.Items.Clear();
            btnReservar.Visible = false;
            GridView1.DataBind();
        }

        public void emptyData()
        {
            dropOrigen.SelectedIndex = 0;
            dropDestino.SelectedIndex = 0;
            txtNumero.Text = "0";
        }

        protected void dropOrigen_SelectedIndexChanged(object sender, EventArgs e)
        {
            emptyFields();
        }

        protected void dropDestino_SelectedIndexChanged(object sender, EventArgs e)
        {
            emptyFields();
        }

        protected void txtNumero_TextChanged(object sender, EventArgs e)
        {
            emptyFields();
        }
    }
}