import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../data/models/character_model.dart';

// ignore: must_be_immutable
class CharacterTile extends StatelessWidget {
  const CharacterTile({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Hero(
              tag: character.fullName!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: character.imageUrl!,
                  height: 130,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    color: Color(0xFF2c3e50),
                  )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.fullName!,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  'Family: ${character.family}',
                  style: const TextStyle(fontSize: 15, color: Colors.black54),
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Text(
                  'Title: ${character.title}',
                  style: const TextStyle(fontSize: 15, color: Colors.black54),
                  maxLines: 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
