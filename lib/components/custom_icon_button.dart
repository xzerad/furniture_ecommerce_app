import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, this.onPress, required this.child}) : super(key: key);
  final Widget child;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        onPress?.call();
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12,
                offset: Offset(1, 1), blurRadius: 10),

          ]
        ),
        margin: const  EdgeInsets.all(10),
        child: child
      ),
    );
  }
}
