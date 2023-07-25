using Entity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness.Abtrac
{
    public interface IKategoriHaberService
    {
        Task<List<HaberKategori>> ButunKategorilerHaber();
        Task KategoriEkleHaber(HaberKategori haberKategori);
        Task KategoriGuncelleHaber(HaberKategori haberKategori);
        Task KategoriSilHaber(int haberKategoriId);
    }
}
