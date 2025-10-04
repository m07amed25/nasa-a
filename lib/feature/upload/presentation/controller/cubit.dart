import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:orbita_hackathon/feature/upload/presentation/controller/state.dart';

import '../../domain/usecase/usecase_file.dart';


class ExoplanetAnalysisCubit extends Cubit<ExoplanetAnalysisStates> {
  final ExoplanetAnalysisUseCase exoplanetAnalysisUseCase;

  ExoplanetAnalysisCubit({required this.exoplanetAnalysisUseCase}) : super(InitialAnalysisState());

  static ExoplanetAnalysisCubit get(context) => BlocProvider.of(context);

  File? csvFile;
  List<List<dynamic>>? csvPreviewData;
  String? selectedFileName;

  Future<void> selectCsvFile() async {
    try {
      emit(SelectingFileState());
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );

      if (result != null && result.files.single.path != null) {
        csvFile = File(result.files.single.path!);
        selectedFileName = result.files.single.name;
        final fileContent = await csvFile!.readAsString();
        csvPreviewData = const CsvToListConverter().convert(fileContent);
        emit(FileSelectedSuccessState(
          fileName: selectedFileName!,
          previewData: csvPreviewData!,
        ));
      } else {
        emit(FileSelectionCancelledState());
      }
    } catch (e) {
      emit(FileSelectionCancelledState());
    }
  }

  Future<void> analyzeCsvFile() async {
    if (csvFile == null) return;

    emit(LoadingAnalysisState());
    final result = await exoplanetAnalysisUseCase(file: csvFile!);

    result.fold(
          (failure) {
        csvFile = null;
        csvPreviewData = null;
        selectedFileName = null;
        emit(AnalysisFailureState(message: failure.errorMessage));
      },
          (data) {
        emit(AnalysisSuccessState(analysisResponseEntity: data));
      },
    );
  }

  void resetState() {
    csvFile = null;
    csvPreviewData = null;
    selectedFileName = null;
    emit(InitialAnalysisState());
  }
}