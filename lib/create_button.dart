import 'package:flutter/material.dart';

Expanded createButton({
  required String caracter,
  required void Function() press,
  required Color color,
  required BuildContext context,
}) {
  return Expanded(
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,
          padding: const EdgeInsets.all(20),
        ),
        onPressed: press,
        child: Text(
          caracter,
          style: TextStyle(color: color, fontSize: 30),
        ),
      ),
    ),
  );
}
