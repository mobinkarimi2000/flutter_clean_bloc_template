import 'package:flutter/material.dart';
import 'package:flutter_clean_bloc_template/core/widget/error_handling/error_handling_widget.dart';

class UnknownErrorWidget extends StatelessWidget
    implements ErrorHandlingWidget {
  const UnknownErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
