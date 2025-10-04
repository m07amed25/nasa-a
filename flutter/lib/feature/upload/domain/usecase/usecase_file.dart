import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure/failure.dart';
import '../entity/analysis_response_entity.dart';
import '../repo/file_detection_repo.dart'; // ١. استيراد العقد (المنيو)

class ExoplanetAnalysisUseCase {
  // ٢. الـ UseCase يعتمد على العقد، وليس على التنفيذ الفعلي
  final ExoplanetAnalysisRepo exoplanetAnalysisRepo;

  ExoplanetAnalysisUseCase({required this.exoplanetAnalysisRepo});

  // ٣. عند استدعائه، يقوم فقط بتمرير الطلب إلى الـ Repo
  Future<Either<Failure, AnalysisResponseEntity>> call({required File file}) async {
    return await exoplanetAnalysisRepo.analyzeFile(file: file);
  }
}