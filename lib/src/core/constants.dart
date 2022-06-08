class Constants {
  //Text
  static const String textEmail = 'Email';
  static const String textPass = 'Contraseña';
  static const String textUserName = 'Nombre de usuario';
  static const String textOptionPhoto = 'Elige una opción';
  static const String textCamera = 'Cámara';
  static const String textGallery = 'Galería';
  static const String textRegistration = 'Registro';
  static const String textRegistered = 'Registrado correctamente';
  static const String textEditProfile = 'Editar perfil';
  static const String textFavorite = 'Favoritos';
  static const String textPoint = 'Puntos';
  static const String textLogOut = 'Cerrar sesión';
  static const String textInfo = 'Información';
  static const String textFilter = 'Filtrar por...';
  static const String textOrder = 'Ordenar por...';

  //Button
  static const String buttonLogin = 'INICIAR SESIÓN';
  static const String buttonSingUp = 'REGISTRARSE';
  static const String buttonSingUpLogin = 'REGISTRESE AQUÍ';
  static const String buttonSingIn = 'INICIE SESIÓN';
  static const String buttonOk = 'OK';
  static const String buttonUpdateProfile = 'MODIFICAR';
  static const String buttonApply = 'APLICAR';
  static const String buttonCancel = 'CANCELAR';
  static const String selectDate = 'SELECCIONAR FECHAS';
  static const String selectRoom = 'SELECCIONAR HABITACIONES';
  static const String btnFilter = 'FILTRAR';

  //Login
  static const String textCuenta = "¿No tiene cuenta? ";
  static const String textOr = 'o';
  static const String textSingIn = 'Inicie sesión con';

  //Routes
  static const String routesSplash = 'splash_screen';
  static const String routesLogin = 'login';
  static const String routesSingUp = 'sing_up';
  static const String routesHome = 'home';
  static const String routesFavorite = 'favorite';
  static const String routesProfile = 'profile';
  static const String routesEditProfile = 'edit_profile';
  static const String routesFilter = 'filter';
  static const String routesRoom = 'room';

  //Sing up
  static const String singAccount = "¿Ya tiene cuenta? ";

  //Firebase
  static const String userColl = 'users';

  //User
  static const String userId = 'id';
  static const String userUserName = 'userName';
  static const String userEmail = 'email';
  static const String userPass = 'password';
  static const String userAvatar = 'avatar';
  static const String userPoint = 'point';
  static const String userFav = 'fav';

  //Error
  static const String strEmpty = 'Rellene el campo';
  static const String errorFormatEmail = 'El formato de email no es válido';
  static const String errorLenghtPass =
      'La contraseña debe tener al menos 8 caracteres';
  static const String error = 'Error';
  static const String emailRegistered = 'El email ya está registrado';
  static const String userNotFound = 'Usuario no encontrado';
  static const String wrongPass = 'Contraseña incorrecta';
  static const String wrongUserOrPass = 'Usuario o contraseña incorrectos';
  static const String someChange = 'Modifique algún campo';
  static const String recentLogin = 'Requiere inicio de sesión reciente';
  static const String emailInUse = 'Email ya en uso';

  //Provider
  static const String provider = 'Provider';
  static const String provGoogle = 'Google';
  static const String provEmail = 'Email';

  //Loading
  static const String loadSingUp = 'Registrando';
  static const String loadLogin = 'Iniciando sesión';
  static const String loadUpdate = 'Modificando usuario';

  //BottomAppBar
  static const String bAppBarHome = 'Inicio';
  static const String bAppBarFav = 'Favoritos';

  //profile
  static const String defaultImage =
      'https://www.softzone.es/app/uploads-softzone.es/2018/04/guest.png';

  //points
  static const String point = 'Puntos: ';
  static const String discount = 'Descuento: ';
  static const String code = 'Código: ';

  //tooltip
  static const String tooltipFilter = 'Filtrar';
  static const String tooltipOrderBy = 'Orden ';

  //order_by
  static const String orderPrice = 'Precio';
  static const String orderAssessment = 'Valoración ';

  //filter
  static const String txtFilter = 'Filtros';
  static const String filterDate = 'Fechas:';
  static const String txtSelectDate = 'Seleccionar fechas';
  static const String hintStartDate = 'Fecha entrada';
  static const String hintEndDate = 'Fecha salida';
  static const String filterRoom = 'Nº habitaciones:';
  static const String priceNight = 'Precio por noche:';
  static const String hotelCateg = 'Categoría del hotel:';
  static const String assessment = 'Valoración:';

  //room
  static const String rooms = 'Habitaciones: ';
  static const String adult = 'Adultos: ';
  static const String children = 'Niños: ';
  static const String room = 'Habitación ';

  //hotel
  static const String hotelId = 'idHotel';
  static const String hotelDescription = 'description';
  static const String hotelName = 'hotelName';
  static const String hotelLocation = 'location';
  static const String hotelStar = 'star';
  static const String hotelPhoto = 'photo';
  static const String hotelService = 'service';
  static const String hotelReview = 'review';

  //review
  static const String reviewId = 'idReview';
  static const String reviewIdHotel = 'idHotel';
  static const String reviewIdUser = 'idUser';
  static const String reviewScore = 'score';
  static const String reviewComment = 'comment';

  //offer
  static const String offerId = 'idOffert';
  static const String offerIdHotel = 'idHotel';
  static const String offerDestiny = 'destiny';
  static const String offerWebsite = 'website';
  static const String offerPriceNight = 'priceNight';
  static const String offerPriceFinal = 'priceFinal';
  static const String offerDateStart = 'dateStart';
  static const String offerDateEnd = 'dateEnd';
  static const String offerPerson = 'person';
  static const String offerRoom = 'room';

  //favorite
  static const String favId = 'idFav';
  static const String favIdHotel = 'idHotel';
  static const String favIdUser = 'idUser';
  static const String favLocation = 'location';
}
