import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teglax_assignment/res/routes/routes_names.dart';
import 'package:teglax_assignment/res/utils/colors.dart';
import 'package:teglax_assignment/view_model/product_view_model.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel = Get.find<ProductViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: AppColors.black.withValues(alpha: .1),
      ),
      body: FutureBuilder(
          future: productViewModel.fetchProducts(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors.black,
              ));
            }

            /// Has Error While Fetching Data
            else if (snap.hasError) {
              return Center(
                  child: Text(
                'Error: ${snap.error}',
                style: TextStyle(color: AppColors.red),
              ));
            }

            /// No Data Found
            else if (!snap.hasData) {
              return Center(
                  child: Text('No Data Found',
                      style: TextStyle(color: AppColors.red)));
            }

            /// Data Fetched Successfully
            else {
              return ListView.builder(
                itemCount: snap.data!.length,
                itemBuilder: (context, index) {
                  final data = snap.data![index];

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.black.withValues(alpha: .1),
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        data.title,
                        style: TextStyle(fontSize: 14),
                      ),
                      leading: CircleAvatar(
                          backgroundColor:
                              AppColors.black.withValues(alpha: .1),
                          backgroundImage: NetworkImage(data.thumbnail)),
                      trailing: Text(
                        '\$${data.price}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Get.toNamed(RoutesNames.productDetails,
                            arguments: data.id);
                      },
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
