namespace Modelo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RESERVA")]
    public partial class RESERVA
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RESERVA()
        {
            VUELO_RESERVA = new HashSet<VUELO_RESERVA>();
        }

        [Key]
        public int RESERVA_CODIGO { get; set; }

        public int? USUARIO_CODIGO { get; set; }

        public DateTime RESERVA_FECHA { get; set; }

        public virtual USUARIO USUARIO { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VUELO_RESERVA> VUELO_RESERVA { get; set; }
    }
}
