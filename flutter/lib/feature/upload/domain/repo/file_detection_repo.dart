import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure/failure.dart';
import '../entity/analysis_response_entity.dart';

abstract class ExoplanetAnalysisRepo {

  Future<Either<Failure,AnalysisResponseEntity>> analyzeFile ({required File file });
}