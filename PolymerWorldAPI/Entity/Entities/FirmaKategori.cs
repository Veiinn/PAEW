using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Entities
{
    public class FirmaKategori
    {
        [Key]
        public int KategoriId { get; set; }
        public string KategoriAd { get; set; }
        public bool KategoriDurum { get; set; }
    }
}
