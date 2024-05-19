import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../models/slider_model.dart';
import '../services/news.dart';
import '../services/slider_data.dart';
import 'article_view.dart';

class AllNews extends StatefulWidget {

  String? news;
  AllNews({required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {

  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];

  void initState() {
    getSlider();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {

    });

  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSliders();
    sliders = slider.sliders;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.news!+" News",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            itemCount: widget.news=="Breaking"? sliders.length: articles.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return AllNewsSection(
                Image: widget.news=="Breaking"? sliders[index].urlToImage!: articles[index].urlToImage!,
                desc: widget.news=="Breaking"? sliders[index].description!: articles[index].description!,
                title: widget.news=="Breaking"? sliders[index].title!: articles[index].title!,
                url: widget.news=="Breaking"? sliders[index].url!: articles[index].url!,
              );
            }),
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {
  String Image, desc, title, url;
  AllNewsSection({required this.Image, required this.desc, required this.title, required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: Image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10,),
            Text(title, maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Text(desc, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45),),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}


