using Bussiness.Abtrac;
using DataAccess.Abtrac;
using Entity.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Bussiness.Concrete
{
    public class HaberServices : IHaberService
    {
        private readonly IHaberler _haberler;

        public HaberServices(IHaberler haberler)
        {
            _haberler = haberler;
        }

        public async Task<List<Haber>> ButunHaberler()
        {
            return await _haberler.GetHaberAll();
        }

        public async Task HaberEkle(Haber haber)
        {
            await _haberler.AddHaber(haber);
        }

        public async Task HaberSil(int haberId)
        {
            await _haberler.DeleteHaber(haberId);
        }

        public async Task<List<Haber>> KategoriIdButunHabeler(int kategoriId)
        {
            return await _haberler.FindIdGetHaberAll(kategoriId);
        }

        public async Task HaberGuncelle(Haber haber)
        {
            await _haberler.UpdateHaber(haber);
        }

        public async Task<List<Haber>> ButunHaberlerListesi()
        {
            return await _haberler.GetListHaberAll();
        }
    }
}
