using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class ReservaDAO
    {
        RESERVA objR = new RESERVA();
        VUELO_RESERVA objVR = new VUELO_RESERVA();
        FacadeAgencia objF = new FacadeAgencia();

        public Boolean registrarReserva(int numAsientos,Decimal costoTotal,int codUser,int codVuelo)
        {
            Boolean respuesta = false;
            objR.USUARIO_CODIGO = codUser;
            objR.RESERVA_FECHA = DateTime.Now;
            respuesta= objF.insertaReserva(objR);
            if (respuesta)
            {
                objVR.VUELO_CODIGO = codVuelo;
                objVR.RESERVA_CODIGO = objR.RESERVA_CODIGO;
                objVR.VR_NUM_ASIENTOS = numAsientos;
                objVR.COSTO_TOTAL = costoTotal;
                respuesta=objF.insertaVueloReserva(objVR);
            }
            if (respuesta)
            {
                VUELO aux = new VUELO();
                aux=objF.mostrarVuelosPorCodigo(codVuelo);
                aux.VUELO_DISPONIBLES -= numAsientos;
                if (objF.modificarVuelo(aux))
                    return true;
                else
                {
                    objF.eliminarReserva(objR);
                    return false;
                }
            }
            else {
                objF.eliminarReserva(objR);
                return false;
            }

        }
    }
}
