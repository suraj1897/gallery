import 'package:flutter/material.dart';
import 'package:gallery/data/data.dart';
import 'package:gallery/model/wallpaper_model.dart';
import 'package:gallery/widgets/widget.dart';
import 'package:gallery/model/categories_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];

  getTrendingWallpaper() async {
    // await http.get("https://www.pexels.com/api/documentation/#photos-curated",
    //     headers: {"Authorization": apiKEY}).then((value) {
    //   //print(value.body);
      final url = Uri.parse('https://api.pexels.com/v1/curated?per_page=15');
      final headers = {
        'Authorization': '9QdJwiF0C4iOOy33GMkTSU8AH5SEwIRXt7pPMXrjuWXvmrlVbVBTOEa5',
      };

      try {
        final response = await http.get(url, headers: headers);
        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          // Handle the retrieved data here
          // print(responseData.toString());
          // print('ghcjhgckhvlhv');

          Map<String, dynamic>jsonData = jsonDecode(response.body);
          jsonData['photos'].forEach((element){
          print(element);
          WallpaperModel wallpaperModel = WallpaperModel();
          wallpaperModel = WallpaperModel.fromMap(element);
          wallpapers.add(wallpaperModel);
          // print('GOT IT');
          });
        } else {
          print('Request failed with status: ${response.statusCode}.');
        }
      } catch (e) {
        print('Error: $e');
      }
      setState(() {

      });
    }


  @override
  void initState() {
    categories = getCategories();
    getTrendingWallpaper();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        // centerTitle: true,
        // leading: Icon(Icons.back_hand),
        title: BrandName(),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none
                ),
                )
                ),
                Icon(Icons.search)
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoriesTile(
                  title: categories[index].categorieName!,
                  imgUrl: categories[index].imgUrl!,
                );
              },
            ),
          )

        ],
      ),
    );
  }
}


class CategoriesTile extends StatelessWidget {
  final String imgUrl;
  final String title;

  CategoriesTile({required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imgUrl, height: 50, width: 100, fit: BoxFit.cover,),
          ),
          Container(
            alignment: Alignment.center,
            height: 50, width: 100,
            // padding: EdgeInsets.all(0),
            // color: Colors.black.withOpacity(0.5),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
