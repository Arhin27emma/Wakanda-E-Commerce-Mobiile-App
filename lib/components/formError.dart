// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  const FormError({
      Key? key,
     required this.error,
    }
  ): super(key: key);

  final List<String> error;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        error.length, (index) => FormErrorText(error: error[index])
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row FormErrorText({required String error}) {
    return Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
          Text(error)
        ],
      );
  }
}
