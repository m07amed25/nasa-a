import 'package:flutter/cupertino.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 50  ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset("assets/images/Logo.png", width: 100, height: 60, ),
          SizedBox(width: 2,),
          Image.asset("assets/images/RBITA.png", width: 100, height: 60,),
        ],
      ),
    );
  }
}
