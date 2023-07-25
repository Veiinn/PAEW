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
    public class KategoriFirmaRepository : IKategoriFirma
    {
        private readonly AppDbContext _dbContext;

        public KategoriFirmaRepository(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task AddCategoryFirma(FirmaKategori firmaKategori)
        {
            await _dbContext.FirmaKategoris.AddAsync(firmaKategori);
            _dbContext.SaveChangesAsync();
        }

        public async Task DeleteCategoryFirma(int firmaKategoriId)
        {
            var FirmaKategori = _dbContext.FirmaKategoris.FirstOrDefault(x => x.KategoriId == firmaKategoriId);
            _dbContext.FirmaKategoris.Remove(FirmaKategori);
            _dbContext.SaveChangesAsync();

        }

        public async Task<List<FirmaKategori>> GetAllFirmaCategory()
        {
           return await _dbContext.FirmaKategoris.Where(x=>x.KategoriDurum==true).ToListAsync();
        }

        public async Task UpdateCategoryFirma(FirmaKategori firmaKategori)
        {
            var FirmaKategoriUpdate=await _dbContext.FirmaKategoris.FindAsync(firmaKategori.KategoriId);
            if (FirmaKategoriUpdate == null)
            {
                throw new Exception("Kategori buluanamadı");
            }
            FirmaKategoriUpdate.KategoriAd = firmaKategori.KategoriAd;
            FirmaKategoriUpdate.KategoriDurum = firmaKategori.KategoriDurum;

            _dbContext.SaveChangesAsync();
        }
    }
}
