using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Modelo;
using System.Threading.Tasks;

namespace Controlador
{
    public class RegistroDAO
    {
        public static Boolean registrarUsuario(String nombre, String telf, String email, String password)
        {
            Boolean success = false;
            FacadeAgencia fa = new FacadeAgencia();
            USUARIO user = new USUARIO();
            user.USUARIO_CONTRASENA = Utils.Encrypt.MD5HashMethod(password);
            user.USUARIO_NOMBRE = nombre;
            user.USUARIO_TELEFONO = telf;
            user.USUARIO_CORREO = email;
            user.USUARIO_ROL = "2";
            success = fa.insertaUsuario(user);
            return success;
        }
    }
}
