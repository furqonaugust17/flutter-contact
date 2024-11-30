import 'package:app/services/api_service.dart';
import 'package:app/utils/snackbar_widget.dart';
import 'package:app/widgets/list_contact.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool isLoading = true;
  List contacts = [];
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      replacement: RefreshIndicator(
        onRefresh: fetchData,
        child: Visibility(
          visible: contacts.isNotEmpty,
          replacement: Center(
            child: Text(
              'No Todo',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          child: ListView.builder(
            itemCount: contacts.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final item = contacts[index] as Map;
              // return ListContact(contact: item);
            },
          ),
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> fetchData() async {
    try {
      final response = await _apiService.getContacts();
      setState(() {
        contacts = response;
      });
    } catch (e) {
      errorSnackBar(context, e.toString());
    } finally {
      setState(() {
        isLoading = !isLoading;
      });
    }
  }
}
