import 'package:get/get.dart';

import '../catalog_product_wash/products_model_list.dart';

class CartController extends GetxController {
  int accessoriesCounterByProduct(Product? product) {
    return accessoriesnumber[product];
  }

  int bathCountert(Product? product) {
    return bathnumber[product] ?? 0; // Retourne 0 si la valeur est null
  }

  int beddingCounterl(Product? product) {
    return beddingnumber[product] ?? 0; // Retourne 0 si la valeur est null
  }

  int othersCounterl(Product? product) {
    return othersnumber[product] ?? 0; // Retourne 0 si la valeur est null
  }

  int clothesCounterl(Product? product) {
    return clothesnumber[product] ?? 0; // Retourne 0 si la valeur est null
  }

  int accessoriesCounterl(Product? product) {
    return accessoriesnumber[product] ?? 0; // Retourne 0 si la valeur est null
  }

  //Les variables de la remise manuel______________________________________________
  RxDouble remiseManuelle = 0.0.obs;
  void initRemiseManuel() {
    remiseManuelle = 0.0.obs;
  }
  //--------------------------------------------------------------------
  
  //Les variables de la remise manuel______________________________________________
  RxDouble fraisAdditionnel = 0.0.obs;
  void initFraisAdditionnel() {
    fraisAdditionnel = 0.0.obs;
  }
  //--------------------------------------------------------------------

  //bathnumber

  bool isCartEmpty() {
    return _generalListing.isEmpty;
  }

  double shipping = 0.0;
  int sign = 0;
  int sumup = 0;

  static var to;

  void ifsigned() {
    if (sign == 0) {
      shipping = 300;
    } else {
      shipping += 0;
    }
  }

  //   get fulsom => globalsom
  //       .map((fulsom) => fulsom as int);
  //
  //   int carttotal () {
  //     fulsom += shipping;
  //   return sumup;
  // }

  //general listing
  final _generalListing = {}.obs;
  //ClothesCartSection

  //init real null key value
  void avoidNullGeneralKeyvalue(Product? producta) {
    if (_generalListing.containsKey(producta)) {
      _generalListing[producta] += 0;
    } else {
      _generalListing[producta] = 0;
    }
    // return _productasclothes[producta];
  }

  //init clothe real key
  int initGeneralListing(Product? producta) {
    _generalListing[producta] = 0;
    return _generalListing[producta];
  }

