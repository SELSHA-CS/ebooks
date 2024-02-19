import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebooks/simple%20screen%20using%20models/provider/newsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WishList"),
      ),
      body: Consumer(
        builder: (BuildContext context, NewsProvider newsProvider, Widget? child) { 
          return ListView.builder(
            itemCount: newsProvider.wishList_news.length,
            itemBuilder: (context, index){
              var selectedNews = newsProvider.wishList_news[index];
              return ListTile(
                leading: CachedNetworkImage(
                  imageUrl: newsProvider.wishList_news[index].imageUrl,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
                title: Text(newsProvider.wishList_news[index].name, style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                subtitle: Text(newsProvider.wishList_news[index].pName, style: TextStyle(
                  color: Colors.grey,
                ),),
                trailing: IconButton(
                  onPressed: (){
                    if(!newsProvider.wishList_news.contains(selectedNews)){
                      newsProvider.addToWishList(selectedNews);
                    }
                    else{
                      newsProvider.removeFromWishList(selectedNews);
                    }
                  }, 
                  icon: Icon(
                    Icons.favorite, color: newsProvider.wishList_news.contains(selectedNews) ? Colors.red : Colors.grey,
                  )
                ),
              );
            }
          );
        },
      ),
    );
  }
}