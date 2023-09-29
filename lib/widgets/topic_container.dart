import 'package:flutter/material.dart';
import '/models/topic.dart';
import 'package:url_launcher/url_launcher.dart';

class TopicContainer extends StatelessWidget {
  final Topic topic;
  final int rank;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const TopicContainer({
    Key? key,
    required this.topic,
    required this.rank,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  _launchURL() async {
    var url = Uri.parse('https://zenn.dev/topics/${topic.name}?order=latest');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white70,
          backgroundImage: topic.imageUrl != null
              ? NetworkImage(topic.imageUrl!)
              : const AssetImage('assets/images/no_image.png')
                  as ImageProvider<Object>,
          radius: 25,
        ),
        title: GestureDetector(
          onTap: _launchURL,
          child: Text(
            topic.displayName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              '${topic.currentCount}',
              style: const TextStyle(fontSize: 16),
            ),
            Icon(
              topic.currentCount - topic.previousCount > 0
                  ? Icons.arrow_upward
                  : topic.currentCount - topic.previousCount < 0
                      ? Icons.arrow_downward
                      : Icons.arrow_right_alt,
              color: topic.currentCount - topic.previousCount > 0
                  ? Colors.green
                  : topic.currentCount - topic.previousCount < 0
                      ? Colors.red
                      : Colors.grey,
            ),
            topic.currentCount - topic.previousCount != 0
                ? Text(
                    topic.currentCount - topic.previousCount > 0
                        ? '+${topic.currentCount - topic.previousCount}'
                        : '${topic.currentCount - topic.previousCount}',
                    style: TextStyle(
                      fontSize: 16,
                      color: topic.currentCount - topic.previousCount != 0
                          ? topic.currentCount - topic.previousCount > 0
                              ? Colors.green
                              : Colors.red
                          : Colors.grey,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        // subtitle: Row(
        //   children: [
        //     Text(
        //       'Rank: $rank',
        //       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //     ),
        //     Icon(
        //       rank < topic.previousRank
        //           ? Icons.arrow_upward
        //           : rank > topic.previousRank
        //               ? Icons.arrow_downward
        //               : Icons.horizontal_rule,
        //       color: rank < topic.previousRank
        //           ? Colors.green
        //           : rank > topic.previousRank
        //               ? Colors.red
        //               : Colors.grey,
        //     ),
        //     Text(
        //       topic.previousRank != null ? '(${topic.previousRank})' : '(N/A)',
        //       style: const TextStyle(fontSize: 16),
        //     ),
        //   ],
        // ),
        trailing: Checkbox(
          value: isSelected,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
