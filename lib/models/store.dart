class Store {
  String? name;
  String? rate;
  String? image;
  String? category;
  var menus;

  Store({
    required this.name,
    required this.rate,
    required this.image,
    required this.category,
    required this.menus,
  });
}

var menus = [
    {
      'name': 'Baygon',
      'image_menu': 'images/baygon.png',
      'price': 5000,
    },
    {
      'name': 'Dancow',
      'image_menu': 'images/dancow.png',
      'price': 2000,
    },
    {
      'name': 'Indomie',
      'image_menu': 'images/indomie.png',
      'price': 1500,
    },
    {
      'name': 'Kerupuk',
      'image_menu': 'images/kerupuk.png',
      'price': 500,
    },
    {
      'name': 'Marimas',
      'image_menu': 'images/marimas.png',
      'price': 500,
    },
    {
      'name': 'OBH',
      'image_menu': 'images/obh.png',
      'price': 12000,
    },
    {
      'name': 'Panadol',
      'image_menu': 'images/panadol.png',
      'price': 10000,
    },
    {
      'name': 'Sania',
      'image_menu': 'images/sania.png',
      'price': 50000,
    },
    {
      'name': 'Soklin',
      'image_menu': 'images/soklin.png',
      'price': 20000,
    },
    {
      'name': 'Sunlight',
      'image_menu': 'images/sunlight.png',
      'price': 5000,
    },
    {
      'name': 'Taro',
      'image_menu': 'images/taro.png',
      'price': 2000,
    },
  ];

var storeNearbyList = [
  Store(name: 'Warung Udaa', rate: '5.0', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
  Store(name: 'Warung Teh Ai', rate: '4.5', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
  Store(name: 'Alfamart Alim Rugi', rate: '4.8', image: 'images/store.png', category: 'Toko Retail', menus: menus),
  Store(name: 'Indomaret Selalu Jaya', rate: '4.9', image: 'images/store.png', category: 'Toko Retail', menus: menus),
  Store(name: 'Warung AA Bukan Gym', rate: '5.0', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
];

var allStoreList = [
  Store(name: 'Warung Udaa', rate: '5.0', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
  Store(name: 'Warung Sukses Terus', rate: '5.0', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
  Store(name: 'Warung Teh Ucu', rate: '4.0', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
  Store(name: 'Warung Teh Lilis', rate: '5.0', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
  Store(name: 'Warung Teh Ai', rate: '4.5', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
  Store(name: 'Alfamart Alim Rugi', rate: '4.8', image: 'images/store.png', category: 'Toko Retail', menus: menus),
  Store(name: 'Yomart Cihanyir', rate: '4.6', image: 'images/store.png', category: 'Toko Retail', menus: menus),
  Store(name: 'Griya Majalaya', rate: '5.0', image: 'images/store.png', category: 'Toko Retail', menus: menus),
  Store(name: 'Indomaret Selalu Jaya', rate: '4.9', image: 'images/store.png', category: 'Toko Retail', menus: menus),
  Store(name: 'Warung AA Bukan Gym', rate: '5.0', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
  Store(name: 'Warung Darmaji', rate: '4.7', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
];

var popularStoreList = [
  Store(name: 'Warung Sukses Terus', rate: '5.0', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
  Store(name: 'Warung Teh Ai', rate: '4.5', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
  Store(name: 'Alfamart Alim Rugi', rate: '4.8', image: 'images/store.png', category: 'Toko Retail', menus: menus),
  Store(name: 'Warung AA Bukan Gym', rate: '5.0', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
  Store(name: 'Warung Darmaji', rate: '4.7', image: 'images/store.png', category: 'Toko Kelontong', menus: menus),
];