using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Entities
{
    public class Haber
    {
        public int HaberId { get; set; }
        public string HaberBaslik { get; set; }
        public string HaberIcerik { get; set; }
        public byte[] HaberResim { get; set; }
        public DateTime HaberTarih { get; set; }
        public int HaberGorunum { get; set; }
        public bool HaberDurum { get; set; }
        public int KullaniciId { get; set; }
        public int KategoriId { get; set; }
    }
}
