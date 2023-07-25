using DataAccess.Abtrac;
using DataAccess.Context;
using Entity.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete
{
    public class KategoriHaberRepository : IKategoriHaber
    {

        private readonly AppDbContext _dbContext;

        public KategoriHaberRepository(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task AddCategoryHaber(HaberKategori haberKategori)
        {
            await _dbContext.HaberKategoris.AddAsync(haberKategori);
            _dbContext.SaveChangesAsync();
        }

        public async Task DeleteCategoryHaber(int haberKategoriId)
        {
            var HaberKategori=await _dbContext.HaberKategoris.FirstOrDefaultAsync(x => x.KategoriId == haberKategoriId);
            _dbContext.HaberKategoris.Remove(HaberKategori);
            _dbContext.SaveChangesAsync();
        }

        public async Task<List<HaberKategori>> GetAllHaberCategory()
        {
            return await _dbContext.HaberKategoris.Where(x => x.KategoriDurum == true).ToListAsync();
        }

        public async Task UpdateCategoryHaber(HaberKategori haberKategori)
        {
            var HaberKategoriUpdate = await _dbContext.HaberKategoris.FindAsync(haberKategori.KategoriId);

            if (HaberKategoriUpdate == null)
            {
                throw new Exception("Kategori buluanamadı");
            }

            HaberKategoriUpdate.KategoriAd = haberKategori.KategoriAd;
            HaberKategoriUpdate.KategoriDurum = haberKategori.KategoriDurum;

            _dbContext.SaveChangesAsync();
        }
    }
}
