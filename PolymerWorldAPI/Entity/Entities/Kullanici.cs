using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Entities
{
    public class Kullanici
    {
        public int KullaniciId { get; set; }
        public string KullaniciAd { get; set; }
        public string KullaniciSoyad { get; set; }
        public string KullaniciEposta { get; set; }
        public string KullaniciSifre { get; set; }
        public string KullaniciTelefon { get; set; }
        public string? KullaniciBaglantı { get; set; }
        public byte[]? KullaniciResim { get; set; }
        public bool KullaniciDurum { get; set; }
        public int KullaniciRol { get; set; }
    }
}

