import 'package:ebooks/simple%20screen%20using%20models/model/news.dart';
import 'package:flutter/material.dart';

final List<News> newsList = [
    News(name: 'The Morning After: Robot dog maker Boston Dynamics has a new owner', pName: "Engadget", imageUrl: "https://www.shutterstock.com/image-photo/visual-contents-concept-social-networking-260nw-1896527446.jpg"),
    News(name: "Gillmor Gang: Who Knew", pName: "TechCrunch", imageUrl: "https://s.abcnews.com/images/International/World_4x3_608.jpg"),
    News(name: "Transmit Security raise \$543M Series A to kill off the password", pName: "TechCrunch", imageUrl: "https://s39569.pcdn.co/wp-content/uploads/2023/07/digital-fingerprint-on-black-screen.jpg"),
    News(name: "Peloton's New Tread+ Prroblem Is a Reminder That You Don't Really Own Your Connected Gadgets", pName: "Gizmodo.com", imageUrl: "https://about.fb.com/wp-content/uploads/2023/09/GettyImages-686732223.jpg"),
    News(name: "Business Updates: Google Draws E.U. Antitrust Inquiry", pName: "New York Times", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7x4p6NLbNFxUg8bfrKeWL9yMoJQRHaeT79w&usqp=CAU"),
    News(name: "Prime members can save over \$200 on the Apple iPad Pro", pName: "Mashable", imageUrl: "https://imageio.forbes.com/specials-images/imageserve/63dcb722c706baecc89afec2/Watching-Netflix-On-iPad/960x0.jpg?format=jpg&width=960"),
    News(name: "This Apple Watch Series 6 is on sale at Walmart for only \$279(!) this Prime Day", pName: "Mashable", imageUrl: "https://c.ndtvimg.com/2023-01/rlqf7btg_apple-watch-sensor-can-accurately-predict-stress-levels-of-users_625x300_01_January_23.jpg"),
    News(name: "The Apple Watch Series 6 is on sale for \$50 off this Prime Day", pName: "Mashable", imageUrl: "https://imgk.timesnownews.com/story/1568288677-Apple_Watch_Series_3.jpg?tr=w-400,h-300,fo-auto"),
  ];

class NewsProvider extends ChangeNotifier{
  final List<News> _news = newsList;
  List<News> get newsL => _news;

  final List<News> _wishList = [];
  List<News> get wishList_news => _wishList;

  void addToWishList(News selectedNews) {
    _wishList.add(selectedNews);
    print(_wishList);
    notifyListeners();
  }

  void removeFromWishList(News selectedNews){
    _wishList.remove(selectedNews);
    print(_wishList);
    notifyListeners();
  }
} 