import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:pixieapp/const/Countries.dart';
import 'package:pixieapp/const/colors.dart';
import 'package:pixieapp/pages/onboardingPages/onboarding_page.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

TextEditingController countrycodetextEditingController =
    TextEditingController();

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/createaccountbackground.png'),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/createaccountsmily.png'),
                Text(
                  'Create an account',
                  style: theme.textTheme.displayLarge!
                      .copyWith(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your profile and created stories will be saved to your account.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.kwhiteColor,
                      border: Border.all(
                          color: const Color.fromARGB(102, 152, 92, 221)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "Country/Region",
                          style:
                              theme.textTheme.bodySmall!.copyWith(fontSize: 13),
                        ),
                      ),
                      TypeAheadField<Country>(
                        builder: (context, controller, focusNode) {
                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: AppColors.kgreyColor,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(0, 152, 92, 221),
                                      width: 2.0),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(0, 152, 92, 221)),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(0, 152, 92, 221)),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                ),
                                hintText: '🇮🇳 India (+91)',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          );
                        },
                        controller: countrycodetextEditingController,
                        suggestionsCallback: (search) {
                          return countries
                              .where((country) => country.name
                                  .toLowerCase()
                                  .contains(search.toLowerCase()))
                              .toList();
                        },
                        itemBuilder: (context, Country country) {
                          return ListTile(
                              leading: Text(
                                country.flag,
                                style: const TextStyle(fontSize: 30),
                              ),
                              title: Row(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    child: Center(
                                      child: Text(
                                        country.code,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  const Text(" -  "),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(country.name,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                        onSelected: (Country country) {
                          countrycodetextEditingController.text =
                              "${country.flag}  ${country.code}  -  ${country.name}";
                        },
                      ),
                      const Divider(color: Color.fromARGB(102, 152, 92, 221)),
                      const TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: " Mobile number",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w400),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              strokeAlign: 5,
                              color: Color.fromARGB(0, 158, 158, 158),
                            ),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(0, 158, 158, 158),
                            ),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(0, 158, 158, 158),
                                width: 2.0),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/OtpVerification');
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColors.backgrountdarkpurple,
                    ),
                    child: Text(
                      "Next",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Or',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(),
                ),
                const SizedBox(height: 20),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    width: MediaQuery.of(context).size.width * .8,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                              width: 40,
                              child: Image.asset("assets/images/mail.png")),
                        ),
                        TextButton(
                          onPressed: () =>
                              context.push('/CreateAccountWithEmail'),
                          child: Text(
                            "Sign Up with Email Address",
                            style: theme.textTheme.bodyMedium!.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: AppColors.backgrountdarkpurple),
                          ),
                        ),
                        const SizedBox()
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    width: MediaQuery.of(context).size.width * .8,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                              width: 40,
                              child:
                                  Image.asset("assets/images/googleimg.png")),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Login with Google",
                            style: theme.textTheme.bodyMedium!.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: AppColors.backgrountdarkpurple),
                          ),
                        ),
                        const SizedBox()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
