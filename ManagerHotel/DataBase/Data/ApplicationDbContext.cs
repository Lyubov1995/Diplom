using DataBase.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using System.ComponentModel;

namespace DataBase.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
           : base(options)
        {
        }

        protected override void ConfigureConventions(ModelConfigurationBuilder builder)
        {
            builder.Properties<DateOnly>()
                .HaveConversion<DateOnlyConverter>()
                .HaveColumnType("date");

            base.ConfigureConventions(builder);
        }
        public class DateOnlyConverter : ValueConverter<DateOnly, DateTime>
        {
            public DateOnlyConverter()
                : base(dateOnly =>
                        dateOnly.ToDateTime(TimeOnly.MinValue),
                    dateTime => DateOnly.FromDateTime(dateTime))
            { }
        }
        public DbSet<Users> Users { get; set; }
        public DbSet<Roles> Roles { get; set; }
        public DbSet<Status> Status { get; set; }
        public DbSet<RoomsCategory> RoomsCategory { get; set; }
        public DbSet<Images> Images { get; set; }
        public DbSet<Habitation> Habitation { get; set; }
        public DbSet<RoomPrice> RoomPrice { get; set; }
        public DbSet<Rooms> Rooms { get; set; }
        public DbSet<Employee> Employee { get; set; }
        public DbSet<Accommodation> Accommodation { get; set; }
        public DbSet<Employment> Employment { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Images>((pc =>
            {
                pc.HasNoKey();
            }));
            modelBuilder.Entity<RoomPrice>((pc =>
            {
                pc.HasNoKey();
            }));
        }
    }
}
