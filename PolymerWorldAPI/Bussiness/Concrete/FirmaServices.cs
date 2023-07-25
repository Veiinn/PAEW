using Bussiness.Abtrac;
using DataAccess.Abtrac;
using Entity.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Bussiness.Concrete
{
    public class FirmaServices : IFirmaServices
    {
        private readonly IFirma _firmaRepository;

        public FirmaServices(IFirma firmaRepository)
        {
            _firmaRepository = firmaRepository;
        }

        public async Task<List<Firma>> ButunFirmalar()
        {
            return await _firmaRepository.GetFirmaAll();
        }

        public async Task FirmaEkle(Firma firma)
        {
            await _firmaRepository.AddFirma(firma);
        }

        public async Task<List<Firma>> KategoriIdButunFirmalar(int kategoriId)
        {
            return await _firmaRepository.FindIdGetFirmaAll(kategoriId);
        }

        public async Task FirmaSil(int firmaId)
        {
            await _firmaRepository.DeleteFirma(firmaId);
        }

        public async Task FirmaGuncelle(Firma firma)
        {
            await _firmaRepository.UpdateFirma(firma);
        }
    }
}