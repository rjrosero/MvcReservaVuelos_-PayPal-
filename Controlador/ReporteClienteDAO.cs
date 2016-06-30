using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class ReporteClienteDAO
    {
        VUELO_RESERVA objVR = new VUELO_RESERVA();
        List<VUELO_RESERVA> vuelosReserva;
        FacadeAgencia objF = new FacadeAgencia();

        public List<VUELO_RESERVA> traerReservasPorUsuario(int cod)
        {
            FacadeAgencia fa = new FacadeAgencia();
            return fa.mostrarVuelosReservaPorCodigoUsuario(cod);
        }
    }
}
