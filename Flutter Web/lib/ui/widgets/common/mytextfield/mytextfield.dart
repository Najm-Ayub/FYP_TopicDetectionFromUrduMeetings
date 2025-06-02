import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'mytextfield_model.dart';

class Mytextfield extends StackedView<MytextfieldModel> {
  final TextEditingController? ctrl;
  final String? title;
  final Widget? suffix;
  final bool? obscureText;
  final int? maxlines;
  final bool? maxcond;
  final Widget? prefix;
  final double? value;
  final double textfiledwidth;

  final FormFieldValidator<String>? validator;

  const Mytextfield(
      {Key? key,
      this.title,
      this.ctrl,
      this.suffix,
      this.obscureText,
      this.maxcond,
      this.maxlines,
      this.validator,
      this.value,
      required this.textfiledwidth,
      this.prefix})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MytextfieldModel viewModel,
    Widget? child,
  ) {
    return SizedBox(
      width: textfiledwidth,
      child: TextFormField(
        // maxcond != null && maxcond! ? maxlines : 1,
        maxLines: maxcond != null && maxcond! ? maxlines : 1,
        controller: ctrl,
        // expands: false,

        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            hintText: title,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(value!)),
            ),
            hintStyle: const TextStyle(
              fontSize: 14,
            ),
            suffixIcon: suffix,
            prefixIcon: prefix),
        validator: validator,
      ),
    );
  }

  @override
  MytextfieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      MytextfieldModel();
}
