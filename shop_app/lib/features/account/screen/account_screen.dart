import 'package:shop_app/constains/global_variables.dart';
import 'package:shop_app/features/account/widgets/below_app.dart';
import 'package:shop_app/features/account/widgets/orders.dart';
import 'package:shop_app/features/account/widgets/top_button.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/search/screen/search_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // ham dieu huong tim kiem
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context as BuildContext, SearchScreen.routeName,
        arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Tìm kiếm sản phẩm',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   alignment: Alignment.topLeft,
              // child: Image.asset(
              //   'assets/images/amazon_in.png',
              //   width: 120,
              //   height: 45,
              //   color: Colors.black,
              // ),
              // ),

              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size: 25),
              ),
              Container(
                // padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    // Icon(
                    //   Icons.search,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //body
      body: const SingleChildScrollView(
        child: Column(
          children: [
            BelowAppBar(),
            SizedBox(height: 10),
            TopButton(),
            SizedBox(height: 20),
            MyOrder(),
          ],
        ),
      ),
    );
  }
}
