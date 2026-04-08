using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Park.Model;

public partial class ParkDbContext : DbContext
{
    public ParkDbContext()
    {
    }

    public ParkDbContext(DbContextOptions<ParkDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Attraction> Attractions { get; set; }

    public virtual DbSet<CaregoryAttraction> CaregoryAttractions { get; set; }

    public virtual DbSet<EquipmentAttraction> EquipmentAttractions { get; set; }

    public virtual DbSet<Gender> Genders { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<StatusAttraction> StatusAttractions { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Visit> Visits { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=ParkDb;Username=postgres;Password=111");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Attraction>(entity =>
        {
            entity.HasKey(e => e.IdAtraction).HasName("Attraction_pkey");

            entity.ToTable("Attraction");

            entity.Property(e => e.Descriotion).HasColumnType("character varying");
            entity.Property(e => e.NameAtraction).HasMaxLength(100);
        });

        modelBuilder.Entity<CaregoryAttraction>(entity =>
        {
            entity.HasKey(e => e.IdCategory).HasName("CaregoryAttraction_pkey");

            entity.ToTable("CaregoryAttraction");

            entity.Property(e => e.CategoryName).HasColumnType("character varying");
        });

        modelBuilder.Entity<EquipmentAttraction>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("EquipmentAttraction");

            entity.Property(e => e.Element).HasColumnType("character varying");
        });

        modelBuilder.Entity<Gender>(entity =>
        {
            entity.HasKey(e => e.IdGender).HasName("Gender_pkey");

            entity.ToTable("Gender");

            entity.Property(e => e.GenderName).HasColumnType("character varying");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.IdRole).HasName("Role_pkey");

            entity.ToTable("Role");

            entity.Property(e => e.RoleName).HasColumnType("character varying");
        });

        modelBuilder.Entity<StatusAttraction>(entity =>
        {
            entity.HasKey(e => e.IdStatus).HasName("StatusRoom_pkey");

            entity.ToTable("StatusAttraction");

            entity.Property(e => e.IdStatus).HasDefaultValueSql("nextval('\"StatusRoom_IdStatus_seq\"'::regclass)");
            entity.Property(e => e.Statusname).HasColumnType("character varying");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.IdUser).HasName("User_pkey");

            entity.ToTable("User");

            entity.Property(e => e.Block).HasDefaultValue(false);
            entity.Property(e => e.FirstAuth).HasDefaultValue(false);
            entity.Property(e => e.FirstName).HasMaxLength(100);
            entity.Property(e => e.LastName).HasMaxLength(100);
            entity.Property(e => e.Login).HasMaxLength(50);
            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.Patronymic).HasMaxLength(100);
            entity.Property(e => e.PhoneNumber).HasMaxLength(11);
        });

        modelBuilder.Entity<Visit>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Visit_pkey");

            entity.ToTable("Visit");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
