import 'package:bible_compass_app/domain/models/category/category.dart';
import 'package:bible_compass_app/domain/providers/categoryproviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewCategory extends ConsumerWidget {
  final String id;
  const ViewCategory(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamic categoryfuturesingle =
        Future.delayed(const Duration(seconds: 1), () {
      final categorycalled = ref
          .read(categoryProvider.notifier)
          .perfromGetSingleCategoryRequest(id);
      return categorycalled;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Category'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color(0xFFE2E2E2),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<CategoryState>(
            future: categoryfuturesingle,
            builder:
                (BuildContext context, AsyncSnapshot<CategoryState> snapshot) {
              if (snapshot.hasData) {
                // debugPrint(snapshot.data?.data['data'].toString());
                final fulldata = snapshot.data?.data['data'];
                // debugPrint(fulldata['name'].toString());
                // debugPrint(fulldata.toString());
                return Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text("Catgeory Name:"),
                        trailing: Text(fulldata['category_name']),
                      ),
                      ListTile(
                        title: const Text("For Subscribers:"),
                        trailing: Text(fulldata['for_subscribers'].toString()),
                      ),
                      SizedBox(
                        height: 600,
                        child: ListTile(
                            minLeadingWidth: 50,
                            title: const Text("keywords:"),
                            // trailing: Text(fulldata['keywords'].toString()),
                            trailing: SizedBox(
                              width: 150,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: fulldata['keywords'].length,
                                itemBuilder: (context, index) {
                                  return Text(
                                      "${index + 1}: ${fulldata['keywords'][index]}");
                                },
                              ),
                            )),
                      ),
                    ],
                  ),
                );

                // return const Text("hello hasdata");
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ),
      ),
    );
  }
}
