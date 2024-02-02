import 'package:app/models/users/Users.dart';
import 'package:app/res/AppContextExtension.dart';
import 'package:app/viewmodels/users/users_viewmodel.dart';
import 'package:flutter/material.dart';

class CustomerDetailsPage extends StatefulWidget {
  static final String id = "customer_details_page";

  final Users? customerData;

  // receive data from the HomeScreen as a parameter
  const CustomerDetailsPage([this.customerData]);

  @override
  _CustomerDetailsPageState createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  final Users_ViewModel viewModel = Users_ViewModel();
  bool loading = false;

  @override
  void initState() {
    viewModel.Fet_Users();
    emailController.value =
        TextEditingValue(text: widget.customerData?.name ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.resources.strings.menuCustomers),
        backgroundColor: const Color(0xFF00897b),
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the customer\'s name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: !loading
                      ? ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              Map<String, dynamic> body = {
                                'name': 'TEST 5',
                                'email': 'racrogel@gmail.com',
                                'phone_number': '123'
                              };
                              setState(() {
                                loading = true;
                              });

                              await Future.delayed(const Duration(seconds: 2));
                              await viewModel.Post_User(body);

                              setState(() {
                                loading = false;
                              });
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please fill input')),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
