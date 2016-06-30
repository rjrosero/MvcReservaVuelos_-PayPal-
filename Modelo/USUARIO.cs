namespace Modelo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("USUARIO")]
    public partial class USUARIO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public USUARIO()
        {
            RESERVAs = new HashSet<RESERVA>();
        }

        [Key]
        public int USUARIO_CODIGO { get; set; }

        [Required]
        [StringLength(128)]
        public string USUARIO_NOMBRE { get; set; }

        [Required]
        [StringLength(128)]
        public string USUARIO_CORREO { get; set; }

        [Required]
        [StringLength(256)]
        public string USUARIO_CONTRASENA { get; set; }

        [Required]
        [StringLength(32)]
        public string USUARIO_ROL { get; set; }

        [Required]
        [StringLength(16)]
        public string USUARIO_TELEFONO { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RESERVA> RESERVAs { get; set; }
    }
}