  //Add productas
  void addToGeneralListing(Product? producta) {
    if (_generalListing.containsKey(producta)) {
      _generalListing[producta] += 1;
    } else {
      _generalListing[producta] = 1;
    }

    Get.snackbar(
      "Produit ajouté",
      "Vous avez ajouté un(e) ${producta?.nameproduct} au panier",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeFromGeneralListing(Product? producta) {
    if (_generalListing.containsKey(producta) &&
        _generalListing[producta] == 1) {
      _generalListing.removeWhere((key, value) => key == producta);
    }
    if (_generalListing[producta] == 0) {
    } else {
      _generalListing[producta] -= 1;
    }
  }

  // void removeAllGeneralListing(Product? producta) {
  //   if (_generalListing.containsKey(producta) &&
  //       _generalListing[producta] == 1) {
  //     _generalListing.removeWhere((key, value) => key == producta);
  //   } else {
  //     _generalListing.removeWhere((key, value) => key == producta);
  //   }
  // }

  // void checkIfSuExpressForGeneral(Product? producta) {
  //   if (_generalListing.containsKey(producta) &&
  //       _generalListing[producta] != 0) {
  //     _generalListing[producta] = 1;
  //   } else {}
  // }

  get generalListing => _generalListing;

  get generalListingSubtotal =>
      _generalListing.entries
          .map(
            (generalListing) => generalListing.key.price * generalListing.value,
          )
          .toList();

  get generalListingTotalPrice => _generalListing.entries
      .map((generalListing) => generalListing.key.price * generalListing.value)
      .toList()
      .reduce((value, element) => value + element);
  // .toStringAsFixed(2);

  //get numberOfGeneralProducts => _generalListing;
  get getTotalGeneralListing => _generalListing.entries
      .map((numberOfGeneralProducts) => numberOfGeneralProducts.value)
      .toList()
      .reduce((value, element) => value + element);

  var lastPriceWithoutRemise = 0.0;
  var generalFirstRemise = 0.0;
  var generalSecondRemise = 0.0;
  void generalIfSuCalculs() {
    lastPriceWithoutRemise = generalListingTotalPrice + ifCinqMilles;
    if (getTotalGeneralListing > 20) {
      generalSecondRemise = (generalListingTotalPrice * 20) / 100;
    }
    if (getTotalGeneralListing > 9 && getTotalGeneralListing < 20) {
      generalFirstRemise = (generalListingTotalPrice * 15) / 100;
    }
  }

  get generalPriceWithoutRemise => lastPriceWithoutRemise;
  get twentyRemiseArticles => generalSecondRemise;
  get underFifteenRemiseArt => generalFirstRemise;

  //Clothes___________________________________________________________________________
  // Dictionnary
  final _productas = {}.obs;
  //ClothesIncrement
  var clothesnumber = {}.obs;

  //Take up number
  //var forRemiseNormalClothes = {}.obs;

  //ClothesCounterInitializing
  // ignore: non_constant_identifier_names
  int clothesInitCounter(Product? producta) {
    clothesnumber[producta] = 0;
    //forRemiseNormalClothes[producta] = 0;
    return clothesnumber[producta];
  }

  // void forbothInitCounter(Product? producta) {
  //   if (clothesnumber.containsKey(producta)) {
  //     clothesnumber[producta] = 0;
  //   } else {
  //     clothesnumber[producta] =0;
  //     // clothesnumber[producta] = 0;
  //   }
  // }

  //ClothesIncrementSection

  int clothesCounter(Product? producta) {
    return clothesnumber[producta];
  }

  void addClothesCounter(Product? producta) {
    if (clothesnumber.containsKey(producta)) {
      clothesnumber[producta] += 1;
    } else {
      clothesnumber[producta] = 1;
    }
    //forRemiseNormalClothes += 1;
  }

  void reduceClothesCounter(Product? producta) {
    if (clothesnumber.containsKey(producta) && clothesnumber[producta] == 1) {
      // number.removeWhere((key, value) => key == producta);
      clothesnumber[producta] = 0;
    }
    if (clothesnumber[producta] == 0) {
      // number.removeWhere((key, value) => key == producta);
    } else {
      clothesnumber[producta] -= 1;
    }
    //forRemiseNormalClothes -= 1;
  }

  void reduceAllClothesCounter(Product? producta) {
    if (clothesnumber.containsKey(producta) && clothesnumber[producta] == 1) {
      clothesnumber.removeWhere((key, value) => key == producta);
    } else {
      clothesnumber.removeWhere((key, value) => key == producta);
    }
  }

  //ClothesCartSection

  //init real null key value
  void clothesInitrkvalue(Product? producta) {
    if (_productas.containsKey(producta)) {
      _productas[producta] += 0;
    } else {
      _productas[producta] = 0;
    }
    // return _productasclothes[producta];
  }

  //get printUpForRemise => forRemiseNormalClothes;

  //init real null key value
  void clothesDropOutInitrkvalue(Product? producta) {
    if (_productas[producta] == 0) {
      _productas.removeWhere((key, value) => key == producta);
    } else {
      _productas[producta] += 0;
    }
  }

  void clothesReplaceZerosValue(Product? producta) {
    if (_productas[producta] == null) {
      _productas[producta] = 0;
    } else {
      _productas[producta] += 0;
    }
  }

  //init clothe real key
  int clothesInitRealCounter(Product? producta) {
    _productas[producta] = 0;
    return _productas[producta];
  }

  //Add productas
  void addProductClothes(Product? producta) {
    if (_productas.containsKey(producta)) {
      _productas[producta] += 1;
    } else {
      _productas[producta] = 1;
    }

    Get.snackbar(
      "Produit ajouté",
      "Vous avez ajouté un(e) ${producta?.nameproduct} au panier",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeProductClothes(Product? producta) {
    if (_productas.containsKey(producta) && _productas[producta] == 1) {
      _productas.removeWhere((key, value) => key == producta);
    }
    if (_productas[producta] == 0) {
    } else {
      _productas[producta] -= 1;
    }
  }

  void removeAllProductClothes(Product? producta) {
    if (_productas.containsKey(producta) && _productas[producta] == 1) {
      _productas.removeWhere((key, value) => key == producta);
    } else {
      _productas.removeWhere((key, value) => key == producta);
    }
  }

  void checkIfSuExpress(Product? producta) {
    if (_productas.containsKey(producta) && _productas[producta] != 0) {
      _productas[producta] = 1;
    } else {}
  }

  get productasclothes => _productas;

  get productasclotheSubtotal =>
      _productas.entries
          .map(
            (productaclothe) => productaclothe.key.price * productaclothe.value,
          )
          .toList();

  get totalclothe => _productas.entries
      .map((productaclothe) => productaclothe.key.price * productaclothe.value)
      .toList()
      .reduce((value, element) => value + element);
  // .toStringAsFixed(2);

  get numberOfClothes => _productas;
  get printUpForRemiseClothes => _productas.entries
      .map((numberOfClothes) => numberOfClothes.value)
      .toList()
      .reduce((value, element) => value + element);

  // get numberofOfClothes => clothesnumber;
  // get printUpForRemiseClothes => clothesnumber.entries
  //     .map((numberofOfClothes) => numberofOfClothes.value)
  //     .toList()
  //     .reduce((value, element) => value + element);

  // void addFiveTa(Product? producta) {
  //   addedVet[producta] += 1;
  // }

  // void checkIfSuExpress(Product? producta, Product? producto) {
  //   if (addedVet.containsKey(producta)) {
  //     _productas[producto] += 1;
  //   } else {}
  // }

  // void addProductClothesSuperExpress(Product? producta) {
  //   if (_productas[producta] > 0) {
  //     var myintotal = double.parse(totalclothe);
  //     myintotal = myintotal + 5000;
  //   } else {}
  // }

  // get showTotal => myintotal;

  //Special
  //SpecialIncrement
  final _productaspe = {}.obs;
  var specialnumber = {}.obs;

  //SpecialCounterInitializing
  int specialInitCounter(Product? producta) {
    specialnumber[producta] = 0;
    return specialnumber[producta];
  }

  //SpecialIncrementSection
  int specialCounter(Product? producta) {
    return specialnumber[producta];
  }

  void addSpecialCounter(Product? producta) {
    if (specialnumber.containsKey(producta)) {
      specialnumber[producta] += 1;
    } else {
      specialnumber[producta] = 1;
    }
  }

  void reduceSpecialCounter(Product? producta) {
    if (specialnumber.containsKey(producta) && specialnumber[producta] == 1) {
      // number.removeWhere((key, value) => key == producta);
      specialnumber[producta] = 0;
    }
    if (specialnumber[producta] == 0) {
      // number.removeWhere((key, value) => key == producta);
    } else {
      specialnumber[producta] -= 1;
    }
  }

  void reduceAllSpecialCounter(Product? producta) {
    if (specialnumber.containsKey(producta) && specialnumber[producta] == 1) {
      specialnumber.removeWhere((key, value) => key == producta);
    } else {
      specialnumber.removeWhere((key, value) => key == producta);
    }
  }

  //SpecialCartSection

  //init real key value
  void specialInitrkvalue(Product? producta) {
    if (_productaspe.containsKey(producta)) {
      _productaspe[producta] += 0;
    } else {
      _productaspe[producta] = 0;
    }
    // return _productasclothes[producta];
  }

  void specialDropOutInitrkvalue(Product? producta) {
    if (_productaspe[producta] == 0) {
      _productaspe.removeWhere((key, value) => key == producta);
    } else {
      _productaspe[producta] += 0;
    }
  }

  void specialReplaceZerosValue(Product? producta) {
    if (_productaspe[producta] == null) {
      _productaspe[producta] = 0;
    } else {
      _productaspe[producta] += 0;
    }
  }

  int specialInitRealCounter(Product? producta) {
    _productaspe[producta] = 0;
    return _productaspe[producta];
  }

  //Add productas
  void addProductSpecial(Product? producta) {
    if (_productaspe.containsKey(producta)) {
      _productaspe[producta] += 1;
    } else {
      _productaspe[producta] = 1;
    }

    Get.snackbar(
      "Produit ajouté",
      "Vous avez ajouté un(e) ${producta?.nameproduct} au panier",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeProductSpecial(Product? producta) {
    if (_productaspe.containsKey(producta) && _productaspe[producta] == 1) {
      _productaspe.removeWhere((key, value) => key == producta);
    }
    if (_productaspe[producta] == 0) {
    } else {
      _productaspe[producta] -= 1;
    }
  }

  void removeAllProductSpecial(Product? producta) {
    if (_productaspe.containsKey(producta) && _productaspe[producta] == 1) {
      _productaspe.removeWhere((key, value) => key == producta);
    } else {
      _productaspe.removeWhere((key, value) => key == producta);
    }
  }

  get productaspecial => _productaspe;

  get productaspecialSubtotal =>
      _productaspe.entries
          .map(
            (productaspecial) =>
                productaspecial.key.price * productaspecial.value,
          )
          .toList();

  get totalspecial => _productaspe.entries
      .map(
        (productaspecial) => productaspecial.key.price * productaspecial.value,
      )
      .toList()
      .reduce((value, element) => value + element);
  // .toStringAsFixed(2);

  get numberOfSpecial => _productaspe;
  get printUpForRemiseSpecial => _productaspe.entries
      .map((numberOfSpecial) => numberOfSpecial.value)
      .toList()
      .reduce((value, element) => value + element);

  //Accessories__________________________________________________________________
  //AccessoriesDictionary
  final _productasaccessories = {}.obs;
  //AccessoriesIncrement
  var accessoriesnumber = {}.obs;

  //AccessoriesCounterInitializing
  int accessoriesInitCounter(Product? producta) {
    accessoriesnumber[producta] = 0;
    return accessoriesnumber[producta];
  }

  //AccessoriesIncrementSection
  int accessoriesCounter(Product? producta) {
    return accessoriesnumber[producta];
  }

  void addAccessoriesCounter(Product? producta) {
    if (accessoriesnumber.containsKey(producta)) {
      accessoriesnumber[producta] += 1;
    } else {
      accessoriesnumber[producta] = 1;
    }
  }

  void reduceAccessoriesCounter(Product? producta) {
    if (accessoriesnumber.containsKey(producta) &&
        accessoriesnumber[producta] == 1) {
      accessoriesnumber[producta] = 0;
    }
    if (accessoriesnumber[producta] == 0) {
    } else {
      accessoriesnumber[producta] -= 1;
    }
  }

  void reduceAllAccessoriesCounter(Product? producta) {
    if (accessoriesnumber.containsKey(producta) &&
        accessoriesnumber[producta] == 1) {
      accessoriesnumber.removeWhere((key, value) => key == producta);
    } else {
      accessoriesnumber.removeWhere((key, value) => key == producta);
    }
  }

  //AccessoiresCartSection

  //init real key value
  void accessoriesInitrkvalue(Product? producta) {
    if (_productasaccessories.containsKey(producta)) {
      _productasaccessories[producta] += 0;
    } else {
      _productasaccessories[producta] = 0;
    }
    // return _productasclothes[producta];
  }

  void accessoriesDropOutInitrkvalue(Product? producta) {
    if (_productasaccessories[producta] == 0) {
      _productasaccessories.removeWhere((key, value) => key == producta);
    } else {
      _productasaccessories[producta] += 0;
    }
  }

  void accessoriesReplaceZerosValue(Product? producta) {
    if (_productasaccessories[producta] == null) {
      _productasaccessories[producta] = 0;
    } else {
      _productasaccessories[producta] += 0;
    }
  }

  int accessoriesInitRealCounter(Product? producta) {
    _productasaccessories[producta] = 0;
    return _productasaccessories[producta];
  }

  //Add productas
  void addProductAccessories(Product? producta) {
    if (_productasaccessories.containsKey(producta)) {
      _productasaccessories[producta] += 1;
    } else {
      _productasaccessories[producta] = 1;
    }

    Get.snackbar(
      "Produit ajouté",
      "Vous avez ajouté un(e) ${producta?.nameproduct} au panier",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeProductAccessories(Product? producta) {
    if (_productasaccessories.containsKey(producta) &&
        _productasaccessories[producta] == 1) {
      _productasaccessories.removeWhere((key, value) => key == producta);
    }
    if (_productasaccessories[producta] == 0) {
    } else {
      _productasaccessories[producta] -= 1;
    }
  }

  void removeAllProductAccessories(Product? producta) {
    if (_productasaccessories.containsKey(producta) &&
        _productasaccessories[producta] == 1) {
      _productasaccessories.removeWhere((key, value) => key == producta);
    } else {
      _productasaccessories.removeWhere((key, value) => key == producta);
    }
  }

  get productasaccessories => _productasaccessories;

  get productaaccessorySubtotal =>
      _productasaccessories.entries
          .map(
            (productasaccessories) =>
                productasaccessories.key.price * productasaccessories.value,
          )
          .toList();

  get totalaccessory => _productasaccessories.entries
      .map(
        (productaaccessory) =>
            productaaccessory.key.price * productaaccessory.value,
      )
      .toList()
      .reduce((value, element) => value + element);
  // .toStringAsFixed(2);

  get numberOfAccessories => accessoriesnumber;
  get printUpForRemiseAccessories => _productasaccessories.entries
      .map((numberOfAccessories) => numberOfAccessories.value)
      .toList()
      .reduce((value, element) => value + element);
  //__________________________________________________________________________

  //Bath__________________________________________________________________________
  //__________________________________________________________________________
  //BathDictionary
  final _productasbath = {}.obs;
  //BathIncrement
  var bathnumber = {}.obs;

  //BathCounterInitializing
  int bathInitCounter(Product? producta) {
    bathnumber[producta] = 0;
    return bathnumber[producta];
  }

  //BathIncrementSection
  int bathCounter(Product? producta) {
    return bathnumber[producta];
  }

  void addBathCounter(Product? producta) {
    if (bathnumber.containsKey(producta)) {
      bathnumber[producta] += 1;
    } else {
      bathnumber[producta] = 1;
    }
  }

  void reduceBathCounter(Product? producta) {
    if (bathnumber.containsKey(producta) && bathnumber[producta] == 1) {
      bathnumber[producta] = 0;
    }
    if (bathnumber[producta] == 0) {
    } else {
      bathnumber[producta] -= 1;
    }
  }

  void reduceAllBathCounter(Product? producta) {
    if (bathnumber.containsKey(producta) && bathnumber[producta] == 1) {
      bathnumber.removeWhere((key, value) => key == producta);
    } else {
      bathnumber.removeWhere((key, value) => key == producta);
    }
  }

  //BathCartSection

  //init real key value
  void bathInitrkvalue(Product? producta) {
    if (_productasbath.containsKey(producta)) {
      _productasbath[producta] += 0;
    } else {
      _productasbath[producta] = 0;
    }
    // return _productasclothes[producta];
  }

  void bathDropOutInitrkvalue(Product? producta) {
    if (_productasbath[producta] == 0) {
      _productasbath.removeWhere((key, value) => key == producta);
    } else {
      _productasbath[producta] += 0;
    }
  }

  void bathReplaceZerosValue(Product? producta) {
    if (_productasbath[producta] == null) {
      _productasbath[producta] = 0;
    } else {
      _productasbath[producta] += 0;
    }
  }

  //BathRealCounterInitializing
  int bathInitRealCounter(Product? producta) {
    _productasbath[producta] = 0;
    return _productasbath[producta];
  }

  //Add productas
  void addProductBath(Product? producta) {
    if (_productasbath.containsKey(producta)) {
      _productasbath[producta] += 1;
    } else {
      _productasbath[producta] = 1;
    }

    Get.snackbar(
      "Produit ajouté",
      "Vous avez ajouté un(e) ${producta?.nameproduct} au panier",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeProductBath(Product? producta) {
    if (_productasbath.containsKey(producta) && _productasbath[producta] == 1) {
      _productasbath.removeWhere((key, value) => key == producta);
    }
    if (_productasbath[producta] == 0) {
    } else {
      _productasbath[producta] -= 1;
    }
  }

  void removeAllProductBath(Product? producta) {
    if (_productasbath.containsKey(producta) && _productasbath[producta] == 1) {
      _productasbath.removeWhere((key, value) => key == producta);
    } else {
      _productasbath.removeWhere((key, value) => key == producta);
    }
  }

  get productasbath => _productasbath;

  get productabathSubtotal =>
      _productasbath.entries
          .map((productabath) => productabath.key.price * productabath.value)
          .toList();

  get totalbath => _productasbath.entries
      .map((productabath) => productabath.key.price * productabath.value)
      .toList()
      .reduce((value, element) => value + element);
  // .toStringAsFixed(2);

  get numberOfBath => _productasbath;
  get printUpForRemiseBath => _productasbath.entries
      .map((numberOfBath) => numberOfBath.value)
      .toList()
      .reduce((value, element) => value + element);
  //__________________________________________________________________________

  //Bedding____________________________________________________________________
  //BeddingDictionnary
  final _productasbedding = {}.obs;
  //BeddingIncrement
  var beddingnumber = {}.obs;

  //BeddingCounterInitializing
  int beddingInitCounter(Product? producta) {
    beddingnumber[producta] = 0;
    return beddingnumber[producta];
  }

  //BathIncrementSection
  int beddingCounter(Product? producta) {
    return beddingnumber[producta];
  }

  void addBeddingCounter(Product? producta) {
    if (beddingnumber.containsKey(producta)) {
      beddingnumber[producta] += 1;
    } else {
      beddingnumber[producta] = 1;
    }
  }

  void reduceBeddingCounter(Product? producta) {
    if (beddingnumber.containsKey(producta) && beddingnumber[producta] == 1) {
      beddingnumber[producta] = 0;
    }
    if (beddingnumber[producta] == 0) {
    } else {
      beddingnumber[producta] -= 1;
    }
  }

  void reduceAllBeddingCounter(Product? producta) {
    if (beddingnumber.containsKey(producta) && beddingnumber[producta] == 1) {
      beddingnumber.removeWhere((key, value) => key == producta);
    } else {
      beddingnumber.removeWhere((key, value) => key == producta);
    }
  }

  //BeddingCartSection

  //init real key value
  void beddingInitrkvalue(Product? producta) {
    if (_productasbedding.containsKey(producta)) {
      _productasbedding[producta] += 0;
    } else {
      _productasbedding[producta] = 0;
    }
    // return _productasclothes[producta];
  }

  void beddingDropOutInitrkvalue(Product? producta) {
    if (_productasbedding[producta] == 0) {
      _productasbedding.removeWhere((key, value) => key == producta);
    } else {
      _productasbedding[producta] += 0;
    }
  }

  void beddingReplaceZerosValue(Product? producta) {
    if (_productasbedding[producta] == null) {
      _productasbedding[producta] = 0;
    } else {
      _productasbedding[producta] += 0;
    }
  }

  int beddingInitRealCounter(Product? producta) {
    _productasbedding[producta] = 0;
    return _productasbedding[producta];
  }

  //Add productas
  void addProductBedding(Product? producta) {
    if (_productasbedding.containsKey(producta)) {
      _productasbedding[producta] += 1;
    } else {
      _productasbedding[producta] = 1;
    }

    Get.snackbar(
      "Produit ajouté",
      "Vous avez ajouté un(e) ${producta?.nameproduct} au panier",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeProductBedding(Product? producta) {
    if (_productasbedding.containsKey(producta) &&
        _productasbedding[producta] == 1) {
      _productasbedding.removeWhere((key, value) => key == producta);
    }
    if (_productasbedding[producta] == 0) {
    } else {
      _productasbedding[producta] -= 1;
    }
  }

  void removeAllProductBedding(Product? producta) {
    if (_productasbedding.containsKey(producta) &&
        _productasbedding[producta] == 1) {
      _productasbedding.removeWhere((key, value) => key == producta);
    } else {
      _productasbedding.removeWhere((key, value) => key == producta);
    }
  }

  get productasbedding => _productasbedding;

  get productabeddingSubtotal =>
      _productasbedding.entries
          .map(
            (productabedding) =>
                productabedding.key.price * productabedding.value,
          )
          .toList();

  get totalbedding => _productasbedding.entries
      .map(
        (productabedding) => productabedding.key.price * productabedding.value,
      )
      .toList()
      .reduce((value, element) => value + element);
  // .toStringAsFixed(2);

  get numberOfBedding => _productasbedding;
  get printUpForRemiseBedding => _productasbedding.entries
      .map((numberOfBedding) => numberOfBedding.value)
      .toList()
      .reduce((value, element) => value + element);
  //______________________________________________________________________________________

  //Take up the total of articles for the remise ______________________________________________________
  var printTotalOfArticles = 0.0;
  get listingOfArticles => [
    printUpForRemiseBedding, printUpForRemiseBath, printUpForRemiseClothes,
    printUpForRemiseSpecial, printUpForRemiseAccessories,

    // totalclothexpress, totalspecialexpress, totalbathexpress, totalbeddingexpress, totalaccessoryexpress, totalotherexpress,
    // totalclothsuperexpress, totalspecialsuperexpress, totalbathesuperxpress, totalbeddingsuperexpress, totalaccessorysuperexpress, totalothersuperexpress
  ];

  get totalOfArticles => [
        printUpForRemiseClothes, printUpForRemiseBedding, printUpForRemiseBath,
        printUpForRemiseSpecial, printUpForRemiseAccessories,
        printUpForRemiseOthers,

        // totalclothexpress, totalspecialexpress, totalbathexpress, totalbeddingexpress, totalaccessoryexpress, totalotherexpress,
        // totalclothsuperexpress, totalspecialsuperexpress, totalbathesuperxpress, totalbeddingsuperexpress, totalaccessorysuperexpress, totalothersuperexpress
      ]
      .map((listingOfArticles) => listingOfArticles as int)
      //.map((listingOfArticles) => listingOfArticles)
      .toList()
      .reduce((value, element) => value + element);

  // void printUpTotalOfArticles() {
  //   printTotalOfArticles = totalOfArticles;
  //   // _productas[producta] = 1;
  // }

  // get printUpTotalOfRemise => printTotalOfArticles;

  //Others___________________________________________________________________
  //OthersDictionary
  final _productasothers = {}.obs;
  //OthersIncrement
  var othersnumber = {}.obs;

  //OthersCounterInitializing
  int othersInitCounter(Product? producta) {
    othersnumber[producta] = 0;
    return othersnumber[producta];
  }

  //OthersIncrementSection
  int othersCounter(Product? producta) {
    return othersnumber[producta];
  }

  void addOthersCounter(Product? producta) {
    if (othersnumber.containsKey(producta)) {
      othersnumber[producta] += 1;
    } else {
      othersnumber[producta] = 1;
    }
  }

  void reduceOthersCounter(Product? producta) {
    if (othersnumber.containsKey(producta) && othersnumber[producta] == 1) {
      othersnumber[producta] = 0;
    }
    if (othersnumber[producta] == 0) {
    } else {
      othersnumber[producta] -= 1;
    }
  }

  void reduceAllOthersCounter(Product? producta) {
    if (othersnumber.containsKey(producta) && othersnumber[producta] == 1) {
      othersnumber.removeWhere((key, value) => key == producta);
    } else {
      othersnumber.removeWhere((key, value) => key == producta);
    }
  }

  //OthersCartSection

  //init real key value
  void othersInitrkvalue(Product? producta) {
    if (_productasothers.containsKey(producta)) {
      _productasothers[producta] += 0;
    } else {
      _productasothers[producta] = 0;
    }
    // return _productasclothes[producta];
  }

  void othersDropOutInitrkvalue(Product? producta) {
    if (_productasothers[producta] == 0) {
      _productasothers.removeWhere((key, value) => key == producta);
    } else {
      _productasothers[producta] += 0;
    }
  }

  void othersReplaceZerosValue(Product? producta) {
    if (_productasothers[producta] == null) {
      _productasothers[producta] = 0;
    } else {
      _productasothers[producta] += 0;
    }
  }

  //OthersRealCounterInitializing
  int othersInitRealCounter(Product? producta) {
    _productasothers[producta] = 0;
    return _productasothers[producta];
  }

  //Add productas
  void addProductOthers(Product? producta) {
    if (_productasothers.containsKey(producta)) {
      _productasothers[producta] += 1;
    } else {
      _productasothers[producta] = 1;
    }

    Get.snackbar(
      "Produit ajouté",
      "Vous avez ajouté un(e) ${producta?.nameproduct} au panier",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeProductOthers(Product? producta) {
    if (_productasothers.containsKey(producta) &&
        _productasothers[producta] == 1) {
      _productasothers.removeWhere((key, value) => key == producta);
    }
    if (_productasothers[producta] == 0) {
    } else {
      _productasothers[producta] -= 1;
    }
  }

  void removeAllProductOthers(Product? producta) {
    if (_productasothers.containsKey(producta) &&
        _productasothers[producta] == 1) {
      _productasothers.removeWhere((key, value) => key == producta);
    } else {
      _productasothers.removeWhere((key, value) => key == producta);
    }
  }

  get productasothers => _productasothers;

  get productaotherSubtotal =>
      _productasothers.entries
          .map((productaother) => productaother.key.price * productaother.value)
          .toList();

  get totalother => _productasothers.entries
      .map((productaother) => productaother.key.price * productaother.value)
      .toList()
      .reduce((value, element) => value + element);
  // .toStringAsFixed(2);

  get numberOfOthers => othersnumber;
  get printUpForRemiseOthers => _productasothers.entries
      .map((numberOfOthers) => numberOfOthers.value)
      .toList()
      .reduce((value, element) => value + element);
  //
  //
  //
  //
  //
  //
  //
  //
  //   // Express zone___________________________________________________________________________________________
  //   // Clothes___________________________________________________________________________
  //   // ClothesDictionnary
  //
  //   //ClothesIncrement
  //   var _productaclothesexpress = {}.obs;
  //   var clothesnumberexpres = {}.obs;
  //
  //   //ClothesCounterInitializing
  //   int clothesInitCounterExpress(Product? producta) {
  //     clothesnumberexpres[producta]=0;
  //     return clothesnumberexpres[producta];
  //   }
  //
  //   //ClothesIncrementSection
  //   int clothesCounterExpress (Product? producta) {
  //     return clothesnumberexpres[producta];
  //   }
  //
  //   void addClothesCounterExpress(Product? producta) {
  //     if (clothesnumberexpres.containsKey(producta)) {
  //       clothesnumberexpres[producta] += 1;
  //     } else {
  //       clothesnumberexpres[producta] = 1;
  //     }
  //   }
  //
  //   void reduceClothesCounterExpress(Product? producta) {
  //     if (clothesnumberexpres.containsKey(producta)  && clothesnumberexpres[producta] == 1) {
  //       // number.removeWhere((key, value) => key == producta);
  //       clothesnumberexpres[producta] = 0;
  //     }
  //     if (clothesnumberexpres[producta] == 0) {
  //       // number.removeWhere((key, value) => key == producta);
  //     }
  //     else {
  //       clothesnumberexpres[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllClothesCounterExpress(Product? producta) {
  //     if (clothesnumberexpres.containsKey(producta) && clothesnumberexpres[producta] == 1) {
  //       clothesnumberexpres.removeWhere((key, value) => key == producta);
  //     } else {
  //       clothesnumberexpres.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //ClothesCartSection
  //
  //   //init real null key value
  //   void clothesInitrkvalueExpress(Product? producta) {
  //     if (_productaclothesexpress.containsKey(producta)) {
  //       _productaclothesexpress[producta] += 0;
  //     }
  //     else {_productaclothesexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   //init real null key value
  //   void clothesDropOutInitrkvalueExpress(Product? producta) {
  //     if (_productaclothesexpress[producta] == 0) {
  //       _productaclothesexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productaclothesexpress[producta]+=0;}
  //   }
  //
  //   //init clothe real key
  //   int clothesInitRealCounterExpress(Product? producta) {
  //     _productaclothesexpress[producta]=0;
  //     return _productaclothesexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?ClothesExpress(Product? producta) {
  //     if (_productaclothesexpress.containsKey(producta)) {
  //       _productaclothesexpress[producta] += 1;
  //     } else {
  //       _productaclothesexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?ClothesExpress(Product? producta) {
  //     if (_productaclothesexpress.containsKey(producta) && _productaclothesexpress[producta] == 1) {
  //       _productaclothesexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productaclothesexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?ClothesExpress (Product? producta) {
  //     if (_productaclothesexpress.containsKey(producta) && _productaclothesexpress[producta] == 1) {
  //       _productaclothesexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productaclothesexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productasclothesexpress => _productaclothesexpress;
  //
  //   get productasclotheSubtotalExpress => _productaclothesexpress.entries
  //       .map((productasclothesexpress) => productasclothesexpress.key.price * productasclothesexpress.value)
  //       .toList();
  //
  //   get totalclothexpress => _productaclothesexpress.entries
  //       .map((productasclothesexpress) => productasclothesexpress.key.price * productasclothesexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  //   // .toStringAsFixed(2);
  //
  //
  //   //Special__________________________________________________________________
  //   //SpecialDictionnary
  //   var _productaspecialexpress = {}.obs;
  //   //SpecialIncrement
  //   var specialnumberexpress = {}.obs;
  //
  //   //SpecialCounterInitializing
  //   int specialInitCounterExpress(Product? producta) {
  //     specialnumberexpress[producta]=0;
  //     return specialnumberexpress[producta];
  //   }
  //
  //   //SpecialIncrementSection
  //   int specialCounterExpress (Product? producta) {
  //     return specialnumberexpress[producta];
  //   }
  //
  //   void addSpecialCounterExpress(Product? producta) {
  //     if (specialnumberexpress.containsKey(producta)) {
  //       specialnumberexpress[producta] += 1;
  //     } else {
  //       specialnumberexpress[producta] = 1;
  //     }
  //   }
  //
  //   void reduceSpecialCounterExpress(Product? producta) {
  //     if (specialnumberexpress.containsKey(producta)  && specialnumberexpress[producta] == 1) {
  //       // number.removeWhere((key, value) => key == producta);
  //       specialnumberexpress[producta] = 0;
  //     }
  //     if (specialnumberexpress[producta] == 0) {
  //       // number.removeWhere((key, value) => key == producta);
  //     }
  //     else {
  //       specialnumberexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllSpecialCounterExpress(Product? producta) {
  //     if (specialnumberexpress.containsKey(producta) && specialnumberexpress[producta] == 1) {
  //       specialnumberexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       specialnumberexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //SpecialCartSection
  //
  //   //init real key value
  //   void specialInitrkvalueExpress(Product? producta) {
  //     if (_productaspecialexpress.containsKey(producta)) {
  //       _productaspecialexpress[producta] += 0;
  //     }
  //     else {_productaspecialexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   void specialDropOutInitrkvalueExpress(Product? producta) {
  //     if (_productaspecialexpress[producta] == 0) {
  //       _productaspecialexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productaspecialexpress[producta]+=0;}
  //   }
  //
  //   int specialInitRealCounterExpress(Product? producta) {
  //     _productaspecialexpress[producta]=0;
  //     return _productaspecialexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?SpecialExpress(Product? producta) {
  //     if (_productaspecialexpress.containsKey(producta)) {
  //       _productaspecialexpress[producta] += 1;
  //     } else {
  //       _productaspecialexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?SpecialExpress (Product? producta) {
  //     if (_productaspecialexpress.containsKey(producta) && _productaspecialexpress[producta] == 1) {
  //       _productaspecialexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productaspecialexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?SpecialExpress (Product? producta) {
  //     if (_productaspecialexpress.containsKey(producta) && _productaspecialexpress[producta] == 1) {
  //       _productaspecialexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productaspecialexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productaspecialexpress => _productaspecialexpress;
  //
  //   get productaspecialSubtotalexpress => _productaspecialexpress.entries
  //       .map((productaspecialexpress) => productaspecialexpress.key.price * productaspecialexpress.value)
  //       .toList();
  //
  //   get totalspecialexpress => _productaspecialexpress.entries
  //       .map((productaspecialexpress) => productaspecialexpress.key.price * productaspecialexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  // //   // .toStringAsFixed(2);
  //
  //
  //   //Accessories__________________________________________________________________
  //   //AccessoriesDictionary
  //   var _productasaccessoriesexpress = {}.obs;
  //   //AccessoriesIncrement
  //   var accessoriesnumberexpress = {}.obs;
  //
  //   //AccessoriesCounterInitializing
  //   int accessoriesInitCounterExpress(Product? producta) {
  //     accessoriesnumberexpress[producta]=0;
  //     return accessoriesnumberexpress[producta];
  //   }
  //
  //   //AccessoriesIncrementSection
  //   int accessoriesCounterExpress (Product? producta) {
  //     return accessoriesnumberexpress[producta];
  //   }
  //
  //   void addAccessoriesCounterExpress(Product? producta) {
  //     if (accessoriesnumberexpress.containsKey(producta)) {
  //       accessoriesnumberexpress[producta] += 1;
  //     } else {
  //       accessoriesnumberexpress[producta] = 1;
  //     }
  //   }
  //
  //   void reduceAccessoriesCounterExpress(Product? producta) {
  //     if (accessoriesnumberexpress.containsKey(producta)  && accessoriesnumberexpress[producta] == 1) {
  //       accessoriesnumberexpress[producta] = 0;
  //     }
  //     if (accessoriesnumberexpress[producta] == 0) {
  //     }
  //     else {
  //       accessoriesnumberexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllAccessoriesCounterExpress(Product? producta) {
  //     if (accessoriesnumberexpress.containsKey(producta) && accessoriesnumberexpress[producta] == 1) {
  //       accessoriesnumberexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       accessoriesnumberexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //AccessoiresCartSection
  //
  //   //init real key value
  //   void accessoriesInitrkvalueExpress(Product? producta) {
  //     if (_productasaccessoriesexpress.containsKey(producta)) {
  //       _productasaccessoriesexpress[producta] += 0;
  //     }
  //     else {_productasaccessoriesexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   void accessoriesDropOutInitrkvalueExpress(Product? producta) {
  //     if (_productasaccessoriesexpress[producta] == 0) {
  //       _productasaccessoriesexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productasaccessoriesexpress[producta]+=0;}
  //   }
  //
  //   int accessoriesInitRealCounterExpress(Product? producta) {
  //     _productasaccessoriesexpress[producta]=0;
  //     return _productasaccessoriesexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?AccessoriesExpress(Product? producta) {
  //     if (_productasaccessoriesexpress.containsKey(producta)) {
  //       _productasaccessoriesexpress[producta] += 1;
  //     } else {
  //       _productasaccessoriesexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?AccessoriesExpress (Product? producta) {
  //     if (_productasaccessoriesexpress.containsKey(producta) && _productasaccessoriesexpress[producta] == 1) {
  //       _productasaccessoriesexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasaccessoriesexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?AccessoriesExpress (Product? producta) {
  //     if (_productasaccessoriesexpress.containsKey(producta) && _productasaccessoriesexpress[producta] == 1) {
  //       _productasaccessoriesexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasaccessoriesexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productasaccessoriesexpress => _productasaccessoriesexpress;
  //
  //   get productaaccessorySubtotalexpress => _productasaccessoriesexpress.entries
  //       .map((productasaccessoriesexpress) => productasaccessoriesexpress.key.price * productasaccessoriesexpress.value)
  //       .toList();
  //
  //   get totalaccessoryexpress => _productasaccessoriesexpress.entries
  //       .map((productasaccessoriesexpress) => productasaccessoriesexpress.key.price * productasaccessoriesexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  // //   // .toStringAsFixed(2);
  //
  //   //Bath__________________________________________________________________________
  //   //BathDictionary
  //   var _productasbathexpress = {}.obs;
  //   //BathIncrement
  //   var bathnumberexpress = {}.obs;
  //
  //   //BathCounterInitializing
  //   int bathInitCounterExpress(Product? producta) {
  //     bathnumberexpress[producta]=0;
  //     return bathnumberexpress[producta];
  //   }
  //
  //   //BathIncrementSection
  //   int bathCounterExpress (Product? producta) {
  //     return bathnumberexpress[producta];
  //   }
  //
  //   void addBathCounterExpress(Product? producta) {
  //     if (bathnumberexpress.containsKey(producta)) {
  //       bathnumberexpress[producta] += 1;
  //     } else {
  //       bathnumberexpress[producta] = 1;
  //     }
  //   }
  //
  //   void reduceBathCounterExpress(Product? producta) {
  //     if (bathnumberexpress.containsKey(producta)  && bathnumberexpress[producta] == 1) {
  //       bathnumberexpress[producta] = 0;
  //     }
  //     if (bathnumberexpress[producta] == 0) {
  //     }
  //     else {
  //       bathnumberexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllBathCounterExpress(Product? producta) {
  //     if (bathnumberexpress.containsKey(producta) && bathnumberexpress[producta] == 1) {
  //       bathnumberexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       bathnumberexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //BathCartSection
  //
  //   //init real key value
  //   void bathInitrkvalueExpress(Product? producta) {
  //     if (_productasbathexpress.containsKey(producta)) {
  //       _productasbathexpress[producta] += 0;
  //     }
  //     else {_productasbathexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   void bathDropOutInitrkvalueExpress(Product? producta) {
  //     if (_productasbathexpress[producta] == 0) {
  //       _productasbathexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productasbathexpress[producta]+=0;}
  //   }
  //
  //   //BathRealCounterInitializing
  //   int bathInitRealCounterExpress(Product? producta) {
  //     _productasbathexpress[producta]=0;
  //     return _productasbathexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?BathExpress(Product? producta) {
  //     if (_productasbathexpress.containsKey(producta)) {
  //       _productasbathexpress[producta] += 1;
  //     } else {
  //       _productasbathexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?BathExpress (Product? producta) {
  //     if (_productasbathexpress.containsKey(producta) && _productasbathexpress[producta] == 1) {
  //       _productasbathexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasbathexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?BathExpress (Product? producta) {
  //     if (_productasbathexpress.containsKey(producta) && _productasbathexpress[producta] == 1) {
  //       _productasbathexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasbathexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productasbathexpress => _productasbathexpress;
  //
  //   get productabathSubtotalexpress => _productasbathexpress.entries
  //       .map((productasbathexpress) => productasbathexpress.key.price * productasbathexpress.value)
  //       .toList();
  //
  //   get totalbathexpress => _productasbathexpress.entries
  //       .map((productabathexpress) => productabathexpress.key.price * productabathexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  //   // .toStringAsFixed(2);
  // //
  // //
  // //
  //   //Bedding____________________________________________________________________
  //   //BeddingDictionnary
  //   var _productasbeddingexpress = {}.obs;
  //   //BeddingIncrement
  //   var beddingnumberexpress = {}.obs;
  //
  //   //BeddingCounterInitializing
  //   int beddingInitCounterExpress(Product? producta) {
  //     beddingnumberexpress[producta]=0;
  //     return beddingnumberexpress[producta];
  //   }
  //
  //   //BathIncrementSection
  //   int beddingCounterExpress (Product? producta) {
  //     return beddingnumberexpress[producta];
  //   }
  //
  //   void addBeddingCounterExpress(Product? producta) {
  //     if (beddingnumberexpress.containsKey(producta)) {
  //       beddingnumberexpress[producta] += 1;
  //     } else {
  //       beddingnumberexpress[producta] = 1;
  //     }
  //   }
  //
  //   void reduceBeddingCounterExpress(Product? producta) {
  //     if (beddingnumberexpress.containsKey(producta)  && beddingnumberexpress[producta] == 1) {
  //       beddingnumberexpress[producta] = 0;
  //     }
  //     if (beddingnumberexpress[producta] == 0) {
  //     }
  //     else {
  //       beddingnumberexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllBeddingCounterExpress(Product? producta) {
  //     if (beddingnumberexpress.containsKey(producta) && beddingnumberexpress[producta] == 1) {
  //       beddingnumberexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       beddingnumberexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //BeddingCartSection
  //
  //   //init real key value
  //   void beddingInitrkvalueExpress(Product? producta) {
  //     if (_productasbeddingexpress.containsKey(producta)) {
  //       _productasbeddingexpress[producta] += 0;
  //     }
  //     else {_productasbeddingexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   void beddingDropOutInitrkvalueExpress(Product? producta) {
  //     if (_productasbeddingexpress[producta] == 0) {
  //       _productasbeddingexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productasbeddingexpress[producta]+=0;}
  //   }
  //
  //   int beddingInitRealCounterExpress(Product? producta) {
  //     _productasbeddingexpress[producta]=0;
  //     return _productasbeddingexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?BeddingExpress(Product? producta) {
  //     if (_productasbeddingexpress.containsKey(producta)) {
  //       _productasbeddingexpress[producta] += 1;
  //     } else {
  //       _productasbeddingexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?BeddingExpress (Product? producta) {
  //     if (_productasbeddingexpress.containsKey(producta) && _productasbeddingexpress[producta] == 1) {
  //       _productasbeddingexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasbeddingexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?BeddingExpress (Product? producta) {
  //     if (_productasbeddingexpress.containsKey(producta) && _productasbeddingexpress[producta] == 1) {
  //       _productasbeddingexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasbeddingexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productasbeddingexpress => _productasbeddingexpress;
  //
  //   get productabeddingSubtotalexpress => _productasbeddingexpress.entries
  //       .map((productabeddingexpress) => productabeddingexpress.key.price * productabeddingexpress.value)
  //       .toList();
  //
  //   get totalbeddingexpress => _productasbeddingexpress.entries
  //       .map((productabeddingexpress) => productabeddingexpress.key.price * productabeddingexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  // //   // .toStringAsFixed(2);
  // //
  // //
  //   //Others___________________________________________________________________
  //   //OthersDictionary
  //   var _productasothersexpress = {}.obs;
  //   //OthersIncrement
  //   var othersnumberexpress = {}.obs;
  //
  // //OthersCounterInitializing
  //   int othersInitCounterExpress(Product? producta) {
  //     othersnumberexpress[producta]=0;
  //     return othersnumberexpress[producta];
  //   }
  //
  //   //OthersIncrementSection
  //   int othersCounterExpress (Product? producta) {
  //     return othersnumberexpress[producta];
  //   }
  //
  //   void addOthersCounterExpress(Product? producta) {
  //     if (othersnumberexpress.containsKey(producta)) {
  //       othersnumberexpress[producta] += 1;
  //     } else {
  //       othersnumberexpress[producta] = 1;
  //     }
  //   }
  //
  //   void reduceOthersCounterExpress(Product? producta) {
  //     if (othersnumberexpress.containsKey(producta)  && othersnumberexpress[producta] == 1) {
  //       othersnumberexpress[producta] = 0;
  //     }
  //     if (othersnumberexpress[producta] == 0) {
  //     }
  //     else {
  //       othersnumberexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllOthersCounterExpress(Product? producta) {
  //     if (othersnumberexpress.containsKey(producta) && othersnumberexpress[producta] == 1) {
  //       othersnumberexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       othersnumberexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //OthersCartSection
  //
  //   //init real key value
  //   void othersInitrkvalueExpress(Product? producta) {
  //     if (_productasothersexpress.containsKey(producta)) {
  //       _productasothersexpress[producta] += 0;
  //     }
  //     else {_productasothersexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   void othersDropOutInitrkvalueExpress(Product? producta) {
  //     if (_productasothersexpress[producta] == 0) {
  //       _productasothersexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productasothersexpress[producta]+=0;}
  //   }
  //
  //   //OthersRealCounterInitializing
  //   int othersInitRealCounterExpress(Product? producta) {
  //     _productasothersexpress[producta]=0;
  //     return _productasothersexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?OthersExpress(Product? producta) {
  //     if (_productasothersexpress.containsKey(producta)) {
  //       _productasothersexpress[producta] += 1;
  //     } else {
  //       _productasothersexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?OthersExpress(Product? producta) {
  //     if (_productasothersexpress.containsKey(producta) && _productasothersexpress[producta] == 1) {
  //       _productasothersexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasothersexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?OthersExpress (Product? producta) {
  //     if (_productasothersexpress.containsKey(producta) && _productasothersexpress[producta] == 1) {
  //       _productasothersexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasothersexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productasothersexpress => _productasothersexpress;
  //
  //   get productaotherSubtotalexpress => _productasothersexpress.entries
  //       .map((productaotherexpress) => productaotherexpress.key.price * productaotherexpress.value)
  //       .toList();
  //
  //   get totalotherexpress => _productasothersexpress.entries
  //       .map((productaotherexpress) => productaotherexpress.key.price * productaotherexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  // // .toStringAsFixed(2);
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  // //Super express zone___________________________________________________________________________________________
  //   // Clothes___________________________________________________________________________
  //   // ClothesDictionnary
  //
  //   //ClothesIncrement
  //   var _productaclothessuperexpress = {}.obs;
  //   var clothesnumbersuperexpres = {}.obs;
  //
  //   //ClothesCounterInitializing
  //   int clothesInitCounterSuperExpress(Product? producta) {
  //     clothesnumbersuperexpres[producta]=0;
  //     return clothesnumbersuperexpres[producta];
  //   }
  //
  //   //ClothesIncrementSection
  //   int clothesCounterSuperExpress (Product? producta) {
  //     return clothesnumbersuperexpres[producta];
  //   }
  //
  //   void addClothesCounterSuperExpress(Product? producta) {
  //     if (clothesnumbersuperexpres.containsKey(producta)) {
  //       clothesnumbersuperexpres[producta] += 1;
  //     } else {
  //       clothesnumbersuperexpres[producta] = 1;
  //     }
  //   }
  //
  //   void reduceClothesCounterSuperExpress(Product? producta) {
  //     if (clothesnumbersuperexpres.containsKey(producta)  && clothesnumbersuperexpres[producta] == 1) {
  //       // number.removeWhere((key, value) => key == producta);
  //       clothesnumbersuperexpres[producta] = 0;
  //     }
  //     if (clothesnumbersuperexpres[producta] == 0) {
  //       // number.removeWhere((key, value) => key == producta);
  //     }
  //     else {
  //       clothesnumbersuperexpres[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllClothesCounterSuperExpress(Product? producta) {
  //     if (clothesnumbersuperexpres.containsKey(producta) && clothesnumbersuperexpres[producta] == 1) {
  //       clothesnumbersuperexpres.removeWhere((key, value) => key == producta);
  //     } else {
  //       clothesnumbersuperexpres.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //ClothesCartSection
  //
  //   //init real null key value
  //   void clothesInitrkvalueSuperExpress(Product? producta) {
  //     if (_productaclothessuperexpress.containsKey(producta)) {
  //       _productaclothessuperexpress[producta] += 0;
  //     }
  //     else {_productaclothessuperexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   //init real null key value
  //   void clothesDropOutInitrkvalueSuperExpress(Product? producta) {
  //     if (_productaclothessuperexpress[producta] == 0) {
  //       _productaclothessuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productaclothessuperexpress[producta]+=0;}
  //   }
  //
  //   //init clothe real key
  //   int clothesInitRealCounterSuperExpess(Product? producta) {
  //     _productaclothessuperexpress[producta]=0;
  //     return _productaclothessuperexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?ClothesSuperExpress(Product? producta) {
  //     if (_productaclothessuperexpress.containsKey(producta)) {
  //       _productaclothessuperexpress[producta] += 1;
  //     } else {
  //       _productaclothessuperexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?ClothesSuperExpress(Product? producta) {
  //     if (_productaclothessuperexpress.containsKey(producta) && _productaclothessuperexpress[producta] == 1) {
  //       _productaclothessuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productaclothessuperexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?ClothesSuperExpress (Product? producta) {
  //     if (_productaclothessuperexpress.containsKey(producta) && _productaclothessuperexpress[producta] == 1) {
  //       _productaclothessuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productaclothessuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productasclothessuperexpress => _productaclothessuperexpress;
  //
  //   get productasclotheSubtotalSuperExpress => _productaclothessuperexpress.entries
  //       .map((productasclothessuperexpress) => productasclothessuperexpress.key.price * productasclothessuperexpress.value)
  //       .toList();
  //
  //   get totalclothsuperexpress => _productaclothessuperexpress.entries
  //       .map((productasclothessuperexpress) => productasclothessuperexpress.key.price * productasclothessuperexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  //   // .toStringAsFixed(2);
  //
  //
  //   //Special__________________________________________________________________
  //   //SpecialDictionnary
  //   var _productaspecialsuperexpress = {}.obs;
  //   //SpecialIncrement
  //   var specialnumbersuperexpress = {}.obs;
  //
  //   //SpecialCounterInitializing
  //   int specialInitCounterSuperExpress(Product? producta) {
  //     specialnumbersuperexpress[producta]=0;
  //     return specialnumbersuperexpress[producta];
  //   }
  //
  //   //SpecialIncrementSection
  //   int specialCounterSuperExpress (Product? producta) {
  //     return specialnumbersuperexpress[producta];
  //   }
  //
  //   void addSpecialCounterSuperExpress(Product? producta) {
  //     if (specialnumbersuperexpress.containsKey(producta)) {
  //       specialnumbersuperexpress[producta] += 1;
  //     } else {
  //       specialnumbersuperexpress[producta] = 1;
  //     }
  //   }
  //
  //   void reduceSpecialCounterSuperExpress(Product? producta) {
  //     if (specialnumbersuperexpress.containsKey(producta)  && specialnumbersuperexpress[producta] == 1) {
  //       // number.removeWhere((key, value) => key == producta);
  //       specialnumbersuperexpress[producta] = 0;
  //     }
  //     if (specialnumbersuperexpress[producta] == 0) {
  //       // number.removeWhere((key, value) => key == producta);
  //     }
  //     else {
  //       specialnumbersuperexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllSpecialCounterSuperExpress(Product? producta) {
  //     if (specialnumbersuperexpress.containsKey(producta) && specialnumbersuperexpress[producta] == 1) {
  //       specialnumbersuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       specialnumbersuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //SpecialCartSection
  //
  //   //init real key value
  //   void specialInitrkvalueSuperExpress(Product? producta) {
  //     if (_productaspecialsuperexpress.containsKey(producta)) {
  //       _productaspecialsuperexpress[producta] += 0;
  //     }
  //     else {_productaspecialsuperexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   void specialDropOutInitrkvalueSuperExpress(Product? producta) {
  //     if (_productaspecialsuperexpress[producta] == 0) {
  //       _productaspecialsuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productaspecialexpress[producta]+=0;}
  //   }
  //
  //   int specialInitRealCounterSuperExpress(Product? producta) {
  //     _productaspecialsuperexpress[producta]=0;
  //     return _productaspecialsuperexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?SpecialSuperExpress(Product? producta) {
  //     if (_productaspecialsuperexpress.containsKey(producta)) {
  //       _productaspecialsuperexpress[producta] += 1;
  //     } else {
  //       _productaspecialsuperexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?SpecialSuperExpress (Product? producta) {
  //     if (_productaspecialsuperexpress.containsKey(producta) && _productaspecialsuperexpress[producta] == 1) {
  //       _productaspecialsuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productaspecialsuperexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?SpecialSuperExpress (Product? producta) {
  //     if (_productaspecialsuperexpress.containsKey(producta) && _productaspecialsuperexpress[producta] == 1) {
  //       _productaspecialsuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productaspecialexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productaspecialsuperexpress => _productaspecialsuperexpress;
  //
  //   get productaspecialSubtotalsuperexpress => _productaspecialsuperexpress.entries
  //       .map((productaspecialsuperexpress) => productaspecialsuperexpress.key.price * productaspecialsuperexpress.value)
  //       .toList();
  //
  //   get totalspecialsuperexpress => _productaspecialsuperexpress.entries
  //       .map((productaspecialsuperexpress) => productaspecialsuperexpress.key.price * productaspecialsuperexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  // //   // .toStringAsFixed(2);
  //
  //
  //   //Accessories__________________________________________________________________
  //   //AccessoriesDictionary
  //   var _productasaccessoriessuperexpress = {}.obs;
  //   //AccessoriesIncrement
  //   var accessoriesnumbersuperexpress = {}.obs;
  //
  //   //AccessoriesCounterInitializing
  //   int accessoriesInitCounterSuperExpress(Product? producta) {
  //     accessoriesnumbersuperexpress[producta]=0;
  //     return accessoriesnumbersuperexpress[producta];
  //   }
  //
  //   //AccessoriesIncrementSection
  //   int accessoriesCounterSuperExpress (Product? producta) {
  //     return accessoriesnumbersuperexpress[producta];
  //   }
  //
  //   void addAccessoriesCounterSuperExpress(Product? producta) {
  //     if (accessoriesnumbersuperexpress.containsKey(producta)) {
  //       accessoriesnumbersuperexpress[producta] += 1;
  //     } else {
  //       accessoriesnumbersuperexpress[producta] = 1;
  //     }
  //   }
  //
  //   void reduceAccessoriesCounterSuperExpress(Product? producta) {
  //     if (accessoriesnumbersuperexpress.containsKey(producta)  && accessoriesnumbersuperexpress[producta] == 1) {
  //       accessoriesnumbersuperexpress[producta] = 0;
  //     }
  //     if (accessoriesnumbersuperexpress[producta] == 0) {
  //     }
  //     else {
  //       accessoriesnumbersuperexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllAccessoriesCounterSuperExpress(Product? producta) {
  //     if (accessoriesnumbersuperexpress.containsKey(producta) && accessoriesnumbersuperexpress[producta] == 1) {
  //       accessoriesnumbersuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       accessoriesnumbersuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //AccessoiresCartSection
  //
  //   //init real key value
  //   void accessoriesInitrkvalueSuperExpress(Product? producta) {
  //     if (_productasaccessoriessuperexpress.containsKey(producta)) {
  //       _productasaccessoriessuperexpress[producta] += 0;
  //     }
  //     else {_productasaccessoriessuperexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   void accessoriesDropOutInitrkvalueSuperExpress(Product? producta) {
  //     if (_productasaccessoriessuperexpress[producta] == 0) {
  //       _productasaccessoriessuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productasaccessoriessuperexpress[producta]+=0;}
  //   }
  //
  //   int accessoriesInitRealCounterSuperExpress(Product? producta) {
  //     _productasaccessoriessuperexpress[producta]=0;
  //     return _productasaccessoriessuperexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?AccessoriesSuperExpress(Product? producta) {
  //     if (_productasaccessoriessuperexpress.containsKey(producta)) {
  //       _productasaccessoriessuperexpress[producta] += 1;
  //     } else {
  //       _productasaccessoriessuperexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?AccessoriesSuperExpress (Product? producta) {
  //     if (_productasaccessoriessuperexpress.containsKey(producta) && _productasaccessoriessuperexpress[producta] == 1) {
  //       _productasaccessoriessuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasaccessoriessuperexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?AccessoriesSuperExpress (Product? producta) {
  //     if (_productasaccessoriessuperexpress.containsKey(producta) && _productasaccessoriessuperexpress[producta] == 1) {
  //       _productasaccessoriessuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasaccessoriessuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productasaccessoriessuperexpress => _productasaccessoriessuperexpress;
  //
  //   get productaaccessorySubtotalsuperexpress => _productasaccessoriessuperexpress.entries
  //       .map((productasaccessoriessuperexpress) => productasaccessoriessuperexpress.key.price * productasaccessoriessuperexpress.value)
  //       .toList();
  //
  //   get totalaccessorysuperexpress => _productasaccessoriessuperexpress.entries
  //       .map((productasaccessoriessuperexpress) => productasaccessoriessuperexpress.key.price * productasaccessoriessuperexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  // //   // .toStringAsFixed(2);
  //
  //   //Bath__________________________________________________________________________
  //   //BathDictionary
  //   var _productasbathsuperexpress = {}.obs;
  //   //BathIncrement
  //   var bathnumbersuperexpress = {}.obs;
  //
  //   //BathCounterInitializing
  //   int bathInitCounterSuperExpress(Product? producta) {
  //     bathnumbersuperexpress[producta]=0;
  //     return bathnumbersuperexpress[producta];
  //   }
  //
  //   //BathIncrementSection
  //   int bathCounterSuperExpress (Product? producta) {
  //     return bathnumbersuperexpress[producta];
  //   }
  //
  //   void addBathCounterSuperExpress(Product? producta) {
  //     if (bathnumbersuperexpress.containsKey(producta)) {
  //       bathnumbersuperexpress[producta] += 1;
  //     } else {
  //       bathnumbersuperexpress[producta] = 1;
  //     }
  //   }
  //
  //   void reduceBathCounterSuperExpress(Product? producta) {
  //     if (bathnumbersuperexpress.containsKey(producta)  && bathnumbersuperexpress[producta] == 1) {
  //       bathnumbersuperexpress[producta] = 0;
  //     }
  //     if (bathnumbersuperexpress[producta] == 0) {
  //     }
  //     else {
  //       bathnumbersuperexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllBathCounterSuperExpress(Product? producta) {
  //     if (bathnumbersuperexpress.containsKey(producta) && bathnumbersuperexpress[producta] == 1) {
  //       bathnumbersuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       bathnumbersuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //BathCartSection
  //
  //   //init real key value
  //   void bathInitrkvalueSuperExpress(Product? producta) {
  //     if (_productasbathsuperexpress.containsKey(producta)) {
  //       _productasbathsuperexpress[producta] += 0;
  //     }
  //     else {_productasbathsuperexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   void bathDropOutInitrkvalueSuperExpress(Product? producta) {
  //     if (_productasbathsuperexpress[producta] == 0) {
  //       _productasbathsuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productasbathsuperexpress[producta]+=0;}
  //   }
  //
  //   //BathRealCounterInitializing
  //   int bathInitRealCounterSuperExpress(Product? producta) {
  //     _productasbathsuperexpress[producta]=0;
  //     return _productasbathsuperexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?BathSuperExpress(Product? producta) {
  //     if (_productasbathsuperexpress.containsKey(producta)) {
  //       _productasbathsuperexpress[producta] += 1;
  //     } else {
  //       _productasbathsuperexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?BathSuperExpress (Product? producta) {
  //     if (_productasbathsuperexpress.containsKey(producta) && _productasbathsuperexpress[producta] == 1) {
  //       _productasbathsuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasbathsuperexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?BathSuperExpress (Product? producta) {
  //     if (_productasbathsuperexpress.containsKey(producta) && _productasbathsuperexpress[producta] == 1) {
  //       _productasbathsuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasbathsuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productasbathsuperexpress => _productasbathsuperexpress;
  //
  //   get productabathSubtotalsuperexpress => _productasbathsuperexpress.entries
  //       .map((productasbathsuperexpress) => productasbathsuperexpress.key.price * productasbathsuperexpress.value)
  //       .toList();
  //
  //   get totalbathesuperxpress => _productasbathsuperexpress.entries
  //       .map((productabathsuperexpress) => productabathsuperexpress.key.price * productabathsuperexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  //   // .toStringAsFixed(2);
  // //
  // //
  // //
  //   //Bedding____________________________________________________________________
  //   //BeddingDictionnary
  //   var _productasbeddingsuperexpress = {}.obs;
  //   //BeddingIncrement
  //   var beddingnumbersuperexpress = {}.obs;
  //
  //   //BeddingCounterInitializing
  //   int beddingInitCounterSuperExpress(Product? producta) {
  //     beddingnumbersuperexpress[producta]=0;
  //     return beddingnumbersuperexpress[producta];
  //   }
  //
  //   //BathIncrementSection
  //   int beddingCounterSuperExpress (Product? producta) {
  //     return beddingnumbersuperexpress[producta];
  //   }
  //
  //   void addBeddingCounterSuperExpress(Product? producta) {
  //     if (beddingnumbersuperexpress.containsKey(producta)) {
  //       beddingnumbersuperexpress[producta] += 1;
  //     } else {
  //       beddingnumbersuperexpress[producta] = 1;
  //     }
  //   }
  //
  //   void reduceBeddingCounterSuperExpress(Product? producta) {
  //     if (beddingnumbersuperexpress.containsKey(producta)  && beddingnumbersuperexpress[producta] == 1) {
  //       beddingnumbersuperexpress[producta] = 0;
  //     }
  //     if (beddingnumbersuperexpress[producta] == 0) {
  //     }
  //     else {
  //       beddingnumbersuperexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllBeddingCounterSuperExpress(Product? producta) {
  //     if (beddingnumbersuperexpress.containsKey(producta) && beddingnumbersuperexpress[producta] == 1) {
  //       beddingnumbersuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       beddingnumbersuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //BeddingCartSection
  //
  //   //init real key value
  //   void beddingInitrkvalueSuperExpress(Product? producta) {
  //     if (_productasbeddingsuperexpress.containsKey(producta)) {
  //       _productasbeddingsuperexpress[producta] += 0;
  //     }
  //     else {_productasbeddingsuperexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   void beddingDropOutInitrkvalueSuperExpress(Product? producta) {
  //     if (_productasbeddingsuperexpress[producta] == 0) {
  //       _productasbeddingsuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productasbeddingsuperexpress[producta]+=0;}
  //   }
  //
  //   int beddingInitRealCounterSuperExpress(Product? producta) {
  //     _productasbeddingsuperexpress[producta]=0;
  //     return _productasbeddingsuperexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?BeddingSuperExpress(Product? producta) {
  //     if (_productasbeddingsuperexpress.containsKey(producta)) {
  //       _productasbeddingsuperexpress[producta] += 1;
  //     } else {
  //       _productasbeddingsuperexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?BeddingSuperExpress (Product? producta) {
  //     if (_productasbeddingsuperexpress.containsKey(producta) && _productasbeddingsuperexpress[producta] == 1) {
  //       _productasbeddingsuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasbeddingsuperexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?BeddingSuperExpress (Product? producta) {
  //     if (_productasbeddingsuperexpress.containsKey(producta) && _productasbeddingsuperexpress[producta] == 1) {
  //       _productasbeddingsuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasbeddingsuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productasbeddingsuperexpress => _productasbeddingsuperexpress;
  //
  //   get productabeddingSubtotalsuperexpress => _productasbeddingsuperexpress.entries
  //       .map((productabeddingsuperexpress) => productabeddingsuperexpress.key.price * productabeddingsuperexpress.value)
  //       .toList();
  //
  //   get totalbeddingsuperexpress => _productasbeddingsuperexpress.entries
  //       .map((productabeddingsuperexpress) => productabeddingsuperexpress.key.price * productabeddingsuperexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  // //   // .toStringAsFixed(2);
  // //
  // //
  //   //Others___________________________________________________________________
  //   //OthersDictionary
  //   var _productasotherssuperexpress = {}.obs;
  //   //OthersIncrement
  //   var othersnumbersuperexpress = {}.obs;
  //
  // //OthersCounterInitializing
  //   int othersInitCounterSuperExpress(Product? producta) {
  //     othersnumbersuperexpress[producta]=0;
  //     return othersnumbersuperexpress[producta];
  //   }
  //
  //   //OthersIncrementSection
  //   int othersCounterSuperExpress (Product? producta) {
  //     return othersnumbersuperexpress[producta];
  //   }
  //
  //   void addOthersCounterSuperExpress(Product? producta) {
  //     if (othersnumbersuperexpress.containsKey(producta)) {
  //       othersnumbersuperexpress[producta] += 1;
  //     } else {
  //       othersnumbersuperexpress[producta] = 1;
  //     }
  //   }
  //
  //   void reduceOthersCounterSuperExpress(Product? producta) {
  //     if (othersnumbersuperexpress.containsKey(producta)  && othersnumbersuperexpress[producta] == 1) {
  //       othersnumbersuperexpress[producta] = 0;
  //     }
  //     if (othersnumbersuperexpress[producta] == 0) {
  //     }
  //     else {
  //       othersnumbersuperexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void reduceAllOthersCounterSuperExpress(Product? producta) {
  //     if (othersnumbersuperexpress.containsKey(producta) && othersnumbersuperexpress[producta] == 1) {
  //       othersnumbersuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       othersnumbersuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   //OthersCartSection
  //
  //   //init real key value
  //   void othersInitrkvalueSuperExpress(Product? producta) {
  //     if (_productasothersexpress.containsKey(producta)) {
  //       _productasothersexpress[producta] += 0;
  //     }
  //     else {_productasothersexpress[producta]=0;}
  //     // return _productasclothes[producta];
  //   }
  //
  //   void othersDropOutInitrkvalueSuperExpress(Product? producta) {
  //     if (_productasothersexpress[producta] == 0) {
  //       _productasothersexpress.removeWhere((key, value) => key == producta);
  //     }
  //     else {_productasothersexpress[producta]+=0;}
  //   }
  //
  //   //OthersRealCounterInitializing
  //   int othersInitRealCounterSuperExpress(Product? producta) {
  //     _productasotherssuperexpress[producta]=0;
  //     return _productasotherssuperexpress[producta];
  //   }
  //
  //   //Add productas
  //   void addProduct?OthersSuperExpress(Product? producta) {
  //     if (_productasotherssuperexpress.containsKey(producta)) {
  //       _productasotherssuperexpress[producta] += 1;
  //     } else {
  //       _productasotherssuperexpress[producta] = 1;
  //     }
  //
  //     Get.snackbar(
  //       "Produit ajouté",
  //       "Vous avez ajouté un(e) ${producta.nameproducta} au panier",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //     );
  //   }
  //
  //   void removeProduct?OthersSuperExpress(Product? producta) {
  //     if (_productasotherssuperexpress.containsKey(producta) && _productasotherssuperexpress[producta] == 1) {
  //       _productasotherssuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasotherssuperexpress[producta] -= 1;
  //     }
  //   }
  //
  //   void removeAllProduct?OthersSuperExpress (Product? producta) {
  //     if (_productasotherssuperexpress.containsKey(producta) && _productasotherssuperexpress[producta] == 1) {
  //       _productasotherssuperexpress.removeWhere((key, value) => key == producta);
  //     } else {
  //       _productasotherssuperexpress.removeWhere((key, value) => key == producta);
  //     }
  //   }
  //
  //   get productasotherssuperexpress => _productasotherssuperexpress;
  //
  //   get productaotherSubtotalsuperexpress => _productasotherssuperexpress.entries
  //       .map((productaothersuperexpress) => productaothersuperexpress.key.price * productaothersuperexpress.value)
  //       .toList();
  //
  //   get totalothersuperexpress => _productasotherssuperexpress.entries
  //       .map((productaothersuperexpress) => productaothersuperexpress.key.price * productaothersuperexpress.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  // // .toStringAsFixed(2);
  //

  get globalprint =>
      [
            totalclothe, totalspecial, totalbath, totalbedding, totalaccessory,
            totalother,
            // totalclothexpress, totalspecialexpress, totalbathexpress, totalbeddingexpress, totalaccessoryexpress, totalotherexpress,
            // totalclothsuperexpress, totalspecialsuperexpress, totalbathesuperxpress, totalbeddingsuperexpress, totalaccessorysuperexpress, totalothersuperexpress
          ]
          // .map((globalsom) => globalsom as double)
          .toList();

  get globalsom => [
        totalclothe, totalspecial, totalbath, totalbedding, totalaccessory,
        totalother,
        // totalclothexpress, totalspecialexpress, totalbathexpress, totalbeddingexpress, totalaccessoryexpress, totalotherexpress,
        // totalclothsuperexpress, totalspecialsuperexpress, totalbathesuperxpress, totalbeddingsuperexpress, totalaccessorysuperexpress, totalothersuperexpress
      ]
      .map((globalsom) => globalsom as double)
      .toList()
      .reduce((value, element) => value + element);
  // .toStringAsFixed(0);

  // void getTheLength() {

  // }

  // void ifRemise() {
  //   for (i = 0;
  //       i <
  //           othersnumber.length +
  //               clothesnumber.length +
  //               specialnumber.length +
  //               accessoriesnumber.length +
  //               bathnumber.length +
  //               beddingnumber.length;
  //       i++) {
  //     aVarClothes += getListClothes[i];
  //     aVarSpe += getListSpe[i];
  //     aVarAcc += getListAcc[i];
  //     aVarBath += getListBath[i];
  //     aVarBedding += getListBedding[i];
  //     aVarOthers += getListOthers[i];
  //   }
  // }

  //   int i = 0;
  //   var aVar = 0.0;
  //   var aVarClothes = 0.0;
  //   var aVarSpe = 0.0;
  //   var aVarAcc = 0.0;
  //   var aVarBath = 0.0;
  //   var aVarBedding = 0.0;
  //   var aVarOthers = 0.0;

  //   get getClothes =>
  //       _productas.entries.map((productaclothe) => productaclothe.value);

  //   get getListClothes =>
  //       _productas.entries.map((productaclothe) => productaclothe.value).toList();

  //   get getLengthClothes => _productas.entries
  //       .map((productaclothe) => productaclothe.value)
  //       .toList()
  //       .length;

  //   get getOneElement => getListClothes[0];

  // //&& must use the following function for the remise
  //   void ifRemiseClothes() {
  //     for (i = 0; i < getLengthClothes + 1; i++) {
  //       aVarClothes += getListClothes[i];
  //     }
  //   }

  //   get expVarClothes => aVarClothes;

  // //---
  //   get getListSpe => _productaspe.entries
  //       .map((productaspecial) => productaspecial.value)
  //       .toList();

  //   get getLengthSpe => _productaspe.entries
  //       .map((productaspecial) => productaspecial.value)
  //       .toList()
  //       .length;

  //   void ifRemiseSpe() {
  //     for (i = 0; i < getLengthSpe + 1; i++) {
  //       aVarSpe += getListSpe[i];
  //     }
  //   }

  //   get expVarSpe => aVarSpe;

  // //---
  //   get getListAcc => _productasaccessories.entries
  //       .map((productasaccessories) => productasaccessories.value)
  //       .toList();

  //   get getLengthAcc => _productasaccessories.entries
  //       .map((productasaccessories) => productasaccessories.value)
  //       .toList()
  //       .length;

  //   void ifRemiseAcc() {
  //     for (i = 0; i < getLengthAcc + 1; i++) {
  //       aVarAcc += getListAcc[i];
  //     }
  //   }

  //   get expVarAcc => aVarAcc;

  // //---
  //   get getListBath => _productasbath.entries
  //       .map((productasbath) => productasbath.value)
  //       .toList();

  //   get getLengthBath => _productasbath.entries
  //       .map((productasbath) => productasbath.value)
  //       .toList()
  //       .length;

  //   void ifRemiseBath() {
  //     for (i = 0; i < getLengthBath + 1; i++) {
  //       aVarBath += getListBath[i];
  //     }
  //   }

  //   get expVarBath => aVarBath;

  // //---
  //   get getListBedding => _productasbedding.entries
  //       .map((productasbedding) => productasbedding.value)
  //       .toList();

  //   get getLengthBedding => _productasbedding.entries
  //       .map((productasbedding) => productasbedding.value)
  //       .toList()
  //       .length;

  //   void ifRemiseBedding() {
  //     for (i = 0; i < getLengthBedding + 1; i++) {
  //       aVarBedding += getListBedding[i];
  //     }
  //   }

  //   get expVarBedding => aVarBedding;

  // //---
  //   get getListOthers => _productasothers.entries
  //       .map((productaother) => productaother.value)
  //       .toList();

  //   get getLengthOthers => _productasothers.entries
  //       .map((productaother) => productaother.value)
  //       .toList()
  //       .length;

  //   void ifRemiseOthers() {
  //     for (i = 0; i < getLengthOthers + 1; i++) {
  //       aVarOthers += getListOthers[i];
  //     }
  //   }

  //   get expVarOthers => aVarOthers;

  // void ifRemise() {
  //   for (i = 0; i < 17; i++) {
  //     aVar = getListClothes[i] +
  //         getListSpe[i] +
  //         getListAcc[i] +
  //         getListBath[i] +
  //         getListBedding[i] +
  //         aVar;
  //   }
  // }

  // get expVarAll => aVar;

  // void ifRemise() {
  //   for (i = 0; i < 17; i++) {
  //     aVarClothes += getListClothes[i];
  //     aVarSpe += getListSpe[i];
  //     aVarAcc += getListAcc[i];
  //     aVarBath += getListBath[i];
  //     aVarBedding += getListBedding[i];
  //     aVarOthers += getListOthers[i];
  //   }
  // }

  // void ifRemise() {
  //   for (i = 0; i < getLengthClothes + 1; i++) {
  //     aVarClothes += getListClothes[i];
  //     for (i = 0; i < getLengthBedding + 1; i++) {
  //       aVarBedding += getListBedding[i];
  //       for (i = 0; i < getLengthAcc + 1; i++) {
  //         aVarAcc += getListAcc[i];
  //         for (i = 0; i < getLengthBath + 1; i++) {
  //           aVarBath += getListBath[i];
  //           for (i = 0; i < getLengthSpe + 1; i++) {
  //             aVarSpe += getListSpe[i];
  //           }
  //         }
  //       }
  //     }

  //   }
  // }

  // void ifRemise() {
  //   for (i = 0; i < getLengthClothes + 1; i++) {
  //     aVarClothes += getListClothes[i];
  //     for (i = 0; i < getLengthSpe + 1; i++) {
  //       aVarSpe += getListSpe[i];
  //     }
  //   }
  //   for (i = 0; i < getLengthSpe + 1; i++) {
  //     aVarSpe += getListSpe[i];
  //   }
  //   for (i = 0; i < getLengthAcc + 1; i++) {
  //     aVarAcc += getListAcc[i];
  //   }
  //   for (i = 0; i < getLengthBath + 1; i++) {
  //     aVarBath += getListBath[i];
  //   }
  //   for (i = 0; i < getLengthBedding + 1; i++) {
  //     aVarBedding += getListBedding[i];
  //   }
  //   for (i = 0; i < getLengthOthers + 1; i++) {
  //     aVarOthers += getListOthers[i];
  //   }
  // }

  // var varAll = 0.0;
  // void sumUpRemise() {
  //   varAll =
  //       aVarAcc + aVarBath + aVarClothes + aVarSpe + aVarBedding + aVarOthers;
  // }

  // get expVarAll => varAll;

  // get expVarAll =>
  //     aVarOthers + aVarClothes + aVarSpe + aVarAcc + aVarBath + aVarBedding;
  //get getOneElement => getLengthi[0];
  //____________________________________________________________________________________

  //Add 5000 if super express____________________________________________________________________________________
  //____________________________________________________________________________________
  var addedSuExpress = {}.obs;
  var realTotal = 0.0;
  var ifCinqMilles = 0.0;

  void reduceSuExpressCounter(Product? producta) {
    if (addedSuExpress.containsKey(producta) && addedSuExpress[producta] == 1) {
      // number.removeWhere((key, value) => key == producta);
      addedSuExpress[producta] = 0;
    }
    if (addedSuExpress[producta] == 0) {
      // number.removeWhere((key, value) => key == producta);
    } else {
      addedSuExpress[producta] -= 1;
    }
  }

  void addSuExpressCounter(Product? producta) {
    if (addedSuExpress.containsKey(producta)) {
      addedSuExpress[producta] += 1;
    } else {
      addedSuExpress[producta] = 1;
    }
  }

  int initSuExpressCounter(Product? producta) {
    addedSuExpress[producta] = 0;
    return addedSuExpress[producta];
  }

  int performButtonBySuExpressCounter(Product? producta) {
    if (addedSuExpress[producta] == null) {
      addedSuExpress[producta] = 0;
    } else {
      addedSuExpress[producta] += 0;
    }
    return addedSuExpress[producta];
  }

  get productSuExpress => addedSuExpress;

  get productSuExpressSubtotal =>
      addedSuExpress.entries
          .map(
            (productaclothe) => productaclothe.key.price * productaclothe.value,
          )
          .toList();

  get totalSuExpress {
    final list =
        addedSuExpress.entries
            .map(
              (productaclothe) =>
                  productaclothe.key.price * productaclothe.value,
            )
            .toList();
    return list.isEmpty
        ? 0.0
        : list.reduce((value, element) => value + element);
    // .toStringAsFixed(2);
  }

  void ifSuExpress() {
    if (totalSuExpress != 0) {
      ifCinqMilles = 3000.0;
      // _productas[producta] = 1;
    } else {
      ifCinqMilles = 0.0;
    }
  }

  var theRemiseTen = 0.0;
  var theRemiseTwenty = 0.0;

  void ifRemise() {
    realTotal = globalsom + ifCinqMilles;
    if (totalOfArticles >= 20) {
      theRemiseTwenty = (globalsom * 20) / 100;
    }
    if (totalOfArticles > 9 && totalOfArticles < 20) {
      theRemiseTen = (globalsom * 15) / 100;
    } else {}
  }

  void initRemise() {
    theRemiseTwenty = 0.0;

    theRemiseTen = 0.0;
  }
  // if (sign == 0) {
  //   shipping = 2000;
  // } else {
  //   shipping += 0;
  // }

  // if (totalSuExpress != 0) {
  //   ifCinqMilles = 5000;
  //   // _productas[producta] = 1;
  // } else {
  //   ifCinqMilles = 0;
  // }

  // _productas[producta] = 1;
  //}

  get printTheRemiseTen => theRemiseTen;
  get printTheRemiseTwenty => theRemiseTwenty;
  get printTotal => realTotal;
  get printIfCinqMilles => ifCinqMilles;
}
