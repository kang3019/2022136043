import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _neighborhood = '강남구';
  bool _showNeighborhoodList = false;
  final List<String> _neighborhoods = [
    '강남구',
    '서초구',
    '송파구',
    '마포구',
    '강서구',
    '종로구',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'name': 'iPhone 14 Pro',
      'price': 1200000,
      'location': '강남구 논현동',
      'image':
          'https://images.unsplash.com/photo-1592286927505-1fed5019446d?w=400&h=400&fit=crop',
      'liked': false,
    },
    {
      'id': 2,
      'name': 'MacBook Air M2',
      'price': 1800000,
      'location': '강남구 역삼동',
      'image':
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop',
      'liked': false,
    },
    {
      'id': 3,
      'name': '에어팟 프로',
      'price': 380000,
      'location': '강남구 신사동',
      'image':
          'https://images.unsplash.com/photo-1606841837239-c5a1a0a90d37?w=400&h=400&fit=crop',
      'liked': false,
    },
    {
      'id': 4,
      'name': 'iPad Air',
      'price': 900000,
      'location': '강남구 청담동',
      'image':
          'https://images.unsplash.com/photo-1559056199-641a0ac8b3f7?w=400&h=400&fit=crop',
      'liked': false,
    },
    {
      'id': 5,
      'name': '애플 워치 시리즈 8',
      'price': 450000,
      'location': '강남구 강남역',
      'image':
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=400&fit=crop',
      'liked': false,
    },
    {
      'id': 6,
      'name': '무선 충전기',
      'price': 45000,
      'location': '강남구 삼성역',
      'image':
          'https://images.unsplash.com/photo-1591920591022-f3fa36406144?w=400&h=400&fit=crop',
      'liked': false,
    },
    {
      'id': 7,
      'name': '스탠드 조명',
      'price': 65000,
      'location': '강남구 신사역',
      'image':
          'https://images.unsplash.com/photo-1565636192335-14f88419b49c?w=400&h=400&fit=crop',
      'liked': false,
    },
    {
      'id': 8,
      'name': '블루투스 스피커',
      'price': 120000,
      'location': '강남구 압구정역',
      'image':
          'https://images.unsplash.com/photo-1589003077984-894e133da26d?w=400&h=400&fit=crop',
      'liked': false,
    },
    {
      'id': 9,
      'name': '외장 하드드라이브',
      'price': 150000,
      'location': '강남구 교대역',
      'image':
          'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=400&h=400&fit=crop',
      'liked': false,
    },
    {
      'id': 10,
      'name': 'USB-C 허브',
      'price': 85000,
      'location': '강남구 남부역',
      'image':
          'https://images.unsplash.com/photo-1625948515291-69613efd103f?w=400&h=400&fit=crop',
      'liked': false,
    },
    {
      'id': 11,
      'name': '무선 마우스',
      'price': 55000,
      'location': '강남구 사당역',
      'image':
          'https://images.unsplash.com/photo-1527814050087-3793815479db?w=400&h=400&fit=crop',
      'liked': false,
    },
    {
      'id': 12,
      'name': '기계식 키보드',
      'price': 180000,
      'location': '강남구 이수역',
      'image':
          'https://images.unsplash.com/photo-1587829191301-dc798b83add3?w=400&h=400&fit=crop',
      'liked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: GestureDetector(
          onTap: () {
            setState(() {
              _showNeighborhoodList = !_showNeighborhoodList;
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svg/icons/want_location_marker.svg',
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              const SizedBox(width: 8),
              Text(
                _neighborhood,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              SvgPicture.asset(
                'assets/svg/icons/bottom_arrow.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/icons/search.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                width: 24,
                height: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/icons/bell.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                width: 24,
                height: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/icons/list.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  // 상품 상세 페이지로 이동
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[900],
                  ),
                  height: 140,
              child: Row(
                children: [
                  // 상품 이미지
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: product['isLocalImage'] == true
                        ? Image.file(
                            File(product['image']),
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 140,
                                height: 140,
                                color: Colors.grey[800],
                                child: Center(
                                  child: Icon(
                                    Icons.shopping_bag,
                                    size: 60,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              );
                            },
                          )
                        : Image.network(
                            product['image'],
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 140,
                                height: 140,
                                color: Colors.grey[800],
                                child: Center(
                                  child: Icon(
                                    Icons.shopping_bag,
                                    size: 60,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                width: 140,
                                height: 140,
                                color: Colors.grey[800],
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white38,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  // 상품 정보
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 상품명과 하트
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  product['name'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    product['liked'] = !product['liked'];
                                  });
                                },
                                child: SvgPicture.asset(
                                  product['liked']
                                      ? 'assets/svg/icons/like_on.svg'
                                      : 'assets/svg/icons/like_off.svg',
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                    product['liked'] ? Colors.red : Colors.grey,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // 가격
                          Text(
                            '₩${product['price'].toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+$)'), (m) => '${m[1]},')}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          // 위치
                          Text(
                            product['location'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
            ),
          // 동네 선택 드롭다운 메뉴
          if (_showNeighborhoodList)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.grey[850],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _neighborhoods
                      .map((neighborhood) => GestureDetector(
                            onTap: () {
                              setState(() {
                                _neighborhood = neighborhood;
                                _showNeighborhoodList = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    neighborhood,
                                    style: TextStyle(
                                      color: _neighborhood == neighborhood
                                          ? Colors.orange
                                          : Colors.white,
                                      fontSize: 16,
                                      fontWeight: _neighborhood == neighborhood
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SellProductPage(
                onProductAdded: (newProduct) {
                  setState(() {
                    products.add(newProduct);
                  });
                },
              ),
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}

// 상품 판매 페이지
class SellProductPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onProductAdded;

  const SellProductPage({
    super.key,
    required this.onProductAdded,
  });

  @override
  State<SellProductPage> createState() => _SellProductPageState();
}

class _SellProductPageState extends State<SellProductPage> {
  final _formKey = GlobalKey<FormState>();
  String _productName = '';
  int _productPrice = 0;
  String _selectedCategory = '전자제품';
  File? _selectedImage;
  String _productDescription = '';
  final ImagePicker _imagePicker = ImagePicker();

  final List<String> _categories = ['전자제품', '의류', '가구', '도서', '스포츠', '기타'];

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('갤러리에서 선택'),
                onTap: () async {
                  try {
                    Navigator.pop(context);
                    final pickedFile = await _imagePicker.pickImage(
                      source: ImageSource.gallery,
                      imageQuality: 80,
                    );
                    if (pickedFile != null && mounted) {
                      setState(() {
                        _selectedImage = File(pickedFile.path);
                      });
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('이미지 선택 실패: $e')),
                      );
                    }
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('카메라로 촬영'),
                onTap: () async {
                  try {
                    Navigator.pop(context);
                    final pickedFile = await _imagePicker.pickImage(
                      source: ImageSource.camera,
                      imageQuality: 80,
                    );
                    if (pickedFile != null && mounted) {
                      setState(() {
                        _selectedImage = File(pickedFile.path);
                      });
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('카메라 접근 실패: $e')),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('이미지를 선택해주세요'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }

      _formKey.currentState!.save();

      final newProduct = {
        'id': DateTime.now().millisecondsSinceEpoch,
        'name': _productName,
        'price': _productPrice,
        'location': '강남구 사용자 출품',
        'image': _selectedImage!.path,
        'category': _selectedCategory,
        'description': _productDescription,
        'liked': false,
        'isLocalImage': true,
      };

      widget.onProductAdded(newProduct);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('상품이 등록되었습니다!'),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품 판매'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 이미지
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[700]!, width: 2),
                  ),
                  child: _selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 60,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '이미지 선택',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 20),
              // 상품명
              const Text(
                '상품명',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '상품명을 입력해주세요',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSaved: (value) {
                  _productName = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '상품명을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 카테고리
              const Text(
                '카테고리',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                dropdownColor: Colors.grey[800],
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value ?? '전자제품';
                  });
                },
              ),
              const SizedBox(height: 16),

              // 가격
              const Text(
                '가격',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '가격을 입력해주세요',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefix: const Text(
                    '₩ ',
                    style: TextStyle(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSaved: (value) {
                  _productPrice = int.tryParse(value ?? '0') ?? 0;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '가격을 입력해주세요';
                  }
                  if (int.tryParse(value) == null) {
                    return '올바른 숫자를 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 설명
              const Text(
                '상품 설명',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: '상품에 대해 자세히 설명해주세요',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSaved: (value) {
                  _productDescription = value ?? '';
                },
              ),
              const SizedBox(height: 24),

              // 작성 완료 버튼
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    '작성 완료',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
