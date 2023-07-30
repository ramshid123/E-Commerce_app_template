import 'package:e_commerce_ux/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class HomeState {
  var isDraggedUp = false.obs;
  final pageController = PageController(viewportFraction: 0.87);

  var tapX = 0.0;
  var tapY = 0.0;

  SMITrigger? trigger;

  RxList<ProductModel> groceryItems = [
    ProductModel(
      name: 'Apples',
      price: 2.99,
      tag: 'item_0',
      description: 'Fresh and juicy apples',
      imageUrl:
          'https://th.bing.com/th/id/R.9c4d8dc9fb6e499ae567a455c6d9abcc?rik=xJzuU5VsKl%2bN8w&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2ftransparent-apple%2ftransparent-apple-21.png&ehk=0LDP56MKEPdTs%2bGgu%2fBTfq2yqFWK9CympqcCzj7GOs4%3d&risl=&pid=ImgRaw&r=0',
      quantity: '1 kg',
    ),
    ProductModel(
      name: 'Bananas',
      price: 1.49,
      tag: 'item_1',
      description: 'Ripe and delicious bananas',
      imageUrl:
          'https://th.bing.com/th/id/R.0740f0a8313ff90ffc79395cc0256c80?rik=bS1d%2bQ3FnSwYvg&riu=http%3a%2f%2fwww.pngplay.com%2fwp-content%2fuploads%2f1%2fBanana-PNG-Free-Commercial-Use-Image.png&ehk=WA%2fnN1ho2Ol9rj%2bA7IN7Rs%2b8Guyg61423LfgySHlsJ4%3d&risl=&pid=ImgRaw&r=0',
      quantity: '1 bunch',
    ),
    ProductModel(
      name: 'Milk',
      price: 3.25,
      tag: 'item_2',
      description: 'Fresh milk from the farm',
      imageUrl:
          'https://purepng.com/public/uploads/large/purepng.com-milkmilkliquidnutritioncow-14115279570641c5j7.png',
      quantity: '1 liter',
    ),
    ProductModel(
      name: 'Bread',
      price: 2.0,
      tag: 'item_3',
      description: 'Whole grain bread',
      imageUrl:
          'https://purepng.com/public/uploads/large/purepng.com-breadfood-bread-941524621326bhrz7.png',
      quantity: '1 loaf',
    ),
    ProductModel(
      name: 'Eggs',
      price: 2.75,
      tag: 'item_4',
      description: 'Organic eggs from free-range chickens',
      imageUrl:
          'https://purepng.com/public/uploads/large/three-white-eggs-uqs.png',
      quantity: '1 dozen',
    ),
    ProductModel(
      name: 'Carrots',
      price: 1.75,
      tag: 'item_5',
      description: 'Fresh carrots packed with nutrients',
      imageUrl:
          'https://purepng.com/public/uploads/large/purepng.com-carrotcarrot-root-vegetable-941524708291hpkcr.png',
      quantity: '500g',
    ),
    ProductModel(
      name: 'Chicken',
      price: 7.99,
      tag: 'item_6',
      description: 'Lean chicken breast',
      imageUrl:
          'https://th.bing.com/th/id/R.0f5d3760d3c650e204c3fbf331868367?rik=VNBLp%2fenElkYgw&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f1%2fChicken-Meat.png&ehk=kvyDh92KPT8CvgaVyUUt%2b7F0lgB8s9NwfCf5XJnHmx0%3d&risl=&pid=ImgRaw&r=0',
      quantity: '1 kg',
    ),
    ProductModel(
      name: 'Rice',
      price: 4.5,
      tag: 'item_7',
      description: 'Long-grain white rice',
      imageUrl:
          'https://www.pngkit.com/png/full/837-8379956_rice-free-download-png-long-grain-rice-png.png',
      quantity: '1 kg',
    ),
    ProductModel(
      name: 'Tomatoes',
      price: 2.25,
      tag: 'item_8',
      description: 'Fresh and ripe tomatoes',
      imageUrl:
          'https://purepng.com/public/uploads/large/purepng.com-tomatovegetables-tomato-941524712357ikhy3.png',
      quantity: '750g',
    ),
    ProductModel(
      name: 'Cheese',
      price: 5.99,
      tag: 'item_9',
      description: 'Cheddar cheese',
      imageUrl:
          'https://purepng.com/public/uploads/large/purepng.com-cheesefood-cheese-941524637143bvqoy.png',
      quantity: '250g',
    ),
  ].obs;
}
