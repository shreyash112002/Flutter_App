import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/SigninScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/profilepage.dart';
import 'package:flutterapp/reusable_widgets.dart';
import 'package:flutterapp/NavBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shimmer/shimmer.dart';

String stringResponse="";
Map mapResponse={'data'} as Map;
Map dataResponse={'data'} as Map;
List listResponse=['data'];
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future apicall()async{
  //   http.Response response;
  //   response= await http.get(Uri.parse("https://script.googleusercontent.com/macros/echo?user_content_key=Ff4PESC-iXtVr9OsRg5R9d1pNDQi9pJMLJ8DO0RE6mgc2i4mN9kSvbTmVzVREB9urZWFTJxJzrewpOuxQTNZqGvuTngthLHtm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPveZDlJ_AsjVJCY6axLhPTyT107DOA6BeV8lpw_FsjPFjpp8noYC4ljtLZPJIzijjJM0SxjCYprq9OmLICGGxEjzvIRtMuI3tz9Jw9Md8uu&lib=MxUoWSxTNx4Hk4n3l8SvlMA9o7N4CQEWp"));
  //   if(response.statusCode==200){
  //     setState(() {
  //       // stringResponse=response.body;
  //       mapResponse=json.decode(response.body);
  //       listResponse=mapResponse['data'];
  //       print(listResponse[0]);

  //     });
  //   }
  // }
  final Url="https://script.googleusercontent.com/macros/echo?user_content_key=Ff4PESC-iXtVr9OsRg5R9d1pNDQi9pJMLJ8DO0RE6mgc2i4mN9kSvbTmVzVREB9urZWFTJxJzrewpOuxQTNZqGvuTngthLHtm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPveZDlJ_AsjVJCY6axLhPTyT107DOA6BeV8lpw_FsjPFjpp8noYC4ljtLZPJIzijjJM0SxjCYprq9OmLICGGxEjzvIRtMuI3tz9Jw9Md8uu&lib=MxUoWSxTNx4Hk4n3l8SvlMA9o7N4CQEWp";
  List<Data> _dataList = [];
  bool _isLoading = true;
  Future<void> _getData() async {
  setState(() {
    _isLoading = true;
  });
  final response = await http.get(Uri.parse(Url));
  if (response.statusCode == 200) {
    setState(() {
      _dataList = List<Data>.from(
          json.decode(response.body)['data'].map((x) => Data.fromJson(x)));
      _isLoading = false;
    });
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
        );
      },
    ),
  );
}

  Widget build(BuildContext context) {
   return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Data Cards'),
        ),
        body: _isLoading
  ? _buildShimmerEffect()
  : ListView.builder(
      itemCount: _dataList.length,
      itemBuilder: (context, index) {
        final data = _dataList[index];
        return Card(
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date and Time',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '${data.dateAndTime}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            Text(
              '${data.total}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Occupied',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            Text(
              '${data.occupied}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);

        //  return Card(
        //       child: ListTile(
        //         title: Text('Date and Time: ${data.dateAndTime}'),
        //         subtitle: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text('Total: ${data.total}'),
        //             Text('Occupied: ${data.occupied}'),
        //           ],
        //         ),
        //       ),
        //     );
      },
    ),

        // body: ListView.builder(
        //   itemCount: _dataList.length,
        //   itemBuilder: (context, index) {
        //     final data = _dataList[index];
        //     return Card(
        //       child: ListTile(
        //         title: Text('Date and Time: ${data.dateAndTime}'),
        //         subtitle: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text('Total: ${data.total}'),
        //             Text('Occupied: ${data.occupied}'),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
      );
    
  }
}
// Center(child: Text(stringResponse.toString())),
 class Data {
  final DateTime dateAndTime;
  final int total;
  final int occupied;

  Data({required this.dateAndTime, required this.total, required this.occupied});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      dateAndTime: DateTime.parse(json['Date And Time']),
      total: json['Total'],
      occupied: json['Occupied'],
    );
  }
}