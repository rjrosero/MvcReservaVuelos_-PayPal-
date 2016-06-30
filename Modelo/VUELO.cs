namespace Modelo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("VUELO")]
    public partial class VUELO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public VUELO()
        {
            VUELO_RESERVA = new HashSet<VUELO_RESERVA>();
        }

        [Key]
        public int VUELO_CODIGO { get; set; }

        public int? AGENCIA_CODIGO { get; set; }

        [Required]
        [StringLength(32)]
        public string VUELO_ORIGEN { get; set; }

        [Required]
        [StringLength(32)]
        public string VUELO_DESTINO { get; set; }

        [Required]
        [StringLength(8)]
        public string VUELO_NUMERO { get; set; }

        public DateTime VUELO_SALIDA { get; set; }

        public DateTime VUELO_LLEGADA { get; set; }

        public int VUELO_CAPACIDAD { get; set; }

        public int? VUELO_DISPONIBLES { get; set; }

        public virtual AGENCIA AGENCIA { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VUELO_RESERVA> VUELO_RESERVA { get; set; }
    }
}
