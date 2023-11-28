import 'package:flutter/material.dart';

class ClientAvatar extends StatelessWidget {
  const ClientAvatar({
    super.key,
    required this.avatarColor,
    required this.clientName,
    this.onAvatarTap,
  });

  final Color avatarColor;
  final String clientName;
  final void Function()? onAvatarTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: onAvatarTap,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: avatarColor,
              radius: 65,
              child: const Icon(
                Icons.person,
                size: 65,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              clientName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
