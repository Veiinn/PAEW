using Entity.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Bussiness.Abtrac
{
    public interface IFirmaServices
    {
        Task<List<Firma>> ButunFirmalar();
        Task<List<Firma>> KategoriIdButunFirmalar(int kategoriId);
        Task FirmaEkle(Firma firma);
        Task FirmaSil(int firmaId);
        Task FirmaGuncelle(Firma firma);
    }
}