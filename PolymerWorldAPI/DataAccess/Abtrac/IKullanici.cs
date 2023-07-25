using Entity.Entities;
using Entity.ViewEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abtrac
{
    public interface IKullanici
    {
        Task<Kullanici> UserLogin(KullaniciGiris kullaniciGiris);
        Task<Kullanici> FindUser(int KullaniciId);
    }
}
