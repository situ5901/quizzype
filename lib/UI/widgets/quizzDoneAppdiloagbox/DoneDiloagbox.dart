import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoneDialog extends StatefulWidget {
  final int score; // Score to display
  final VoidCallback onTap;

  const DoneDialog({
    Key? key,
    required this.score,
    required this.onTap,
  }) : super(key: key);

  @override
  _DoneDialogState createState() => _DoneDialogState();
}

class _DoneDialogState extends State<DoneDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Duration for the blinking effect
    )..repeat(reverse: true); // Repeat the animation in reverse

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        ),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    'Your Result',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'You have scored: ${widget.score}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: widget.onTap,
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
