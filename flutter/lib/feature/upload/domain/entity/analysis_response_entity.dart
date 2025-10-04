class AnalysisResponseEntity {
  final String resultMessage;
  final bool hasExoplanet;
  final Map<String, dynamic> analysisData;

  AnalysisResponseEntity({
    required this.resultMessage,
    required this.hasExoplanet,
    required this.analysisData,
  });
}