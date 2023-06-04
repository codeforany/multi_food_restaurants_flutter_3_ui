import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class FilterRow extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final Color iconColor;
  const FilterRow({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: TColor.text, fontSize: 16, fontWeight: FontWeight.w700),
              ),
              IconButton(
                // padding: EdgeInsets.zero,
                  onPressed: onPressed,
                  icon: Icon(
                    icon,
                    size: 30,
                    color: iconColor,
                  ))
            ],
          ),
    
           const SizedBox(
            height: 4,
          ),
          const Divider(
            color: Colors.black26,
          ),
    
        ],
      
    );
  }
}
