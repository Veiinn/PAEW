using Entity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abtrac
{
    public interface IKategoriFirma
    {
        Task<List<FirmaKategori>> GetAllFirmaCategory();
        Task AddCategoryFirma(FirmaKategori firmaKategori);
        Task UpdateCategoryFirma(FirmaKategori firmaKategori);
        Task DeleteCategoryFirma(int firmaKategoriId);
    }
}
