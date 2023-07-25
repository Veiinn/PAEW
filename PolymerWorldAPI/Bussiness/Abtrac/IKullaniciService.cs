using Entity.Entities;
using Entity.ViewEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness.Abtrac
{
    public interface IKullaniciService
    {
        Task<Kullanici> KullaniciGiris(KullaniciGiris kullaniciGiris);
        Task<Kullanici> KullaniciBul(int KullaniciId);
    }
}
