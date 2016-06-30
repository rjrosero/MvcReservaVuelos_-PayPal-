namespace Modelo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AGENCIA")]
    public partial class AGENCIA
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AGENCIA()
        {
            TARIFAs = new HashSet<TARIFA>();
            VUELOes = new HashSet<VUELO>();
        }

        [Key]
        public int AGENCIA_CODIGO { get; set; }

        [Required]
        [StringLength(128)]
        public string AGENCIA_NOMBRE { get; set; }

        [StringLength(256)]
        public string AGENCIA_DIRECCION { get; set; }

        [StringLength(16)]
        public string AGENCIA_TELEFONO { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TARIFA> TARIFAs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VUELO> VUELOes { get; set; }
    }
}
