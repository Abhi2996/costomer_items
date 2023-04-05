import 'package:flutter/material.dart';

class Quotation {
  final String number;
  final String customerName;
  final String date;

  Quotation({required this.number, required this.customerName, required this.date});
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Quotation> _quotations = [    Quotation(number: 'Q1001', customerName: 'John Smith', date: '2022-01-01'),    Quotation(number: 'Q1002', customerName: 'Jane Doe', date: '2022-01-02'),    Quotation(number: 'Q1003', customerName: 'Bob Johnson', date: '2022-01-03'),    Quotation(number: 'Q1004', customerName: 'Alice Brown', date: '2022-01-04'),  ];

  void _addQuotation() {
    // generate a new quotation number and add it to the list
    String number = 'Q' + (_quotations.length + 1001).toString();
    String customerName = 'Customer ' + (_quotations.length + 1).toString();
    String date = DateTime.now().toString().split(' ')[0];
    _quotations.add(Quotation(number: number, customerName: customerName, date: date));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addQuotation,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by quotation number',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: _quotations.length,
              itemBuilder: (BuildContext context, int index) {
                if (_searchController.text.isEmpty) {
                  // show all search results if search field is empty
                  return ListTile(
                    title: Text(_quotations[index].number),
                    subtitle: Text('${_quotations[index].customerName} - ${_quotations[index].date}'),
                    onTap: () {
                      // handle tapping on a search result
                    },
                  );
                } else {
                  // show search results that match the search query
                  if (_quotations[index].number
                      .toLowerCase()
                      .contains(_searchController.text.toLowerCase())) {
                    return ListTile(
                      title: Text(_quotations[index].number),
                      subtitle: Text('${_quotations[index].customerName} - ${_quotations[index].date}'),
                      onTap: () {
                        // handle tapping on a search result
                      },
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
