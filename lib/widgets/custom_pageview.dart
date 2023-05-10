import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marvel_app/screens/screens.dart';
import 'package:marvel_app/utils/utils.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final _controller = PageController(
    viewportFraction: 0.6
  );
  double _currentPage = 0.0;

  void _listener(){
    setState(() {
      _currentPage = _controller.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double opty;
    final images = ImageList().images;

    pageImages( double opty, int i){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 18.0),
      child: GestureDetector(
        onTap: (){
          if(i == 0) Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const CharactesScreen()));
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            image: DecorationImage(
              image: NetworkImage(images[i]['url'].toString()),
              fit: BoxFit.fill,
              opacity: opty
            )
          ),
          child:  Container(
            width: double.infinity,
            color: Colors.black,
            child: Text(
              images[i]['name'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25.0
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0),
        child: SizedBox(
          child: PageView.builder(
            controller: _controller,
            itemCount: images.length,
            itemBuilder: (_,i){
              if(i == _currentPage){
                opty = 1;
                return Transform.scale(
                  scale: 1.3,
                  child: pageImages(opty, i),
                );
              } else if(i < _currentPage){
                opty = max(1 - (_currentPage - i), 0.5);
                return Transform.scale(
                  scale: max(1.3 - (_currentPage - i), 0.8),
                  child: pageImages(opty, i),
                );
              } else {
                opty = max(1 - (i - _currentPage), 0.5);
                return Transform.scale(
                  scale: max(1.3 - (i - _currentPage), 0.8),
                  child: pageImages(opty, i)
                );
              }
            },
          ),
        ),
      ),
    );
  }

  
}
