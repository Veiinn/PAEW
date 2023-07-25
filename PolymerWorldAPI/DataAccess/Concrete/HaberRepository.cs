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
    public class HaberRepository : IHaberler
    {
        private readonly AppDbContext _dbContext;

        public HaberRepository(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task AddHaber(Haber haber)
        {
            await _dbContext.Habers.AddAsync(haber);
            await _dbContext.SaveChangesAsync();
        }

        public async Task DeleteHaber(int haberId)
        {
            var Haber= await _dbContext.Habers.FirstOrDefaultAsync(x => x.HaberId == haberId);
            _dbContext.Habers.Remove(Haber);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<List<Haber>> FindIdGetHaberAll(int kategoriId)
        {
            return await _dbContext.Habers.Where(x => x.KategoriId == kategoriId && x.HaberDurum == true).ToListAsync();
        }

        public async Task<List<Haber>> GetHaberAll()
        {
            return await _dbContext.Habers.Where(x => x.HaberDurum == true).ToListAsync();
        }

        public async Task<List<Haber>> GetListHaberAll()
        {
            return await _dbContext.Habers.ToListAsync();
        }

        public async Task UpdateHaber(Haber haber)
        {
            // First, retrieve the existing entity from the database
            var existingHaber = await _dbContext.Habers.FindAsync(haber.HaberId);

            if (existingHaber == null)
            {
                throw new Exception("Haber buluanamadı");
            }

            // Update the properties of the existing entity
            existingHaber.HaberBaslik = haber.HaberBaslik;
            existingHaber.HaberIcerik = haber.HaberIcerik;
            existingHaber.HaberResim = haber.HaberResim;
            existingHaber.HaberTarih = haber.HaberTarih;
            existingHaber.HaberGorunum = haber.HaberGorunum;
            existingHaber.HaberDurum = haber.HaberDurum;
            existingHaber.KullaniciId = haber.KullaniciId;
            existingHaber.KategoriId = haber.KategoriId;

            // Save the changes to the database
            await _dbContext.SaveChangesAsync();
        }
    }
}