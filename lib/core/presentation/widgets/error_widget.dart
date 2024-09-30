import 'package:flutter/material.dart';

///Class used tu ilistrate an global error
class GlobalErrorWidget extends StatelessWidget {
  ///Creates an intance of [GlobalErrorWidget]
  const GlobalErrorWidget({
    super.key,
    required this.title,
    this.onPressed
  });


  ///Property used to title
  final String title;

  ///Property used to press buttom
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 30),
          Text(title,
           textAlign: TextAlign.center,
           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
           Container( margin: const EdgeInsets.only(top: 12),width: double.infinity,child: ElevatedButton(onPressed: () =>onPressed?.call(), child: const Text('Retry')))
        ],
      ),
    );
}
