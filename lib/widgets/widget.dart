import 'package:flutter/material.dart';
import 'package:gallery/model/wallpaper_model.dart';

Widget BrandName(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
      Text('Wallpaper', style: TextStyle(color: Colors.black87),),
      Text('Hub', style: TextStyle(color: Colors.blue),)
    ]
  );
}

Widget WallpapersList(List<WallpaperModel> wallpapers, context){
  return Container(
  child:GridView.count(
  crossAxisCount:2,
  childAspectRatio: 0.6,
  mainAxisSpacing: 6.0,
    crossAxisSpacing: 6.0,
    children: wallpapers.map((wallpapers){
      return GridTile(child: Container(
        child: Image.network(wallpapers.src.portrait),
      ),
      );

    }).toList(),
  ),
  );
}