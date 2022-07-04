import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: const [
          FractionallySizedBox(
            widthFactor: 0.4,
            heightFactor: 0.4,
            child: Opacity(
              opacity: 0.5,
              child: Image(
                image: AssetImage('assets/images/sqn_insignia.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
