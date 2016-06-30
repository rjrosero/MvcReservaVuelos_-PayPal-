namespace Modelo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class VUELO_RESERVA
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int VUELO_CODIGO { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int RESERVA_CODIGO { get; set; }

        public int VR_NUM_ASIENTOS { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? COSTO_TOTAL { get; set; }

        public virtual RESERVA RESERVA { get; set; }

        public virtual VUELO VUELO { get; set; }
    }
}
