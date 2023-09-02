import 'package:flutter/material.dart';
import 'package:moviebook/common/constants/languages.dart';
import 'package:moviebook/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:moviebook/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:moviebook/presentation/widgets/logo.dart';

class NavigationDrawerHome extends StatelessWidget {
  const NavigationDrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Theme.of(context).primaryColor.withOpacity(0.7),
          ),
        ],
      ),
      width: 300,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 18,
                left: 8,
                right: 8,
              ),
              child: Logo(
                height: 70,
              ),
            ),
            NavigationListItem(
              title: 'Favorite Movies',
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: 'Languages',
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: () {},
            ),
            NavigationListItem(
              title: 'Feedback',
              onPressed: () {},
            ),
            NavigationListItem(
              title: 'About',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
