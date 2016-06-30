using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class VuelosDAO
    {
        private FacadeAgencia objF;
        private VUELO vuelo;
        private List<VUELO> vuelos;

        public VUELO Varifa
        {
            get
            {
                return vuelo;
            }
            set
            {
                vuelo = value;
            }
        }

        public void actualizar()
        {
            objF.modificarVuelo(vuelo);
        }

        public Boolean registrarVuelo(String origen, String destino, String numero, DateTime salida, DateTime llegada, int capacidad)
        {
            Boolean success = false;
            FacadeAgencia fa = new FacadeAgencia();
            VUELO vuelo = new VUELO();
            vuelo.AGENCIA_CODIGO = 1;
            vuelo.VUELO_ORIGEN = origen;
            vuelo.VUELO_DESTINO = destino;
            vuelo.VUELO_NUMERO = numero;
            vuelo.VUELO_SALIDA = salida;
            vuelo.VUELO_LLEGADA = llegada;
            vuelo.VUELO_CAPACIDAD = capacidad;
            vuelo.VUELO_DISPONIBLES = capacidad;
            success = fa.insertaVuelo(vuelo);
            return success;
        }
    }
}
