using Bussiness.Abtrac;
using Entity.Entities;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace PolymerWorld.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HaberlerApi : Controller
    {
        private readonly IHaberService _haberService;
        public HaberlerApi(IHaberService haberService)
        {
            _haberService = haberService;
        }


        [EnableCors("MyCorsPolicy")]
        [HttpGet("ButunHaberler")]
        public async Task<IActionResult> ButunHaberler()
        {
            var haberler = await _haberService.ButunHaberler();

            if (haberler != null)
            {
                return Ok(haberler);
            }
            else
            {
                return BadRequest("Haberler bulunamadı.");
            }
        }

        [EnableCors("MyCorsPolicy")]
        [HttpGet("KategoriHaberler")]
        public async Task<IActionResult> KategoriHaberler(int kategoriId)
        {
            var KategoriHaber = await _haberService.KategoriIdButunHabeler(kategoriId);

            if (KategoriHaber != null)
            {
                return Ok(KategoriHaber);
            }
            else
            {
                return BadRequest("Haberler bulunamadı.");
            }
        }


        [EnableCors("MyCorsPolicy")]
        [HttpPost("HaberEkle")]
        public async Task<IActionResult> HaberEkle(Haber haber)
        {
            if (ModelState.IsValid)
            {
                await _haberService.HaberEkle(haber);
                return Ok();
            }
            else
            {
                return BadRequest("Haber Eklerken Bir Sorun Oluştu Lütfen Kontrol Ediniz.");
            }
            
        }

        [EnableCors("MyCorsPolicy")]
        [HttpDelete("HaberSil")]
        public async Task<IActionResult> HaberSil(int haberId)
        {
            try
            {
                await _haberService.HaberSil(haberId);
                return Ok();
            }
            catch 
            {

                return BadRequest("Haber güncellerken bir sorun oluştu. Lütfen kontrol ediniz.");
            }
             
            
        }


        [EnableCors("MyCorsPolicy")]
        [HttpPut("HaberGuncelle")]
        public async Task<IActionResult> HaberGuncelle(Haber haber)
        {
            if (ModelState.IsValid)
            {
                await _haberService.HaberGuncelle(haber);
                return Ok();
            }
            else
            {
                return BadRequest("Haber güncellerken bir sorun oluştu. Lütfen kontrol ediniz.");
            }
        }

        [EnableCors("MyCorsPolicy")]
        [HttpGet("ButunHaberlerListesi")]
        public async Task<IActionResult> ButunHaberlerListesi()
        {
            var ButunHaberler = await _haberService.ButunHaberlerListesi();
            if (ButunHaberler != null)
            {
                return Ok(ButunHaberler);
            }
            else
            {
                return BadRequest("Haberler getirilirken bir hata oluştu.");
            }
        }
    }
}
