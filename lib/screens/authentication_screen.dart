import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:send_otp_firebase/screens/verify_phone_number_screen.dart';
import 'package:send_otp_firebase/utils/helpers.dart';

class AuthenticationScreen extends StatefulWidget {
  static const id = 'AuthenticationScreen';

  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  String? phoneNumber;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "We'll send an SMS with a verification code...",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 15),
              EasyContainer(
                elevation: 0,
                borderRadius: 10,
                color: Colors.transparent,
                child: IntlPhoneField(
                  autofocus: true,
                  invalidNumberMessage: 'Invalid Phone Number!',
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(fontSize: 25),
                  onChanged: (phone) => phoneNumber = phone.completeNumber,
                  initialCountryCode: 'IN',
                  flagsButtonPadding: const EdgeInsets.only(right: 10),
                  showDropdownIcon: false,
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(height: 15),
              EasyContainer(
                width: double.infinity,
                onTap: () async {

                    Navigator.pushNamed(
                      context,
                      VerifyPhoneNumberScreen.id,
                      arguments: phoneNumber,
                    );
                },
                child: const Text(
                  'Verify',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
