import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Or continue with',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialButton(
              icon: FontAwesomeIcons.google,
              color: Colors.red,
              onPressed: () {
                // TODO: Implement Google Login
              },
            ),
            const SizedBox(width: 20),
            _SocialButton(
              icon: FontAwesomeIcons.facebookF,
              color: const Color(0xFF1877F2),
              onPressed: () {
                // TODO: Implement Facebook Login
              },
            ),
            if (Platform.isIOS) ...[
              const SizedBox(width: 20),
              _SocialButton(
                icon: FontAwesomeIcons.apple,
                color: Colors.black,
                onPressed: () {
                  // TODO: Implement Apple Login
                },
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: FaIcon(icon, color: color, size: 24),
      ),
    );
  }
}
