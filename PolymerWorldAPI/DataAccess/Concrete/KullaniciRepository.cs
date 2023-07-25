using DataAccess.Abtrac;
using DataAccess.Context;
using Entity.Entities;
using Entity.ViewEntities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete
{
    public class KullaniciRepository : IKullanici
    {
        private readonly AppDbContext _dbContext;
        public KullaniciRepository(AppDbContext appDbContext)
        {
            _dbContext = appDbContext;
        }

        public async Task<Kullanici> FindUser(int KullaniciId)
        {
            var kullanici = await _dbContext.Kullanicis.FirstOrDefaultAsync(x => x.KullaniciId == KullaniciId);
            return kullanici;
        }

        public async Task<Kullanici> UserLogin(KullaniciGiris kullaniciGiris)
        {
            var kullanici = await _dbContext.Kullanicis.FirstOrDefaultAsync(x => x.KullaniciEposta == kullaniciGiris.Eposta && x.KullaniciSifre == kullaniciGiris.Sifre);
            return kullanici;
        }
    }
}
