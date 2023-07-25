using Bussiness.Abtrac;
using DataAccess.Abtrac;
using Entity.Entities;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace PolymerWorld.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class FirmalarApi : ControllerBase
    {
        private readonly IFirmaServices _FirmaService;
        public FirmalarApi(IFirmaServices firma) 
        {
            _FirmaService = firma;
        }


        [EnableCors("MyCorsPolicy")]
        [HttpGet("ButunFirmaler")]
        public async Task<IActionResult> ButunFirmaler()
        {
            var Firmaler = await _FirmaService.ButunFirmalar();

            if (Firmaler != null)
            {
                return Ok(Firmaler);
            }
            else
            {
                return BadRequest("Firmaler bulunamadı.");
            }
        }

        [EnableCors("MyCorsPolicy")]
        [HttpGet("KategoriFirmaler")]
        public async Task<IActionResult> KategoriFirmaler(int kategoriId)
        {
            var KategoriFirma = await _FirmaService.KategoriIdButunFirmalar(kategoriId);

            if (KategoriFirma != null)
            {
                return Ok(KategoriFirma);
            }
            else
            {
                return BadRequest("Firmaler bulunamadı.");
            }
        }


        [EnableCors("MyCorsPolicy")]
        [HttpPost("FirmaEkle")]
        public async Task<IActionResult> FirmaEkle(Firma Firma)
        {
            if (ModelState.IsValid)
            {
                await _FirmaService.FirmaEkle(Firma);
                return Ok();
            }
            else
            {
                return BadRequest("Firma Eklerken Bir Sorun Oluştu Lütfen Kontrol Ediniz.");
            }

        }

        [EnableCors("MyCorsPolicy")]
        [HttpDelete("FirmaSil")]
        public async Task<IActionResult> FirmaSil(int FirmaId)
        {
            try
            {
                await _FirmaService.FirmaSil(FirmaId);
                return Ok();
            }
            catch 
            {

                return BadRequest("Firma güncellerken bir sorun oluştu. Lütfen kontrol ediniz.");
            }
               

                

        }

        [EnableCors("MyCorsPolicy")]
        [HttpPut("FirmaGuncelle")]
        public async Task<IActionResult> FirmaGuncelle(Firma Firma)
        {
            if (ModelState.IsValid)
            {
                await _FirmaService.FirmaGuncelle(Firma);
                return Ok();
            }
            else
            {
                return BadRequest("Firma güncellerken bir sorun oluştu. Lütfen kontrol ediniz.");
            }
        }
    }
}
