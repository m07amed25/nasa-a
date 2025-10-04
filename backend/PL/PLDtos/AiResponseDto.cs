namespace DAL.Models
{
    public class AiResponseDto
    {
        public List<PredictionDto> Predictions { get; set; }
        public int BatchSize { get; set; }
        public double ProcessingTimeMs { get; set; }
        public ModelInfoDto ModelInfo { get; set; }
    }
}
