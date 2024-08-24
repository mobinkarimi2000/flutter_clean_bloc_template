import 'package:flutter_clean_bloc_template/core/mapper/mapper.dart';
import 'package:flutter_clean_bloc_template/features/sample/data/datasources/network/dto/sample_dto.dart';
import 'package:flutter_clean_bloc_template/features/sample/domain/models/sample_model.dart';

class SampleMapper extends EntityMapper<SampleDto, SampleModel> {
  @override
  SampleModel mapFromEntity(SampleDto entity) {
    // TODO: implement mapFromEntity
    throw UnimplementedError();
  }

  @override
  SampleDto mapToEntity(SampleModel domainModel) {
    // TODO: implement mapToEntity
    throw UnimplementedError();
  }
}
