namespace DAL.Models
{
    public class PredictionDto
    {
        public long Kepid { get; set; }
        public string KepoiName { get; set; }
        public string PredictedDisposition { get; set; }
        public double Confidence { get; set; }
        public PredictionProbabilitiesDto Probabilities { get; set; }
        public DateTime PredictionTimestamp { get; set; }
    }
}
