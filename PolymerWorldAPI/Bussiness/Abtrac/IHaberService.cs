using Entity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness.Abtrac
{
    public interface IHaberService
    {
        Task<List<Haber>> ButunHaberler();
        Task<List<Haber>> ButunHaberlerListesi();
        Task<List<Haber>> KategoriIdButunHabeler(int kategoriId);
        Task HaberEkle(Haber haber);
        Task HaberSil(int haberId);
        Task HaberGuncelle(Haber haber);
    }
}
