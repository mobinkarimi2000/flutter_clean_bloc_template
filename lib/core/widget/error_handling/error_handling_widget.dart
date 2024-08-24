import 'package:flutter/material.dart';
import 'package:flutter_clean_bloc_template/core/error_handling/failure.dart';
import 'package:flutter_clean_bloc_template/core/widget/error_handling/no_internet_connection_widget.dart';
import 'package:flutter_clean_bloc_template/core/widget/error_handling/server_error_widget.dart';
import 'package:flutter_clean_bloc_template/core/widget/error_handling/unauthorized_error_widget.dart';
import 'package:flutter_clean_bloc_template/core/widget/error_handling/unknown_error_widget.dart';

abstract class ErrorHandlingWidget extends Widget {
  factory ErrorHandlingWidget(
    Failure failure, {
    final void Function()? onClickListener,
  }) {
    switch (failure) {
      case ServerErrorFailure():
        return ServerErrorWidget(onClickListener: onClickListener);
      case UnauthorizedFailure():
        return UnauthorizedErrorWidget(onClickListener: onClickListener);
      case NoInternetConnectionFailure():
        return NoInternetConnectionErrorWidget(
            onClickListener: onClickListener);
      // case UnknownFailure(errorCode: e.errorCode,message: e.errorMessage): return UnknownErrorWidget(onClickListener: onClickListener);
      default:
        return const UnknownErrorWidget();
    }
  }
}
