import 'package:flutter_clean_bloc_template/core/error_handling/failure.dart';
import 'package:flutter_clean_bloc_template/features/sample/domain/models/sample_model.dart';

abstract class SampleListStatus {}

class SampleListInitial extends SampleListStatus {}

class SampleListLoading extends SampleListStatus {}

class SampleListLoadingMore extends SampleListStatus {}

class SampleListEmpty extends SampleListStatus {}

class SampleListCompleted extends SampleListStatus {
  final List<SampleModel> list;

  SampleListCompleted({required this.list});
}

class SampleListError extends SampleListStatus {
  final Failure failure;
  SampleListError({
    required this.failure,
  });
}

class SampleListLoadedMoreError extends SampleListStatus {}
