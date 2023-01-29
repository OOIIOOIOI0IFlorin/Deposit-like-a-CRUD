using Depozit.Domain.Models;
using System.Collections.Generic;

namespace Depozit.Infrastructure.Interfaces
{

    public interface IIesire
    {
        List<Iesire> GetIesiri(string ConnectionString);
        Iesire GetIesire(string ConnectionString, int ProductName, string PartnerName, int Qty);
        void CreateIesire(string ConnectionString, string ProductName, string PartnerName, int Qty);
        void UpdateIesire(string ConnectionString, int Id, string ProductName, string PartnerName, int Qty);
        void DeleteIesiri(string ConnectionString, int Id);
    }
}
