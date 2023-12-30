// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'products.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({
    super.key,
  });

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {

  final TextEditingController _searchController = TextEditingController();
  List<ProductModel> _searchResults = []; 


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search here...",
          hintStyle: const TextStyle(fontSize: 12),
          suffixIcon: InkWell(
            onTap: () => performSearch(_searchController.text),
            child: const Icon(Icons.search)
          ),
          suffixIconColor: Colors.indigo,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white
        ),
      );
  }

  void performSearch(String query) async {
    if (query.isEmpty) {
      // Clear the search results if the query is empty
      setState(() {
        _searchResults.clear();
      });
      return;
    }

    // Use the getProduct method from the Products class to fetch data
    List<ProductModel> products = await Products().getProduct();

    // Filter the products based on the search query
    List<ProductModel> searchResults = products
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Update the search results
    setState(() {
      _searchResults = searchResults;
    });

    // Show the search results in a BottomSheet
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 245, 243, 252),
      barrierLabel: "Search Results",
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 12, left: 12, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const Text('Search Results'),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [                      
                          Image.network(_searchResults[index].image, width: 70, height: 70,),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_searchResults[index].title, style: const TextStyle(fontSize: 17),),
                              Text("GHC ${_searchResults[index].price}", style: const TextStyle(fontSize: 15),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
