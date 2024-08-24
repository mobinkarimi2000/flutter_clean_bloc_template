import 'package:flutter_clean_bloc_template/features/sample/data/datasources/network/abstraction/sample_data_source.dart';
import 'package:flutter_clean_bloc_template/features/sample/data/datasources/network/dto/sample_dto.dart';
import 'package:flutter_clean_bloc_template/features/sample/domain/models/sample_list_params.dart';

class SampleDataSourceImpl extends SampleDataSource {
  @override
  Future<List<SampleDto>> getSampleList(SampleListParams params) {
    // TODO: implement getSampleList
    throw UnimplementedError();
  }
}
