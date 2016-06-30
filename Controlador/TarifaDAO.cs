using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Modelo;
using System.Threading.Tasks;

namespace Controlador
{
    public class TarifaDAO
    {
        private FacadeAgencia objF;
        private TARIFA tarifa;
        private List<TARIFA> tarifas;

        public TARIFA Tarifa
        {
            get
            {
                return tarifa;
            }
            set
            {
                tarifa = value;
            }
        }

        public void actualizar()
        {
            objF.modificarTarifa(tarifa);
        }

        public Boolean registrarTarifa(String tipo, Decimal costo, String descripcion, Decimal porcentaje)
        {
            Boolean success = false;
            FacadeAgencia fa = new FacadeAgencia();
            TARIFA tarifa = new TARIFA();
            tarifa.AGENCIA_CODIGO = 1;
            tarifa.TARIFA_TIPO = tipo;
            tarifa.TARIFA_COSTO = costo;
            tarifa.TARIFA_DESCRIPCION = descripcion;
            tarifa.TARIFA_PORCENTAJE = porcentaje;
            success = fa.insertaTarifa(tarifa);
            return success;
        }

        public Boolean validatePercents(Decimal last_value,Decimal new_value)
        {
            objF = new FacadeAgencia();
            return objF.validatePercent(last_value, new_value);
        }
    }
}
