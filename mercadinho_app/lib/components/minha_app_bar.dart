import 'package:flutter/material.dart';

class MinhaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MinhaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network("https://cdn-icons-png.flaticon.com/512/6680/6680292.png", width: 24, height: 24),
            ),
            SizedBox(width: 8),
            Text("Mercadinho", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        IconButton(onPressed: () => Navigator.pushNamed(context, "/gestao"), icon: Icon(Icons.settings, color: Colors.white))
      ],),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.orange,
    );
  }
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}