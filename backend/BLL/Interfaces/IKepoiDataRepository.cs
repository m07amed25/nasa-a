using BLL.DTOs;
using DAL.Models;
using Microsoft.AspNetCore.Http;

namespace BLLProject.Interfaces
{
    public interface IKepoiDataRepository
    {
        public Task<List<KepoiDataDto>> ProcessCsvAsync(IFormFile file, string userId);
    }
}
