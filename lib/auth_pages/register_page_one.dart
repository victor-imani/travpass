import 'package:flutter/material.dart';

class RegisterFirstPage extends StatelessWidget {
  const RegisterFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 463,
        height: 932,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 463,
                height: 932,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 463,
                        height: 932,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    Positioned(
                      left: -56.97,
                      top: -128,
                      child: Container(
                        width: 567.62,
                        height: 479,
                        decoration: ShapeDecoration(
                          color: Color(0xFF0B2031),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 160,
              top: 300,
              child: Container(
                width: 94,
                height: 14,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 22.12,
                        height: 14,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF9F00),
                          shape: CircleBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35.94,
                      top: 0,
                      child: Container(
                        width: 22.12,
                        height: 14,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFEE68E),
                          shape: CircleBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 71.88,
                      top: 0,
                      child: Container(
                        width: 22.12,
                        height: 14,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFEE68E),
                          shape: CircleBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 0,
              top: 150,
              child: SizedBox(
                width: 401,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hello!',
                        style: TextStyle(
                          color: Color(0xFFFF9F00),
                          fontSize: 36,
                          fontFamily: 'Montserrat Alternates',
                          fontWeight: FontWeight.w700,
                          height: 0.04,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' Register to get \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n started...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'Montserrat Alternates',
                          fontWeight: FontWeight.w700,
                          height: 0.04,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 570,
              child: SizedBox(
                width: 350,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.grey,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xFFFF9F00),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "EMAIL",
                    hintStyle: TextStyle(
                        color: Color(0xFFFF9F00),
                        fontSize: 20.0,
                        fontFamily: 'Josefin Sans'),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 380,
              child: SizedBox(
                width: 350,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    labelText: 'NAME',
                  ),
                  style: TextStyle(
                    color: Color(0xFFFF9F00),
                    fontSize: 20,
                    fontFamily: 'Josefin Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 470,
              child: SizedBox(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    labelText: 'PHONE NUMBER',
                  ),
                  style: TextStyle(
                    color: Color(0xFFFF9F00),
                    fontSize: 20,
                    fontFamily: 'Josefin Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 680,
              child: Container(
                width: 330,
                height: 75,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 330,
                        height: 75,
                        decoration: ShapeDecoration(
                          color: Color(0xFF0B2031),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 110,
                      top: 40,
                      child: SizedBox(
                        width: 109,
                        height: 43,
                        child: Text(
                          'CONTINUE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFF9F00),
                            fontSize: 20,
                            fontFamily: 'Josefin Sans',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 50,
              top: 810,
              child: SizedBox(
                width: 309,
                height: 42,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an Account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Color(0xFFFF9F00),
                          fontSize: 20,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
