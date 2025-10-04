using BLL.DTOs;
using BLLProject.Interfaces;
using CsvHelper;
using CsvHelper.Configuration;
using DAL.Data;
using DAL.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System.Globalization;
using System.Security.Cryptography;

namespace BLLProject.Repositories
{
    public class KepoiDataRepository : IKepoiDataRepository 
    {
        public readonly AppDbContext _dbContect;

        public KepoiDataRepository(AppDbContext dbContect)
        {
            _dbContect = dbContect;
        }

        public async Task<List<KepoiDataDto>> ProcessCsvAsync(IFormFile file, string userId)
        {
            string fileHash = await GetFileHashAsync(file);

            // Check if file already exists
            var existing = await _dbContect.KepoiData
                .Where(x => x.FileHash == fileHash && x.AppUserId == userId)
                .ToListAsync();

            if (existing.Any())
                return existing.Select(k => (KepoiDataDto)k).ToList();

            // Parse CSV
            var dtoRecords = new List<KepoiDataDto>();
            using var reader = new StreamReader(file.OpenReadStream());
            var config = new CsvConfiguration(CultureInfo.InvariantCulture)
            {
                HasHeaderRecord = true,
                MissingFieldFound = null,   // تجاهل الأعمدة المفقودة
                BadDataFound = null,        // تجاهل الصفوف الغلط
                TrimOptions = TrimOptions.Trim
            };

            using var csv = new CsvReader(reader, config);
            // Mapping مباشر من CSV -> KepoiData
             dtoRecords = csv.GetRecords<KepoiDataDto>().ToList();

            var records = dtoRecords.Select(dto =>
            {
                var model = (KepoiData)dto;
                model.FileHash = fileHash;
                model.AppUserId = userId;
                return model;
            }).ToList();
           
            await _dbContect.KepoiData.AddRangeAsync(records);
            await _dbContect.SaveChangesAsync();

            return records.Select(k => (KepoiDataDto)k).ToList();
        }

        private async Task<string> GetFileHashAsync(IFormFile file)
        {
            using var sha256 = SHA256.Create();
            using var stream = file.OpenReadStream();
            var hashBytes = await sha256.ComputeHashAsync(stream);
            return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
        }
    }
}
