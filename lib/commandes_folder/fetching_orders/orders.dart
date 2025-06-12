// import '../catalog_Products/Productss_model_list.dart';

import '../cart_folder/cart_controller.dart';
import 'package:get/get.dart';

class Products {
  final String photo;
  final String nameProducts;
  final double price;

  const Products({
    required this.photo,
    required this.nameProducts,
    required this.price,
  });

  static const List<Products> produits = [
    //0
    Products(
        photo: 'assets/images/chemisemc.png',
        nameProducts: 'Chemise manches courtes',
        price: 700),

    //1
    Products(
      photo: 'assets/images/chemiseml.png',
      nameProducts: 'Chemise manches longues',
      price: 800,
    ),

    //2
    Products(
      photo: 'assets/images/chemiseblancheml.png',
      nameProducts: 'Chemise blanche',
      price: 1000,
    ),

    //3
    Products(
      photo: 'assets/images/polo.png',
      nameProducts: 'Polo',
      price: 700,
    ),

    //4
    Products(
      photo: 'assets/images/tshirt.png',
      nameProducts: 'Tee-Shirt',
      price: 600,
    ),

    //5
    Products(
      photo: 'assets/images/souscorps.png',
      nameProducts: 'Sous-corps',
      price: 500,
    ),

    //6
    Products(
      photo: 'assets/images/pantalon.png',
      nameProducts: 'Pantalon',
      price: 800,
    ),

    //7
    Products(
      photo: 'assets/images/jeans.png',
      nameProducts: 'Jeans',
      price: 1000,
    ),

    //8
    Products(
      photo: 'assets/images/culotte.png',
      nameProducts: 'Culotte',
      price: 800,
    ),

    //9
    Products(
      photo: 'assets/images/tenuetravail.png',
      nameProducts: 'Tenue de trvail simple',
      price: 700,
    ),

    //10
    Products(
      photo: 'assets/images/tenuetravailc.png',
      nameProducts: 'Tenue de travail complet',
      price: 1000,
    ),

    //11
    Products(
      photo: 'assets/images/boubouhomme.png',
      nameProducts: 'Boubou homme simple',
      price: 1000,
    ),

    //12
    Products(
      photo: 'assets/images/boubouhommec.png',
      nameProducts: 'Boubou homme complet',
      price: 1500,
    ),

    //13
    Products(
      photo: 'assets/images/bouboufemme.png',
      nameProducts: 'Boubou femme',
      price: 2000,
    ),

    //14
    Products(
      photo: 'assets/images/robecourte.png',
      nameProducts: 'Robe courte',
      price: 1000,
    ),

    //15
    Products(
      photo: 'assets/images/robelongue.png',
      nameProducts: 'Robe longue',
      price: 1800,
    ),

    //Vetement express _____________________________________________________________
    //16
    Products(
        photo: 'assets/images/chemisemc.png',
        nameProducts: '(express) Chemise manches courtes',
        price: 1400),

    //17
    Products(
      photo: 'assets/images/chemiseml.png',
      nameProducts: '(express) Chemise manches longues',
      price: 1600,
    ),

    //18
    Products(
      photo: 'assets/images/chemiseblancheml.png',
      nameProducts: '(express) Chemise blanche',
      price: 2000,
    ),

    //19
    Products(
      photo: 'assets/images/polo.png',
      nameProducts: '(express) Polo',
      price: 1400,
    ),

    //20
    Products(
      photo: 'assets/images/tshirt.png',
      nameProducts: '(express) Tee-Shirt',
      price: 1200,
    ),

    //21
    Products(
      photo: 'assets/images/souscorps.png',
      nameProducts: '(express) Sous-corps',
      price: 1000,
    ),

    //22
    Products(
      photo: 'assets/images/pantalon.png',
      nameProducts: '(express) Pantalon',
      price: 1600,
    ),

    //23
    Products(
      photo: 'assets/images/jeans.png',
      nameProducts: '(express) Jeans',
      price: 2000,
    ),

    //24
    Products(
      photo: 'assets/images/culotte.png',
      nameProducts: '(express) Culotte',
      price: 1600,
    ),

    //25
    Products(
      photo: 'assets/images/tenuetravail.png',
      nameProducts: '(express) Tenue de trvail simple',
      price: 1400,
    ),

    //26
    Products(
      photo: 'assets/images/tenuetravailc.png',
      nameProducts: '(express) Tenue de travail complet',
      price: 2000,
    ),

    //27
    Products(
      photo: 'assets/images/boubouhomme.png',
      nameProducts: '(express) Boubou homme simple',
      price: 2000,
    ),

    //28
    Products(
      photo: 'assets/images/boubouhommec.png',
      nameProducts: '(express) Boubou homme complet',
      price: 3000,
    ),

    //29
    Products(
      photo: 'assets/images/bouboufemme.png',
      nameProducts: '(express) Boubou femme',
      price: 4000,
    ),

    //30
    Products(
      photo: 'assets/images/robecourte.png',
      nameProducts: '(express) Robe courte',
      price: 2000,
    ),

    //31
    Products(
      photo: 'assets/images/robelongue.png',
      nameProducts: '(express) Robe longue',
      price: 3600,
    ),

    //32  Spécial ______________________________________________________________________________
    Products(
        photo: 'assets/images/robedemariagev.png',
        nameProducts: 'Robe de mariée',
        price: 2000),

    //33  Spécial express
    Products(
        photo: 'assets/images/robedemariagev.png',
        nameProducts: '(express) Robe de mariée',
        price: 4000),

    //34  Accessoires ______________________________________________________________
    Products(
        photo: 'assets/images/chapeau.png',
        nameProducts: 'Chapeau',
        price: 1000),

    //35
    Products(
        photo: 'assets/images/cravatte.png',
        nameProducts: 'Cravatte',
        price: 500),

    //36
    Products(
        photo: 'assets/images/chaussure.png',
        nameProducts: 'Chaussures',
        price: 1000),

    //37
    Products(
        photo: 'assets/images/gants.png', nameProducts: 'Gants', price: 700),

    //38
    Products(
        photo: 'assets/images/chaussettes.png',
        nameProducts: 'Chaussettes',
        price: 600),

    //39  Accessoires express ______________________________________________________________
    Products(
        photo: 'assets/images/chapeau.png',
        nameProducts: '(express) Chapeau',
        price: 2000),

    //40
    Products(
        photo: 'assets/images/cravatte.png',
        nameProducts: '(express) Cravatte',
        price: 1000),

    //41
    Products(
        photo: 'assets/images/chaussure.png',
        nameProducts: '(express) Chaussures',
        price: 2000),

    //42
    Products(
        photo: 'assets/images/gants.png',
        nameProducts: '(express) Gants',
        price: 1400),

    //43
    Products(
        photo: 'assets/images/chaussettes.png',
        nameProducts: '(express) Chaussettes',
        price: 1200),

    //44  Bain ______________________________________________________________
    Products(
        photo: 'assets/images/serviettepetite.png',
        nameProducts: 'Petite serviette',
        price: 1400),

    //45
    Products(
        photo: 'assets/images/serviettemoyenne.png',
        nameProducts: 'Serviette moyenne',
        price: 2000),

    //46
    Products(
        photo: 'assets/images/serviettegrande.png',
        nameProducts: 'Grande serviette',
        price: 3000),

    //47  Bain Express ______________________________________________________________
    Products(
        photo: 'assets/images/serviettepetite.png',
        nameProducts: '(express) Petite serviette',
        price: 1400),

    //48
    Products(
        photo: 'assets/images/serviettemoyenne.png',
        nameProducts: '(express) Serviette moyenne',
        price: 2000),

    //49
    Products(
        photo: 'assets/images/serviettegrande.png',
        nameProducts: '(express) Grande serviette',
        price: 3000),

    //50  Litérie ______________________________________________________________
    Products(
        photo: 'assets/images/drap1.png',
        nameProducts: 'Drap une place',
        price: 1000),

    //51
    Products(
        photo: 'assets/images/drap2.png',
        nameProducts: 'Drap deux places',
        price: 2000),

    //52
    Products(
        photo: 'assets/images/drap3.png',
        nameProducts: 'Drap trois places',
        price: 2500),

    //53
    Products(
        photo: 'assets/images/oreiller.png',
        nameProducts: 'Oreiller',
        price: 1000),

    //54
    Products(
        photo: 'assets/images/couette1.png',
        nameProducts: 'Couette une place et demi',
        price: 3000),

    //55
    Products(
        photo: 'assets/images/couette2.png',
        nameProducts: 'Couette deux places',
        price: 5000),

    //56
    Products(
        photo: 'assets/images/couette3.png',
        nameProducts: 'Couette trois places',
        price: 8000),

    //57  Litérie express ______________________________________________________________
    Products(
        photo: 'assets/images/drap1.png',
        nameProducts: '(express) Drap une place',
        price: 2000),

    //58
    Products(
        photo: 'assets/images/drap2.png',
        nameProducts: '(express) Drap deux places',
        price: 4000),

    //59
    Products(
        photo: 'assets/images/drap3.png',
        nameProducts: '(express) Drap trois places',
        price: 5000),

    //60
    Products(
        photo: 'assets/images/oreiller.png',
        nameProducts: '(express) Oreiller',
        price: 2000),

    //31
    Products(
        photo: 'assets/images/couette1.png',
        nameProducts: '(express) Couette une place et demi',
        price: 6000),

    //62
    Products(
        photo: 'assets/images/couette2.png',
        nameProducts: '(express) Couette deux places',
        price: 10000),

    //63
    Products(
        photo: 'assets/images/couette3.png',
        nameProducts: '(express) Couette trois places',
        price: 16000),

    //64  Autre ______________________________________________________________
    Products(
        photo: 'assets/images/tapis.png',
        nameProducts: 'Tapis (en mètre carré)',
        price: 1000),

    //65
    Products(
        photo: 'assets/images/moquette.png',
        nameProducts: 'Moquette (en mètre carré)',
        price: 1000),

    //66
    Products(
        photo: 'assets/images/rideau.png',
        nameProducts: 'Rideau (en mètre carré)',
        price: 1000),

    //67  Autre express ______________________________________________________________
    Products(
        photo: 'assets/images/tapis.png',
        nameProducts: '(express) Tapis (en mètre carré)',
        price: 2000),

    //68
    Products(
        photo: 'assets/images/moquette.png',
        nameProducts: '(express) Moquette (en mètre carré)',
        price: 2000),

    //69
    Products(
        photo: 'assets/images/rideau.png',
        nameProducts: '(express) Rideau (en mètre carré)',
        price: 2000),

    //super express ________________________________________________________________________________________
    //clothes
    //70
    Products(
        photo: 'assets/images/chemisemc.png',
        nameProducts: '(super express) Chemise manches courtes',
        price: 1400),

    //71
    Products(
      photo: 'assets/images/chemiseml.png',
      nameProducts: '(super express) Chemise manches longues',
      price: 1600,
    ),

    //72
    Products(
      photo: 'assets/images/chemiseblancheml.png',
      nameProducts: '(super express) Chemise blanche',
      price: 2000,
    ),

    //73
    Products(
      photo: 'assets/images/polo.png',
      nameProducts: '(super express) Polo',
      price: 1400,
    ),

    //74
    Products(
      photo: 'assets/images/tshirt.png',
      nameProducts: '(super express) Tee-Shirt',
      price: 1200,
    ),

    //75
    Products(
      photo: 'assets/images/souscorps.png',
      nameProducts: '(super express) Sous-corps',
      price: 1000,
    ),

    //76
    Products(
      photo: 'assets/images/pantalon.png',
      nameProducts: '(super express) Pantalon',
      price: 1600,
    ),

    //77
    Products(
      photo: 'assets/images/jeans.png',
      nameProducts: '(super express) Jeans',
      price: 2000,
    ),

    //78
    Products(
      photo: 'assets/images/culotte.png',
      nameProducts: '(super express) Culotte',
      price: 1600,
    ),

    //79
    Products(
      photo: 'assets/images/tenuetravail.png',
      nameProducts: '(super express) Tenue de trvail simple',
      price: 1400,
    ),

    //80
    Products(
      photo: 'assets/images/tenuetravailc.png',
      nameProducts: '(super express) Tenue de travail complet',
      price: 2000,
    ),

    //81
    Products(
      photo: 'assets/images/boubouhomme.png',
      nameProducts: '(super express) Boubou homme simple',
      price: 2000,
    ),

    //82
    Products(
      photo: 'assets/images/boubouhommec.png',
      nameProducts: '(super express) Boubou homme complet',
      price: 3000,
    ),

    //83
    Products(
      photo: 'assets/images/bouboufemme.png',
      nameProducts: '(super express) Boubou femme',
      price: 4000,
    ),

    //84
    Products(
      photo: 'assets/images/robecourte.png',
      nameProducts: '(super express) Robe courte',
      price: 2000,
    ),

    //85
    Products(
      photo: 'assets/images/robelongue.png',
      nameProducts: '(super express) Robe longue',
      price: 3600,
    ),

    //86  Spécial
    Products(
        photo: 'assets/images/robedemariagev.png',
        nameProducts: '(super express) Robe de mariée',
        price: 4000),

    //87  Accessoires
    Products(
        photo: 'assets/images/chapeau.png',
        nameProducts: '(super express) Chapeau',
        price: 2000),

    //88
    Products(
        photo: 'assets/images/cravatte.png',
        nameProducts: '(super express) Cravatte',
        price: 1000),

    //89
    Products(
        photo: 'assets/images/chaussure.png',
        nameProducts: '(super express) Chaussures',
        price: 2000),

    //90
    Products(
        photo: 'assets/images/gants.png',
        nameProducts: '(super express) Gants',
        price: 1400),

    //91
    Products(
        photo: 'assets/images/chaussettes.png',
        nameProducts: '(super express) Chaussettes',
        price: 1200),

    //92  Bain
    Products(
        photo: 'assets/images/serviette1.png',
        nameProducts: '(super express) Petite serviette',
        price: 1400),

    //93
    Products(
        photo: 'assets/images/serviette2.png',
        nameProducts: '(super express) Serviette moyenne',
        price: 2000),

    //94
    Products(
        photo: 'assets/images/serviette3.png',
        nameProducts: '(super express) Grande serviette',
        price: 3000),

    //95  Litérie
    Products(
        photo: 'assets/images/drap1.png',
        nameProducts: '(super express) Drap une place',
        price: 2000),

    //96
    Products(
        photo: 'assets/images/drap2.png',
        nameProducts: '(super express) Drap deux places',
        price: 4000),

    //97
    Products(
        photo: 'assets/images/drap3.png',
        nameProducts: '(super express) Drap trois places',
        price: 5000),

    //98
    Products(
        photo: 'assets/images/oreiller.png',
        nameProducts: '(super express) Oreiller',
        price: 2000),

    //99
    Products(
        photo: 'assets/images/couette1.png',
        nameProducts: '(super express) Couette une place et demi',
        price: 6000),

    //100
    Products(
        photo: 'assets/images/couette2.png',
        nameProducts: '(super express) Couette deux places',
        price: 10000),

    //101
    Products(
        photo: 'assets/images/couette3.png',
        nameProducts: '(super express) Couette trois places',
        price: 16000),

    //102  Autre
    Products(
        photo: 'assets/images/tapis.png',
        nameProducts: '(super express) Tapis (en mètre carré)',
        price: 2000),

    //103
    Products(
        photo: 'assets/images/moquette.png',
        nameProducts: '(super express) Moquette (en mètre carré)',
        price: 2000),

    //104
    Products(
        photo: 'assets/images/rideau.png',
        nameProducts: '(super express) Rideau (en mètre carré)',
        price: 2000),
  ];
}

CartController controller = Get.find();

class Orders {
  // final String imagePath;
  // final String name;
  String? identification = '';
  //Products produit = controller.productasothers.keys.toList()[0];
  int quantity = 0;
  String total = "";

  Orders({
    // required this.imagePath,
    // required this.name,
    required this.identification,
    //required this.produit,
    required this.quantity,
    required this.total,
    required location,
    required photo,
    required nameProducts,
  });

  Map<String, dynamic> toJsonOrders() => {
        // 'ImagePath': imagePath,
        // 'Nom et prénom': name,
        'Numéro de téléphone': identification,
        // 'ProductsPath': produit,
        // 'ImagePathProducts': produit.photo,
        // 'Le nom du produit': produit.nameProducts,
        'La quantité commandée': quantity,
        'Le coût total commandée': total,
      };

  static Orders fromJsonOrders(Map<String, dynamic> json) => Orders(
        // imagePath: json['ImagePath'],
        // name: json['Nom et prénom'],
        identification: json['Numéro de téléphone'],
        //produit: json['ProductsPath'],
        photo: json['ImagePathProducts'],
        location: json['Location'],
        nameProducts: json['Le nom du produit'],
        quantity: json['La quantité commandée'],
        total: json['Le coût total commandée'],
      );
}
