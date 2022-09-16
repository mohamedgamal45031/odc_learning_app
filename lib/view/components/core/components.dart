import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  String? label,
  int? minLines,
  String? initialValue,
  IconData? prefixIcon,
  IconData? suffixIcon,
  onSubmit,
  onChange,
  InputDecoration? decoration,
  onTap,
  // required validator,
  function,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      minLines: minLines?? 1,
      maxLines: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return "Can't be empty";
        } else if (value.length < 8) {
          return "Can't be less than 8";
        }
      },
      initialValue: initialValue,
      obscureText: isPassword,
      cursorColor: Color.fromARGB(255, 255, 102, 0),
      decoration: (decoration != null)
          ? decoration
          : InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 102, 0), width: 1.5),
            borderRadius: BorderRadius.circular(20)),
        labelText: label,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(
            suffixIcon,
          ),
          onPressed: function,
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );

InputDecoration decoration(
    {
      required String label,
      required BuildContext context,
      required Color color,
      required int borders
    }) {
  return InputDecoration(
    labelText: label,
    focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: Color.fromARGB(255, 255, 102, 0), width: 1.5),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MediaQuery.of(context).size.width / 20),
            bottomRight:
            Radius.circular(MediaQuery.of(context).size.width / 20))),
    focusColor: Color.fromARGB(255, 255, 102, 0),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: color),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MediaQuery.of(context).size.width / 20),
          bottomRight: Radius.circular(MediaQuery.of(context).size.width / 20),
          topRight:(borders == 1)? Radius.circular(MediaQuery.of(context).size.width / 20) : Radius.circular(5),
          bottomLeft:(borders == 1)? Radius.circular(MediaQuery.of(context).size.width / 20) : Radius.circular(5),
        )),
  );
}
Widget getSizedBox(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 50,
  );
}



InputDecoration customDecoration({
  required String label,
  required BuildContext context,
  required Color color,
  required int borders,
  IconData? prefixIcon
}){
  return InputDecoration(
    labelText: label,
    prefixIcon: Padding(
      padding: const EdgeInsetsDirectional.only(start: 12.0),
      child: Icon(prefixIcon), // myIcon is a 48px-wide widget.
    ),
    focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: Color.fromARGB(255, 255, 102, 0), width: 1.5),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MediaQuery.of(context).size.width / 20),
            bottomRight:
            Radius.circular(MediaQuery.of(context).size.width / 20))),
    focusColor: Color.fromARGB(255, 255, 102, 0),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: color),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MediaQuery.of(context).size.width / 20),
          bottomRight: Radius.circular(MediaQuery.of(context).size.width / 20),
          topRight:(borders == 1)? Radius.circular(MediaQuery.of(context).size.width / 20) : Radius.circular(5),
          bottomLeft:(borders == 1)? Radius.circular(MediaQuery.of(context).size.width / 20) : Radius.circular(5),
        )),
  );
}