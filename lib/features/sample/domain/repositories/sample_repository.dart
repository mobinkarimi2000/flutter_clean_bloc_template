import 'package:dartz/dartz.dart';
import 'package:flutter_clean_bloc_template/core/error_handling/failure.dart';
import 'package:flutter_clean_bloc_template/features/sample/domain/models/sample_model.dart';
import 'package:flutter_clean_bloc_template/features/sample/domain/models/sample_list_params.dart';

abstract class SampleRepository {
  Future<Either<Failure, List<SampleModel>>> getSampleList(
      SampleListParams params);
}
