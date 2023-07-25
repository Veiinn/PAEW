using Entity.ViewEntities;
using Bussiness.Abtrac;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace PolymerWorld.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class KullaniciApi : ControllerBase
    {
        private readonly IKullaniciService _kullaniciService;

        public KullaniciApi(IKullaniciService kullaniciService)
        {
            _kullaniciService = kullaniciService;
        }

        [HttpPost("KullaniciGiris")]
        public async Task<IActionResult> KullaniciGiris(KullaniciGiris kullaniciGiris)
        {
             var Kullanici = await _kullaniciService.KullaniciGiris(kullaniciGiris);
            if (Kullanici != null)
            {
                return Ok(Kullanici);
            }
            else
            {
                return BadRequest("Kullanıcı girişi başarısız");
            }
                

          

        }

        [HttpPost("KullaniciBul")]
        public async Task<IActionResult> KullaniciBul(int kullaniciId)
        {
            var Kullanici = await _kullaniciService.KullaniciBul(kullaniciId);

            if (Kullanici != null)
            {
                return Ok(Kullanici);
            }
            else
            {
                return BadRequest("Kullanici Bulunamadı.");
            }
        }
    }
}
