import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController dateController = TextEditingController();

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2500),
    );
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SafeArea(
            child: Column(
              children: [
                ElevatedButton(
                    child: Text("Back"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Income")),
                    ElevatedButton(onPressed: () {}, child: Text("Expense")),
                    ElevatedButton(onPressed: () {}, child: Text("Transfer"))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date"),
                      TextField(
                          readOnly: true,
                          controller: dateController,
                          onTap: () {
                            selectDate();
                          }),
                      const SizedBox(height: 8),
                      Text("Wallet"),
                      TextField(),
                      const SizedBox(height: 8),
                      Text("Category"),
                      TextField(),
                      const SizedBox(height: 8),
                      Text("Ammount"),
                      TextField(),
                      const SizedBox(height: 8),
                      Text("Description"),
                      TextField(),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          ElevatedButton(onPressed: () {}, child: Text("Save")),
                          ElevatedButton(
                              onPressed: () {}, child: Text("Income"))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
