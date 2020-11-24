using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClipMoney3C.Models
{
    public class DatosUsuario
    {
        public int Dni { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Direccion { get; set; }
        public string Localidad { get; set; }
        public string Provincia { get; set; }
        public string Pais { get; set; }
        public int Cp { get; set; }
    
        // se guarda nombre del archivo
        public string DniFrente{ get; set; }
        public string DniDorso { get; set; }
        public string UsuarioId { get; set; }
        public ApplicationUser Usuario { get; set; }
    }
}
