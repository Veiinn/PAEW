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
    public class FirmaRepository : IFirma
    {
        private readonly AppDbContext _dbContext;

        public FirmaRepository(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task AddFirma(Firma firma)
        {
            await _dbContext.Firmas.AddAsync(firma);
            await _dbContext.SaveChangesAsync();
        }

        public async Task DeleteFirma(int firmaId)
        {
            var FirmaDelete = await _dbContext.Firmas.FirstOrDefaultAsync(x => x.FirmaId == firmaId);
            _dbContext.Firmas.Remove(FirmaDelete);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<List<Firma>> FindIdGetFirmaAll(int kategoriId)
        {
            return await _dbContext.Firmas
                .Where(x => x.FirmaKategori == kategoriId)
                .ToListAsync();
        }

        public async Task<List<Firma>> GetFirmaAll()
        {
            return await _dbContext.Firmas.ToListAsync();
        }

        public async Task UpdateFirma(Firma firma)
        {
            // First, retrieve the existing entity from the database
            var existingFirma = await _dbContext.Firmas.FindAsync(firma.FirmaId);

            if (existingFirma == null)
            {
                throw new Exception("Firma not found");
            }

            // Update the properties of the existing entity
            existingFirma.FirmaIsim = firma.FirmaIsim;
            existingFirma.FirmaOzet = firma.FirmaOzet;
            existingFirma.FirmaEposta = firma.FirmaEposta;
            existingFirma.FirmaTelefon = firma.FirmaTelefon;
            existingFirma.FirmaResim = firma.FirmaResim;
            existingFirma.FirmaKategori = firma.FirmaKategori;

            // Save the changes to the database
            await _dbContext.SaveChangesAsync();
        }
    }
}