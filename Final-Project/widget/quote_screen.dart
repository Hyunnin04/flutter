import 'package:flutter/material.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final List<Map<String, String>> quotes = [
    {
      'quote': 'The only way to do great work is to love what you do.',
      'author': 'Steve Jobs'
    },
    {
      'quote': 'The best time to plant a tree was 20 years ago. The second best time is now.',
      'author': 'Chinese Proverb'
    },
    {
      'quote': 'Your time is limited, don’t waste it living someone else’s life.',
      'author': 'Steve Jobs'
    },
    {
      'quote': 'Not everything that can be counted counts, and not everything that counts can be counted.',
      'author': 'Albert Einstein'
    },
    {
      'quote': 'I have not failed. I’ve just found 10,000 ways that won’t work.',
      'author': 'Thomas Edison'
    },
  ];

  int currentQuoteIndex = 0;

  void _showNextQuote() {
    setState(() {
      currentQuoteIndex = (currentQuoteIndex + 1) % quotes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuote = quotes[currentQuoteIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inspirational Quotes',
        style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 172, 191, 207),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _showNextQuote,
          child: QuoteCard(
            quote: currentQuote['quote']!,
            author: currentQuote['author']!,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 19, 50, 58),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;

  const QuoteCard({super.key, required this.quote, required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '"$quote"',
              style: const TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '- $author',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
