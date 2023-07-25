using Entity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness.Abtrac
{
    public interface IKategoriFirmaService
    {
        Task<List<FirmaKategori>> ButunKategorilerFirma();
        Task KategoriEkleFirma(FirmaKategori firmaKategori);
        Task KategoriGuncelleFirma(FirmaKategori firmaKategori);
        Task KategoriSilFirma(int FirmaKategoriId);
    }
}
