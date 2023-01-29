using System.Collections.Generic;
using Depozit.Domain.Models;

namespace Depozit.Infrastructure.Interfaces

{
    public interface IIntrare
    {
        public List<Intrare> GetIntrari(string ConnectionString);
        
       public Intrare GetIntrare(string ConnectionString, int Id);
        public void CreateIntrare(string ConnectionString, string ProductName, string PartnerName, int Qty);
        public void UpdateIntrare(string ConnectionString, int Id, string ProductName, string PartnerName, int Qty);
       public void DeleteIntrare(string ConnectionString, int Id);
        

    }
}
