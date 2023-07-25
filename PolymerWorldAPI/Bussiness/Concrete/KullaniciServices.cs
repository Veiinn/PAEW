using Bussiness.Abtrac;
using DataAccess.Abtrac;
using Entity.Entities;
using Entity.ViewEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness.Concrete
{
    public class KullaniciServices : IKullaniciService
    {
        private readonly IKullanici _kullanici;
        public KullaniciServices(IKullanici kullanici)
        {
            _kullanici = kullanici;
        }

        public async Task<Kullanici> KullaniciBul(int KullaniciId)
        {
            var kullanici=await _kullanici.FindUser(KullaniciId);
            return kullanici;
        }

        public async Task<Kullanici> KullaniciGiris(KullaniciGiris kullaniciGiris)
        {
              return await _kullanici.UserLogin(kullaniciGiris);
        }
    }
}
