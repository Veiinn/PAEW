using Entity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abtrac
{
    public interface IFirma
    {
        Task<List<Firma>> GetFirmaAll();
        Task<List<Firma>> FindIdGetFirmaAll(int kategoriId);
        Task AddFirma(Firma Firma);
        Task DeleteFirma(int firmaId);
        Task UpdateFirma(Firma Firma);
    }
}
