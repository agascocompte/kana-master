import 'package:flutter/material.dart';

class HiraganaDialog extends StatelessWidget {
  final String romaji;

  const HiraganaDialog({super.key, required this.romaji});

  @override
  Widget build(BuildContext context) {
    _evictImage();
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/gifs/hiragana/$romaji.gif',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(romaji, style: const TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }

  void _evictImage() {
    final AssetImage provider = AssetImage('assets/gifs/hiragana/$romaji.gif');
    provider.evict().then((bool success) {
      if (success) debugPrint('Removed image from cache');
    });
  }
}
