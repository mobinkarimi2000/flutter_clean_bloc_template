import 'package:flutter/material.dart';
import 'package:flutter_clean_bloc_template/core/widget/error_handling/error_handling_widget.dart';

class UnauthorizedErrorWidget extends StatelessWidget
    implements ErrorHandlingWidget {
  const UnauthorizedErrorWidget({super.key, this.color, this.onClickListener});
  final Color? color;
  final void Function()? onClickListener;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height - 120,
    );
  }
}
