using Entity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abtrac
{
    public interface IHaberler
    {
        Task<List<Haber>> GetHaberAll();
        Task<List<Haber>> GetListHaberAll();
        Task<List<Haber>> FindIdGetHaberAll(int kategoriId);
        Task AddHaber(Haber haber);
        Task DeleteHaber(int haberId);
        Task UpdateHaber(Haber haber);
    }
}

