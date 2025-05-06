import 'package:flutter/material.dart';

class EmojiRatingBar extends StatefulWidget {
  const EmojiRatingBar({super.key});

  @override
  State<EmojiRatingBar> createState() => _EmojiRatingBarState();
}

class _EmojiRatingBarState extends State<EmojiRatingBar> {
  int _rating = 3;

  final List<IconData> _emojiIcons = [
    Icons.sentiment_very_dissatisfied,
    Icons.sentiment_dissatisfied,
    Icons.sentiment_neutral,
    Icons.sentiment_satisfied,
    Icons.sentiment_very_satisfied,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "How would you rate the app’s navigation?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_emojiIcons.length, (index) {
              final isSelected = index == _rating;
              return Icon(
                _emojiIcons[index],
                color: isSelected ? Colors.teal : Colors.grey,
                size: 30,
              );
            }),
          ),
          Slider(
            value: _rating.toDouble(),
            min: 0,
            max: 4,
            divisions: 4,
            activeColor: Colors.teal,
            onChanged: (value) {
              setState(() {
                _rating = value.round();
              });
            },
          ),
        ],
      ),
    );
  }
}