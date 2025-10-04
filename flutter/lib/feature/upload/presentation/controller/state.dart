
import '../../domain/entity/analysis_response_entity.dart';

abstract class ExoplanetAnalysisStates {}

class InitialAnalysisState extends ExoplanetAnalysisStates {}

class SelectingFileState extends ExoplanetAnalysisStates {}


class FileSelectedSuccessState extends ExoplanetAnalysisStates {
  final String fileName;
  final List<List<dynamic>> previewData;

  FileSelectedSuccessState({required this.fileName, required this.previewData});
}


class FileSelectionCancelledState extends ExoplanetAnalysisStates {}

class LoadingAnalysisState extends ExoplanetAnalysisStates {}

class AnalysisSuccessState extends ExoplanetAnalysisStates {
  final AnalysisResponseEntity analysisResponseEntity;

  AnalysisSuccessState({required this.analysisResponseEntity});
}

// 7. حالة فشل عملية التحليل
class AnalysisFailureState extends ExoplanetAnalysisStates {
  final String message;

  AnalysisFailureState({required this.message});
}