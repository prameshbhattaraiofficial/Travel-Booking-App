import 'package:flutter/material.dart';
class CostumIconButton extends StatelessWidget {
  final String text;
  final IconData icons;
  final VoidCallback onTap;
  final Color color;
  const CostumIconButton(
      {Key? key,
        required this.text,
        required this.onTap,
        required this.color,
        required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 50,
      minWidth: double.infinity,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons,
            size: 20,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
