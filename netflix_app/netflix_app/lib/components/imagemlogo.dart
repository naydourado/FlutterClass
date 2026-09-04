import 'package:flutter/material.dart';

//retorna apenas o que foi definido no componente
class ImagemLogo extends StatelessWidget {
  const ImagemLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8vm8ydWcD2yUZFYrTG-w6sVSQA7qBxkHVORgemxv5HO9ZWk44JpRYx8U&s=10", width: 100);
  }
}