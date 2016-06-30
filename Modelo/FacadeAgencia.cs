using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class FacadeAgencia
    {
        #region CRUD_AGENCIA
        /// <summary>
        /// Metodos necesarios para realizar un CRUD de la Entidad Agencia
        /// </summary>        

        public Boolean insertarAgencia(AGENCIA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.AGENCIAs.Add(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public Boolean modificarAgencia(AGENCIA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                AGENCIA aux = new AGENCIA();
                aux = db.AGENCIAs.Where(s => s.AGENCIA_CODIGO == objA.AGENCIA_CODIGO).FirstOrDefault<AGENCIA>();

                if (aux != null)
                {
                    aux = objA;
                }

                db.Entry(aux).State = System.Data.Entity.EntityState.Modified;
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public Boolean eliminarAgencia(AGENCIA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.AGENCIAs.Remove(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public List<AGENCIA> mostrarAgencias()
        {
            using (var db = new AgenciaContext())
            {
                return db.AGENCIAs.ToList();
            }
        }

        #endregion

        #region CRUD_VUELO
        /// <summary>
        /// Metodos necesarios para realizar un CRUD de la Entidad Vuelo
        /// </summary>        

        public Boolean insertaVuelo(VUELO objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.VUELOes.Add(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public Boolean modificarVuelo(VUELO objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.VUELOes.Attach(objA);
                VUELO aux = new VUELO();
                aux = db.VUELOes.Where(s => s.VUELO_CODIGO == objA.VUELO_CODIGO).FirstOrDefault<VUELO>();

                if (aux != null)
                {
                    aux = objA;
                }

                db.Entry(aux).State = System.Data.Entity.EntityState.Modified;
                cambios = db.SaveChanges();



            }
            return cambios > 0 ? true : false;
        }

        public Boolean eliminarVuelo(VUELO objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.VUELOes.Remove(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public List<VUELO> mostrarVuelos()
        {
            using (var db = new AgenciaContext())
            {
                return db.VUELOes.ToList();
            }
        }

        public VUELO mostrarVuelosPorCodigo(int cod_vuelo)
        {
            using (var db = new AgenciaContext())
            {
                return db.VUELOes.Where(s => s.VUELO_CODIGO == cod_vuelo).FirstOrDefault<VUELO>();
            }

        }

        #endregion

        #region CRUD_USUARIO
        /// <summary>
        /// Metodos necesarios para realizar un CRUD de la Entidad Usuario
        /// </summary>        

        public Boolean insertaUsuario(USUARIO objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.USUARIOs.Add(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public Boolean modificarUsuario(USUARIO objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                USUARIO aux = new USUARIO();
                aux = db.USUARIOs.Where(s => s.USUARIO_CODIGO == objA.USUARIO_CODIGO).FirstOrDefault<USUARIO>();

                if (aux != null)
                {
                    aux = objA;
                }

                db.Entry(aux).State = System.Data.Entity.EntityState.Modified;
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public Boolean eliminarUsuario(USUARIO objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.USUARIOs.Remove(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public List<USUARIO> mostrarUsuarios()
        {
            using (var db = new AgenciaContext())
            {
                return db.USUARIOs.ToList();
            }
        }

        #endregion

        #region CRUD_RESERVA
        /// <summary>
        /// Metodos necesarios para realizar un CRUD de la Entidad Reserva
        /// </summary>        

        public Boolean insertaReserva(RESERVA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.RESERVAs.Add(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public Boolean modificarReservas(RESERVA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                RESERVA aux = new RESERVA();
                aux = db.RESERVAs.Where(s => s.RESERVA_CODIGO == objA.RESERVA_CODIGO).FirstOrDefault<RESERVA>();

                if (aux != null)
                {
                    aux = objA;
                }

                db.Entry(aux).State = System.Data.Entity.EntityState.Modified;
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public Boolean eliminarReserva(RESERVA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.RESERVAs.Remove(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public List<RESERVA> mostrarReservas()
        {
            using (var db = new AgenciaContext())
            {
                return db.RESERVAs.ToList();
            }
        }

        #endregion

        #region CRUD_VUELO_RESERVA
        /// <summary>
        /// Metodos necesarios para realizar un CRUD de la Entidad Vuelo Reserva
        /// </summary>        

        public Boolean insertaVueloReserva(VUELO_RESERVA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.VUELO_RESERVA.Add(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public Boolean modificarVueloResrva(VUELO_RESERVA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                VUELO_RESERVA aux = new VUELO_RESERVA();
                aux = db.VUELO_RESERVA.Where(s => s.VUELO_CODIGO == objA.VUELO_CODIGO && s.RESERVA_CODIGO == objA.RESERVA_CODIGO).FirstOrDefault<VUELO_RESERVA>();

                if (aux != null)
                {
                    aux = objA;
                }

                db.Entry(aux).State = System.Data.Entity.EntityState.Modified;
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public Boolean eliminarVueloReserva(VUELO_RESERVA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.VUELO_RESERVA.Remove(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public List<VUELO_RESERVA> mostrarVueloReservas()
        {
            using (var db = new AgenciaContext())
            {
                return db.VUELO_RESERVA.ToList();
            }
        }

        public List<VUELO_RESERVA> mostrarVuelosReservaPorCodigoUsuario(int cod_usuario)
        {
            using (var db = new AgenciaContext())
            {
                List<VUELO_RESERVA> lista = new List<VUELO_RESERVA>();
                List<RESERVA> reservas = mostrarReservas();
                List<RESERVA> reservasAux = reservas.Where(s => s.USUARIO_CODIGO == cod_usuario).ToList();

                for (int i = 0; i < reservasAux.Count; i++)
                {
                    lista.Union(db.VUELO_RESERVA.Where(s => s.RESERVA_CODIGO == reservasAux[i].RESERVA_CODIGO).ToList());
                }
                return lista;
            }

        }


        #endregion

        #region CRUD_TARIFA
        /// <summary>
        /// Metodos necesarios para realizar un CRUD de la Entidad Tarifas
        /// </summary>        

        public Boolean insertaTarifa(TARIFA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.TARIFAs.Add(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public Boolean modificarTarifa(TARIFA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                TARIFA aux = new TARIFA();
                aux = db.TARIFAs.Where(s => s.TARIFA_CODIGO == objA.TARIFA_CODIGO).FirstOrDefault<TARIFA>();

                if (aux != null)
                {
                    aux = objA;
                }

                db.Entry(aux).State = System.Data.Entity.EntityState.Modified;
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public Boolean eliminarTarifa(TARIFA objA)
        {
            Int32 cambios = 0;
            using (var db = new AgenciaContext())
            {
                db.TARIFAs.Remove(objA);
                cambios = db.SaveChanges();
            }
            return cambios > 0 ? true : false;
        }

        public List<TARIFA> mostrarTarifas()
        {
            using (var db = new AgenciaContext())
            {
                return db.TARIFAs.ToList();
            }
        }

        public Boolean validatePercent(Decimal last_value, Decimal new_value)
        {
            List<TARIFA> tarifas = new List<TARIFA>();
            Decimal suma = 0;
            using (var db = new AgenciaContext())
            {
                tarifas = db.TARIFAs.ToList();
                for (int i = 0; i < tarifas.Count; i++)
                {
                    suma += (Decimal)tarifas[i].TARIFA_PORCENTAJE;
                }

                suma = suma - last_value + new_value;
            }
            if (suma <= 100)
                return true;
            else
                return false;
        }

        #endregion
    }
}
