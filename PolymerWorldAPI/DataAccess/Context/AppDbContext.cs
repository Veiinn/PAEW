using Entity.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Context
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
          
        }

        public DbSet<Haber> Habers { get; set; }
        public DbSet<HaberKategori> HaberKategoris { get; set; }
        public DbSet<Kullanici> Kullanicis { get; set; }
        public DbSet<KullaniciRole> KullaniciRoles { get; set; }
        public DbSet<Firma> Firmas { get; set; }
        public DbSet<FirmaKategori> FirmaKategoris { get; set; }
    }
}
