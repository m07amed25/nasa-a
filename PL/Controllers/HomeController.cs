using BLLProject.Interfaces;
using BLLProject.Repositories;
using DAL.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http.Headers;
using System.Security.Claims;

namespace PL.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private readonly HttpClient _httpClient;
        private readonly IKepoiDataRepository _kepoiDataRepository;

        public HomeController(IKepoiDataRepository kepoiDataRepository, IHttpClientFactory httpClientFactory)
        {
            _httpClient = httpClientFactory.CreateClient();
            _kepoiDataRepository = kepoiDataRepository;
        }

        [Authorize]
        [HttpPost("[action]")]
        public async Task<IActionResult> UploadCsv(IFormFile? file)
        {
            if(file == null)
                return BadRequest("File is required.");

            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var records = await _kepoiDataRepository.ProcessCsvAsync(file, userId);

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", "d5a502e7-c997-4fdb-908b-c3b066c39883");
            var response = await _httpClient.PostAsJsonAsync("https://8000-dep-01k6p8df50c7qt6qxw0sa1z8zm-d.cloudspaces.litng.ai/predict", records);

            var aiResult = await response.Content.ReadAsStringAsync();

            return Ok(new
            {
                Data = records,
                AiResult = aiResult
            });
        }

        [HttpPost("[action]")]
        public IActionResult ReceivePrediction([FromBody] AiResponseDto aiResponse)
        {
            if (aiResponse == null || aiResponse.Predictions == null)
                return BadRequest("Invalid data");

            var result = aiResponse.Predictions
                 .Select(p => new
                 {
                     PredictedDisposition = p.PredictedDisposition,
                     Confidence = p.Confidence
                 })
                 .ToList();

            return Ok(new
            {
                Message = "Received and filtered predictions",
                Result = result
            });
        }
    }
}
