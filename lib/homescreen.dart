import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Url = "https://api.thingspeak.com/channels/2257018/feeds.json?results=2";

  List<Data> _dataList = [];
  bool _isLoading = true;

  Future<void> _getData() async {
    setState(() {
      _isLoading = true;
    });
    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      if (decodedData['feeds'] != null) {
        setState(() {
          _dataList = List<Data>.from(
            decodedData['feeds'].map((x) => Data.fromJson(x)),
          );
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Feeds are null in the response.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                if (_dataList.isNotEmpty && _dataList[index].field1 == 1) {
                  _navigateToDetailsScreen(_dataList[index]);
                }
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                ),
                title: SizedBox(
                  height: 20,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                subtitle: SizedBox(
                  height: 16,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToDetailsScreen(Data data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(data: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _isLoading
          ? _buildShimmerEffect()
          : ListView.builder(
              itemCount: _dataList.length,
              itemBuilder: (context, index) {
                final data = _dataList[index];
                String status = data.field1 == 1 ? 'Empty' : 'Occupied';
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (data.field1 == 1) {
                        _navigateToDetailsScreen(data);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Created At',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '${data.createdAt}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Entry ID',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '${data.entryId}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Field 1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            status,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class Data {
  final DateTime createdAt;
  final int entryId;
  final int field1;

  Data({
    required this.createdAt,
    required this.entryId,
    required this.field1,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      createdAt: DateTime.parse(json['created_at']),
      entryId: json['entry_id'],
      field1: int.parse(json['field1']),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Data data;

  DetailsScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/qrcode.jpeg', // Change the path to your image
              width: 500, // Adjust the image width as needed
              height: 500, // Adjust the image height as needed
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to perform payment here
                // Close the app
                SystemNavigator.pop();
              },
              child: Text('DONE'),
            ),
          ],
        ),
      ),
    );
  }
}
