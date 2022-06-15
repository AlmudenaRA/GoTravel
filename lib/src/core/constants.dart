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
  static const String btnOffer = 'OFERTA';
  static const String btnOtherOffer = 'OTRAS OFERTAS';

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
  static const String routesDetailHotel = 'detailHotel';

  //Collection
  static const String collectionUser = 'users';
  static const String collectionHotel = 'hotel';
  static const String collectionOffer = 'offer';
  static const String collectionReview = 'review';

  //Login
  static const String textCuenta = "¿No tiene cuenta? ";
  static const String textOr = 'o';
  static const String textSingIn = 'Inicie sesión con';

  //Sing up
  static const String singAccount = "¿Ya tiene cuenta? ";

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
  static const String load = 'Cargando..';
  static const String loadSingUp = 'Registrando usuario, por favor espere';
  static const String loadLogin = 'Iniciando sesión de forma segura';
  static const String loadUpdate = 'Modificando usuario, por favor espere';

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
  static const String tooltipSearch = 'Buscar ';

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
  static const String hotelImageUnavailable =
      'https://www.torrenuevacosta.com/images/no-imagen-109.jpg';

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
  static const String offerListHotel = 'listHotel';
  static const String offUrlPage = 'urlPage';
  static const String offTxtWeb = 'por noche en ';
  static const String offTxtPriceNight = ' noches por  ';

  //favorite
  static const String favId = 'idFav';
  static const String favIdHotel = 'idHotel';
  static const String favIdUser = 'idUser';
  static const String favLocation = 'location';

  //Details
  static const String detDescription = 'Descripción:';
  static const String detReview = 'Reseñas:';
  static const String description =
      'El Hostal Castilla está situado entre las estaciones de metro de Alonso Martínez y Colón y ofrece habitaciones con calefacción, balcón y vistas a la ciudad. El establecimiento se encuentra a 15 minutos a pie del famoso parque del Retiro. Las habitaciones presentan una decoración sencilla y cuentan con camas individuales, armario y TV. Algunas habitaciones tienen baño privado con bañera. Se proporcionan toallas y ropa de cama. El Hostal Castilla alberga una cocina compartida donde se sirve el desayuno todas las mañanas. Incluye microondas, cafetera y nevera. La animada Puerta del Sol está bien comunicada con el centro de Madrid y se encuentra a 10 minutos en transporte público. El Museo de Arte Thyssen-Bornemisza está a 1 km y la moderna Gran Vía, a 10 minutos a pie. Hay conexión Wi-Fi gratuita en las zonas comunes.';
  static const String urlHotel =
      'https://www.agoda.com/es-es/hostal-castilla/hotel/all/madrid-es.html?finalPriceView=2&isShowMobileAppPrice=false&cid=1763310&numberOfBedrooms=&familyMode=false&adults=2&children=0&rooms=1&maxRooms=0&checkIn=2022-06-21&isCalendarCallout=false&childAges=&numberOfGuest=0&missingChildAges=false&travellerType=-1&showReviewSubmissionEntry=false&currencyCode=EUR&isFreeOccSearch=false&tag=a50a5925-ed0f-4f5c-bd67-afc4a3f7b11b&flexibleDateSearchCriteria=[object%20Object]&isCityHaveAsq=false&los=1&searchrequestid=facae72b-92f7-47e4-a584-07dd55ce0889';
}
