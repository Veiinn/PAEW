using Bussiness.Abtrac;
using Bussiness.Concrete;
using Entity.Entities;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace PolymerWorld.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class KategoriFirmaApi : ControllerBase
    {
        private readonly IKategoriFirmaService _kategoriFirmaService;

        public KategoriFirmaApi(IKategoriFirmaService kategoriFirmaService)
        {
            _kategoriFirmaService=kategoriFirmaService;
        }

        [EnableCors("MyCorsPolicy")]
        [HttpGet("ButunFirmaKategoriler")]
        public async Task<IActionResult> ButunFirmaKategoriler()
        {
            var kategoriler = await _kategoriFirmaService.ButunKategorilerFirma();
            if (kategoriler != null)
            {
                return Ok(kategoriler);
            }
            else
            {
                return BadRequest("Herhangi bir Kategori yok");
            }
        }

        [EnableCors("MyCorsPolicy")]
        [HttpPost("FirmaKategoriEkle")]
        public async Task<IActionResult> FirmaKategoriEkle(FirmaKategori FirmaKategori)
        {
            try
            {
                await _kategoriFirmaService.KategoriEkleFirma(FirmaKategori);
                return Ok("Kategori başarıyla eklendi.");
            }
            catch
            {
                return BadRequest("Kategori eklerken bir hata oluştu");
            }
        }

        [EnableCors("MyCorsPolicy")]
        [HttpDelete("FirmaKategoriSil")]
        public async Task<IActionResult> FirmaKategoriSil(int FirmaKategoriId)
        {
            try
            {
                await _kategoriFirmaService.KategoriSilFirma(FirmaKategoriId);
                return Ok("Kategori başarıyla silindi.");
            }
            catch
            {
                return BadRequest($"Kategori silinirken bir hata oluştu");
            }
        }

        [EnableCors("MyCorsPolicy")]
        [HttpPut("FirmaKategoriGuncelle")]
        public async Task<IActionResult> FirmaKategoriGuncelle(FirmaKategori FirmaKategori)
        {
            try
            {
                await _kategoriFirmaService.KategoriGuncelleFirma(FirmaKategori);
                return Ok("Kategori başarıyla silindi.");
            }
            catch
            {
                return BadRequest($"Kategori silinirken bir hata oluştu");
            }
        }
    }
}
