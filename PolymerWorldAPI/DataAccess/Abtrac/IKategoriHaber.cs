using Entity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abtrac
{
    public interface IKategoriHaber
    {
        Task<List<HaberKategori>> GetAllHaberCategory();
        Task AddCategoryHaber(HaberKategori haberKategori);
        Task UpdateCategoryHaber(HaberKategori haberKategori);
        Task DeleteCategoryHaber(int haberKategoriId);
    }
}
