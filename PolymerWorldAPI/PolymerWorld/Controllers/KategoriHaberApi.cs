using Bussiness.Abtrac;
using Entity.Entities;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace PolymerWorld.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class KategoriHaberApi : ControllerBase
    {
        private readonly IKategoriHaberService _kategoriHaberService;

        public KategoriHaberApi(IKategoriHaberService kategoriService)
        {
            _kategoriHaberService = kategoriService;
        }

        [EnableCors("MyCorsPolicy")]
        [HttpGet("ButunHaberKategoriler")]
        public async Task<IActionResult> ButunHaberKategoriler()
        {
            var kategoriler = await _kategoriHaberService.ButunKategorilerHaber();
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
        [HttpPost("HaberKategoriEkle")]
        public async Task<IActionResult> HaberKategoriEkle(HaberKategori haberKategori)
        {
            try
            {
                await _kategoriHaberService.KategoriEkleHaber(haberKategori);
                return Ok("Kategori başarıyla eklendi.");
            }
            catch 
            {
                return BadRequest("Kategori eklerken bir hata oluştu");
            }
        }

        [EnableCors("MyCorsPolicy")]
        [HttpDelete("HaberKategoriSil")]
        public async Task<IActionResult> HaberKategoriSil(int haberKategoriId)
        {
            try
            {
                await _kategoriHaberService.KategoriSilHaber(haberKategoriId);
                return Ok("Kategori başarıyla silindi.");
            }
            catch
            {
                return BadRequest($"Kategori silinirken bir hata oluştu");
            }
        }

        [EnableCors("MyCorsPolicy")]
        [HttpPut("HaberKategoriGuncelle")]
        public async Task<IActionResult> HaberKategoriGuncelle(HaberKategori HaberKategori)
        {
            try
            {
                await _kategoriHaberService.KategoriGuncelleHaber(HaberKategori);
                return Ok("Kategori başarıyla silindi.");
            }
            catch
            {
                return BadRequest($"Kategori silinirken bir hata oluştu");
            }
        }

    }
}
