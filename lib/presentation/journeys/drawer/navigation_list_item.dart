import 'package:flutter/material.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const NavigationListItem({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.8),
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const NavigationSubListItem({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.7),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
