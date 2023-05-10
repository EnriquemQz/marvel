import 'package:flutter/material.dart';
import 'package:marvel_app/providers/character_provider.dart';
import 'package:provider/provider.dart';

class CharactersGridView extends StatelessWidget {
  const CharactersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<CharacterProvider>(builder: (context, provider, child) {
      return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scroll) {
          if (!provider.isLoading && scroll.metrics.extentAfter == 0) {
            provider.loadMoreCharacters();
            provider.isLoading = true;
          }
          return false;
        },
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 2.5, mainAxisSpacing: 2.5),
            itemCount: provider.characterList.length,
            itemBuilder: (_, i) {
              final item = provider.characterList[i];
              return GestureDetector(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(item.thumbnail.fullUrl))),
                  child: Container(
                    width: size.width,
                    color: Colors.black54,
                    child: Text(
                      item.name,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }),
      );
    });

    //
  }
}
