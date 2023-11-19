import 'package:edulearn/screens/category_detail.dart';
import 'package:edulearn/utils/load_json.dart';
import 'package:edulearn/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerWidget {
  Homepage({super.key});

  final TextEditingController searchController = TextEditingController();
  Future<Map<String, dynamic>> getCategory() async {
    var result = await LoadJson().readJson();
    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Explore Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: FutureBuilder<Map<String,dynamic>>(
                future: getCategory(),
                builder: ((context, snapshot) {
                 if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child:  CircularProgressIndicator());
                 }else{
                   return GridView.builder(
                      itemCount: snapshot.data!['categories'].length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.85, crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CourseDetail(
                                index: index,
                                result: snapshot,
                              );
                            }));
                          },
                          child: Card(
                            elevation: 3,
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Hero(
                                    tag: snapshot.data!['categories'][index]
                                        ['name'],
                                    child: Image(
                                      image: AssetImage(
                                          'images/category/${snapshot.data!['categories'][index]['img']}'),
                                      height: 150,
                                    ),
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          snapshot.data!['categories'][index]
                                              ['name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                         Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('${(snapshot.data!['categories'][index]['languages']).length} Courses'),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
                 }
                })),
          )
        ],
      ),
    ));
  }
}
