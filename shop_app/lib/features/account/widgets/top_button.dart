import 'package:shop_app/features/account/service/account_services.dart';
import 'package:shop_app/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  const TopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: "Đơn hàng của bạn", onTap: () {}),
            AccountButton(text: "Bán hàng", onTap: () {}),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
                text: "Đăng xuất",
                onTap: () => AccountServices().logOut(context)),
            AccountButton(text: "Sản phẩm yêu thích", onTap: () {}),
          ],
        ),
      ],
    );
  }
}
