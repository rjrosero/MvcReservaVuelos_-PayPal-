namespace Modelo
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class AgenciaContext : DbContext
    {
        public AgenciaContext()
            : base("name=AgenciaContext")
        {
        }

        public virtual DbSet<AGENCIA> AGENCIAs { get; set; }
        public virtual DbSet<RESERVA> RESERVAs { get; set; }
        public virtual DbSet<TARIFA> TARIFAs { get; set; }
        public virtual DbSet<USUARIO> USUARIOs { get; set; }
        public virtual DbSet<VUELO> VUELOes { get; set; }
        public virtual DbSet<VUELO_RESERVA> VUELO_RESERVA { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AGENCIA>()
                .Property(e => e.AGENCIA_NOMBRE)
                .IsUnicode(false);

            modelBuilder.Entity<AGENCIA>()
                .Property(e => e.AGENCIA_DIRECCION)
                .IsUnicode(false);

            modelBuilder.Entity<AGENCIA>()
                .Property(e => e.AGENCIA_TELEFONO)
                .IsUnicode(false);

            modelBuilder.Entity<RESERVA>()
                .HasMany(e => e.VUELO_RESERVA)
                .WithRequired(e => e.RESERVA)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TARIFA>()
                .Property(e => e.TARIFA_TIPO)
                .IsUnicode(false);

            modelBuilder.Entity<TARIFA>()
                .Property(e => e.TARIFA_COSTO)
                .HasPrecision(6, 2);

            modelBuilder.Entity<TARIFA>()
                .Property(e => e.TARIFA_DESCRIPCION)
                .IsUnicode(false);

            modelBuilder.Entity<TARIFA>()
                .Property(e => e.TARIFA_PORCENTAJE)
                .HasPrecision(5, 2);

            modelBuilder.Entity<USUARIO>()
                .Property(e => e.USUARIO_NOMBRE)
                .IsUnicode(false);

            modelBuilder.Entity<USUARIO>()
                .Property(e => e.USUARIO_CORREO)
                .IsUnicode(false);

            modelBuilder.Entity<USUARIO>()
                .Property(e => e.USUARIO_CONTRASENA)
                .IsUnicode(false);

            modelBuilder.Entity<USUARIO>()
                .Property(e => e.USUARIO_ROL)
                .IsUnicode(false);

            modelBuilder.Entity<USUARIO>()
                .Property(e => e.USUARIO_TELEFONO)
                .IsUnicode(false);

            modelBuilder.Entity<VUELO>()
                .Property(e => e.VUELO_ORIGEN)
                .IsUnicode(false);

            modelBuilder.Entity<VUELO>()
                .Property(e => e.VUELO_DESTINO)
                .IsUnicode(false);

            modelBuilder.Entity<VUELO>()
                .Property(e => e.VUELO_NUMERO)
                .IsUnicode(false);

            modelBuilder.Entity<VUELO>()
                .HasMany(e => e.VUELO_RESERVA)
                .WithRequired(e => e.VUELO)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<VUELO_RESERVA>()
                .Property(e => e.COSTO_TOTAL)
                .HasPrecision(10, 2);
        }
    }
}
