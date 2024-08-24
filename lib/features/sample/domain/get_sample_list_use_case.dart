import 'package:dartz/dartz.dart';
import 'package:flutter_clean_bloc_template/core/error_handling/failure.dart';
import 'package:flutter_clean_bloc_template/core/usecase/use_case.dart';
import 'package:flutter_clean_bloc_template/features/sample/domain/models/sample_model.dart';
import 'package:flutter_clean_bloc_template/features/sample/domain/models/sample_list_params.dart';
import 'package:flutter_clean_bloc_template/features/sample/domain/repositories/sample_repository.dart';

class GetSampleListUseCase
    extends UseCase<Either<Failure, List<SampleModel>>, SampleListParams> {
  final SampleRepository _sampleRepository;

  GetSampleListUseCase(this._sampleRepository);
  @override
  Future<Either<Failure, List<SampleModel>>> call(SampleListParams input) {
    return _sampleRepository.getSampleList(input);
  }
}
