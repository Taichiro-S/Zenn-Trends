import 'package:flutter/material.dart';
import '../../model/topic.dart';
import 'package:url_launcher/url_launcher.dart';
import '/helper/favorite.dart';

class TopicContainer extends StatelessWidget {
  final Topic topic;
  final int rank;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const TopicContainer({
    Key? key,
    required this.topic,
    required this.rank,
    required this.isSelected,
    required this.onChanged,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  _launchURL() async {
    var url = Uri.parse('https://zenn.dev/topics/${topic.name}?order=latest');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _toggleFavorite(Topic topic) {
    toggleFavorite(topic);
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
          subtitle: Column(children: [
            Row(
              children: [
                Text(
                  'Rank: $rank',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(
                  topic.currentRank < topic.previousRank
                      ? Icons.arrow_upward
                      : topic.currentRank > topic.previousRank
                          ? Icons.arrow_downward
                          : null,
                  color: topic.currentRank < topic.previousRank
                      ? Colors.green
                      : topic.currentRank > topic.previousRank
                          ? Colors.red
                          : Colors.grey,
                ),
                topic.currentRank != topic.previousRank
                    ? Text(
                        topic.currentRank < topic.previousRank
                            ? '+${topic.previousRank - topic.currentRank}'
                            : '${topic.previousRank - topic.currentRank}',
                        style: TextStyle(
                          fontSize: 16,
                          color: topic.currentRank != topic.previousRank
                              ? topic.currentRank < topic.previousRank
                                  ? Colors.green
                                  : Colors.red
                              : Colors.grey,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.local_offer,
                  color: Colors.grey,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Text(
                  '${topic.currentCount}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 5),
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
          ]),
          // trailing:
          // IconButton(
          //   icon: Icon(
          //     isFavorite ? Icons.star : Icons.star_border,
          //   ),
          //   onPressed: onFavoriteToggle,
          // ),
          //     Checkbox(
          //   value: isSelected,
          //   onChanged: onChanged,
          // ),
        ));
  }
}
