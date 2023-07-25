using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Entities
{
    public class Firma
    {
        public int FirmaId { get; set; }
        public string FirmaIsim { get; set; }
        public string FirmaOzet { get; set; }
        public string FirmaEposta { get; set; }
        public string FirmaTelefon { get; set; }
        public byte[] FirmaResim { get; set; }
        public int FirmaKategori { get; set; }
    }
}
