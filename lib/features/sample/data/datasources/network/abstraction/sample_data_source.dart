import 'package:flutter_clean_bloc_template/features/sample/data/datasources/network/dto/sample_dto.dart';
import 'package:flutter_clean_bloc_template/features/sample/domain/models/sample_list_params.dart';

abstract class SampleDataSource {
  Future<List<SampleDto>> getSampleList(SampleListParams params);
}
