using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class LoginDAO
    {
        private FacadeAgencia objF = new FacadeAgencia();
        private List<USUARIO> usuarios;

        public LoginDAO()
        {
            objF = new FacadeAgencia();
            usuarios = objF.mostrarUsuarios();
        }

        public String validateLogin(String correo, String password)
        {
            USUARIO aux;
            aux = usuarios.Where(s => s.USUARIO_CORREO.Equals(correo) && s.USUARIO_CONTRASENA.Equals(Utils.Encrypt.MD5HashMethod(password))).FirstOrDefault<USUARIO>();
            return aux != null ? aux.USUARIO_ROL : "";
        }

        public int retrieveUserLogged(String correo, String password) {
            USUARIO aux;
            aux = usuarios.Where(s => s.USUARIO_CORREO.Equals(correo) && s.USUARIO_CONTRASENA.Equals(Utils.Encrypt.MD5HashMethod(password))).FirstOrDefault<USUARIO>();
            return aux != null ? aux.USUARIO_CODIGO : -1;
        }


    }
}
