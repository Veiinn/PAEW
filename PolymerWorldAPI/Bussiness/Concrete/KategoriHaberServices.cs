using Bussiness.Abtrac;
using DataAccess.Abtrac;
using Entity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness.Concrete
{
    public class KategoriHaberServices : IKategoriHaberService
    {
        private readonly IKategoriHaber _kategoriHaber;
        public KategoriHaberServices(IKategoriHaber kategoriHaber)
        {
            _kategoriHaber = kategoriHaber;
        }

        public async Task KategoriEkleHaber(HaberKategori haberKategori)
        {
            await _kategoriHaber.AddCategoryHaber(haberKategori);
        }

        public Task<List<HaberKategori>> ButunKategorilerHaber()
        {
            return _kategoriHaber.GetAllHaberCategory();
        }

        public async Task KategoriSilHaber(int haberKategoriId)
        {
            await _kategoriHaber.DeleteCategoryHaber(haberKategoriId);
        }

        public async Task KategoriGuncelleHaber(HaberKategori haberKategori)
        {
            await _kategoriHaber.UpdateCategoryHaber(haberKategori);
        }
    }
}
