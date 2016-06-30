namespace Modelo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TARIFA")]
    public partial class TARIFA
    {
        [Key]
        public int TARIFA_CODIGO { get; set; }

        public int? AGENCIA_CODIGO { get; set; }

        [Required]
        [StringLength(32)]
        public string TARIFA_TIPO { get; set; }

        [Column(TypeName = "numeric")]
        public decimal TARIFA_COSTO { get; set; }

        [Required]
        [StringLength(256)]
        public string TARIFA_DESCRIPCION { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? TARIFA_PORCENTAJE { get; set; }

        public virtual AGENCIA AGENCIA { get; set; }
    }
}
