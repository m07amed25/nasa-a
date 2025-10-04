namespace DAL.Models
{
    public class PredictionProbabilitiesDto
    {
        public double Candidate { get; set; }
        public double Confirmed { get; set; }
        public double FalsePositive { get; set; }
    }
}
