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
    public class KategoriFirmaServices : IKategoriFirmaService
    {
        private readonly IKategoriFirma _kategoriFirma;
        public KategoriFirmaServices(IKategoriFirma kategoriFirma)
        {
            _kategoriFirma=kategoriFirma;
        }
        public Task<List<FirmaKategori>> ButunKategorilerFirma()
        {
           return _kategoriFirma.GetAllFirmaCategory();
        }

        public async Task KategoriEkleFirma(FirmaKategori firmaKategori)
        {
            await _kategoriFirma.AddCategoryFirma(firmaKategori);
        }

        public async Task KategoriGuncelleFirma(FirmaKategori firmaKategori)
        {
            await _kategoriFirma.UpdateCategoryFirma(firmaKategori);
        }

        public async Task KategoriSilFirma(int FirmaKategoriId)
        {
            await _kategoriFirma.DeleteCategoryFirma(FirmaKategoriId);
        }
    }
}
