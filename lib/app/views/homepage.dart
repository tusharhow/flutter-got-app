import 'package:flutter/material.dart';
import 'package:flutter_got_app/app/components/character_card.dart';
import 'package:flutter_got_app/app/data/models/character_model.dart';
import 'package:provider/provider.dart';

import '../controllers/character_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CharacterController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('GOT Characters'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurple,
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.characters.length,
                    itemBuilder: (context, index) {
                      final character = controller.characters[index];
                      return CharacterTile(character: character);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
