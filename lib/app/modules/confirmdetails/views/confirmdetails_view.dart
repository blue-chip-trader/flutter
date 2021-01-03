import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/confirmdetails/controllers/confirmdetails_controller.dart';

TextEditingController _phoneController = TextEditingController();

class ConfirmdetailsView extends GetView<ConfirmdetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Confirmation'),
        centerTitle: true,
        backgroundColor: MyTheme().bcBackground,
      ),
      backgroundColor: MyTheme().bcBackground,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: MyTheme().bcAppBarColor,
                  borderRadius: BorderRadius.all(Radius.circular(13))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 100,
                          width: 100,
                          decoration:
                              BoxDecoration(color: MyTheme().bcPrimaryColor2,image: DecorationImage(image: NetworkImage("https://flyinryanhawks.org/wp-content/uploads/2016/08/profile-placeholder.png")),
                              borderRadius: BorderRadius.circular(20)),
                        ),Padding(
                          padding: const EdgeInsets.symmetric(vertical: 28,horizontal: 10),
                          child: Icon(Icons.edit,size: 10,),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        _buildPhoneTF("Display Name", BlueChipIcons.profile,
                            TextInputType.text),
                        _buildPhoneTF("+1 23456789", BlueChipIcons.call,
                            TextInputType.phone),
                        _buildPhoneTF("username@email.com",
                            BlueChipIcons.message, TextInputType.emailAddress),
                      ],
                    ),
                    Column(
                      children: [
                        Divider(),
                        BCTButton(
                          title: "Done",
                        )
                      ],
                    )
                  ])),
        ),
      ),
    );
  }
}

Widget _buildPhoneTF(String hint, IconData icon, TextInputType inputType) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(15),
        decoration: kBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          keyboardType: inputType,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          controller: _phoneController,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            hintText: hint,
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF151516),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class BCTButton extends StatelessWidget {
  const BCTButton({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _authcontroller.handleSignOut();
        //Get.snackbar('Signed Out', 'Sad to see you going...');
      },
      child: Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
              color: MyTheme().bcButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(13))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }
}
