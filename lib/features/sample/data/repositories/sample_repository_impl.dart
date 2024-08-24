import 'package:dartz/dartz.dart';
import 'package:flutter_clean_bloc_template/core/error_handling/custom_exception.dart';
import 'package:flutter_clean_bloc_template/core/error_handling/failure.dart';
import 'package:flutter_clean_bloc_template/core/utils/utils.dart';
import 'package:flutter_clean_bloc_template/features/sample/data/datasources/network/mapper/sample_mapper.dart';
import 'package:flutter_clean_bloc_template/features/sample/domain/models/sample_list_params.dart';
import 'package:flutter_clean_bloc_template/features/sample/domain/models/sample_model.dart';

import '../datasources/network/abstraction/sample_data_source.dart';
import '../../domain/repositories/sample_repository.dart';

class SampleRepositoryImpl extends SampleRepository {
  final SampleDataSource _sampleDataSource;
  final SampleMapper _sampleMapper;
  SampleRepositoryImpl(this._sampleDataSource, this._sampleMapper);
  @override
  Future<Either<Failure, List<SampleModel>>> getSampleList(
      SampleListParams params) async {
    try {
      final listDto = await _sampleDataSource.getSampleList(params);
      final listModel = listDto
          .map(
            (e) => _sampleMapper.mapFromEntity(e),
          )
          .toList();
      return right(listModel);
    } on NoInternetConnectionException {
      return left(NoInternetConnectionFailure());
    } on BadRequestException catch (e) {
      return left(
          BadRequestFailure(errorCode: e.errorCode, message: e.errorMessage));
    } on RestApiException catch (e) {
      return left(Utils.handleRestApiException(e));
    } catch (e) {
      return left(Utils.handleUnknownException(e));
    }
  }
}
