import 'package:flutter/material.dart';

import '../Ui/colors.dart';
import '../Ui/constants.dart';
import '../main.dart';


class CategorySelectionPage extends StatefulWidget {
  final Function(List<String>) onCategorySelected;

  CategorySelectionPage({required this.onCategorySelected});

  @override
  _CategorySelectionPageState createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  final List<CustomCategory> _customCategories = [];

  final TextEditingController _categoryNameController = TextEditingController();
  final TextEditingController _wordController = TextEditingController();
  final List<String> _tempWords = [];

  void _addWord() {
    if (_wordController.text.trim().isNotEmpty) {
      setState(() {
        _tempWords.add(_wordController.text.trim());
        _wordController.clear();
      });
    }
  }

  void _addCustomCategory() {
    if (_categoryNameController.text.trim().isNotEmpty && _tempWords.isNotEmpty) {
      setState(() {
        _customCategories.add(CustomCategory(
          name: _categoryNameController.text.trim(),
          words: List.from(_tempWords),
        ));
        _categoryNameController.clear();
        _tempWords.clear();
      });
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields and add at least one word.')),
      );
    }
  }

  void _deleteCategory(int index) {
    setState(() {
      _customCategories.removeAt(index);
    });
  }

  void _editCategory(int index) {
    _categoryNameController.text = _customCategories[index].name;
    _tempWords.clear();
    _tempWords.addAll(_customCategories[index].words);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.primaryColorDark, // Set background to primary color
        title: Text(
          'Edit Custom Category',
          style: TextStyle(
            color: AppColor.teaGreen, // Title text color changed to teaGreen
            fontSize: 20.0,
            fontWeight: FontWeight.bold, // Text is bold
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                cursorColor: AppColor.teaGreen, // Cursor color to teaGreen
                controller: _categoryNameController,
                style: TextStyle(color: AppColor.teaGreen, fontWeight: FontWeight.bold), // Text color and bold inside TextField
                decoration: InputDecoration(
                  labelText: 'Category Name',
                  labelStyle: TextStyle(color: AppColor.teaGreen, fontWeight: FontWeight.bold), // Label color and bold
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.teaGreen, width: 2.0), // Set border color to teaGreen when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.teaGreen, width: 1.0), // Set border color to teaGreen when not focused
                  ),
                ),
              ),
              TextField(
                cursorColor: AppColor.teaGreen, // Cursor color to teaGreen
                controller: _wordController,
                style: TextStyle(color: AppColor.teaGreen, fontWeight: FontWeight.bold), // Text color and bold inside TextField
                decoration: InputDecoration(
                  labelText: 'Add Word',
                  labelStyle: TextStyle(color: AppColor.teaGreen, fontWeight: FontWeight.bold), // Label color and bold
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.teaGreen, width: 2.0), // Set border color to teaGreen when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.teaGreen, width: 1.0), // Set border color to teaGreen when not focused
                  ),
                ),
                onSubmitted: (_) => _addWord(),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.teaGreen, // Button background color to primaryDark
                ),
                onPressed: _addWord,
                child: Text(
                  'Add Word',
                  style: TextStyle(
                    color: AppColor.primaryColor, // Button text color to teaGreen
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold, // Text is bold
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Words:',
                style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.teaGreen), // Text color to teaGreen and bold
              ),
              ..._tempWords.map((word) => ListTile(
                title: Text(
                  word,
                  style: TextStyle(color: AppColor.teaGreen, fontWeight: FontWeight.bold), // Text color for words and bold
                ),
              )),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: AppColor.teaGreen, // Text color to teaGreen
                fontSize: 20.0,
                fontWeight: FontWeight.bold, // Text is bold
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.teaGreen, // Button background color to primaryDark
            ),
            onPressed: () {
              setState(() {
                _customCategories[index] = CustomCategory(
                  name: _categoryNameController.text.trim(),
                  words: List.from(_tempWords),
                );
              });
              Navigator.pop(context);
            },
            child: Text(
              'Save Changes',
              style: TextStyle(
                color: AppColor.primaryColor, // Button text color to teaGreen
                fontSize: 20.0,
                fontWeight: FontWeight.bold, // Text is bold
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _showAddCategoryDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.primaryColorDark, // Set background to primary color
        title: Text(
          'Create Custom Category',
          style: TextStyle(
            color: AppColor.teaGreen, // Title text color to teaGreen
            fontSize: 20.0,
            fontWeight: FontWeight.bold, // Text is bold
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                cursorColor: AppColor.teaGreen, // Cursor color to teaGreen
                controller: _categoryNameController,
                style: TextStyle(color: AppColor.teaGreen, fontWeight: FontWeight.bold), // Text color and bold inside TextField
                decoration: InputDecoration(
                  labelText: 'Category Name',
                  labelStyle: TextStyle(color: AppColor.teaGreen, fontWeight: FontWeight.bold), // Label color and bold
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.teaGreen, width: 2.0), // Set border color to teaGreen when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.teaGreen, width: 1.0), // Set border color to teaGreen when not focused
                  ),
                ),
              ),
              TextField(
                cursorColor: AppColor.teaGreen, // Cursor color to teaGreen
                controller: _wordController,
                style: TextStyle(color: AppColor.teaGreen, fontWeight: FontWeight.bold), // Text color and bold inside TextField
                decoration: InputDecoration(
                  labelText: 'Add Word',
                  labelStyle: TextStyle(color: AppColor.teaGreen, fontWeight: FontWeight.bold), // Label color and bold
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.teaGreen, width: 2.0), // Set border color to teaGreen when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.teaGreen, width: 1.0), // Set border color to teaGreen when not focused
                  ),
                ),
                onSubmitted: (_) => _addWord(),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.teaGreen, // Button background color to primaryDark
                ),
                onPressed: _addWord,
                child: Text(
                  'Add Word',
                  style: TextStyle(
                    color: AppColor.primaryColor, // Button text color to teaGreen
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold, // Text is bold
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Words:',
                style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.teaGreen), // Text color to teaGreen and bold
              ),
              ..._tempWords.map((word) => ListTile(
                title: Text(
                  word,
                  style: TextStyle(color: AppColor.teaGreen, fontWeight: FontWeight.bold), // Text color for words and bold
                ),
              )),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: AppColor.teaGreen, // Text color to teaGreen
                fontSize: 20.0,
                fontWeight: FontWeight.bold, // Text is bold
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.teaGreen, // Button background color to primaryDark
            ),
            onPressed: _addCustomCategory,
            child: Text(
              'Save Category',
              style: TextStyle(
                color: AppColor.primaryColor, // Button text color to teaGreen
                fontSize: 20.0,
                fontWeight: FontWeight.bold, // Text is bold
              ),
            ),
          ),
        ],
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondryColorDark,
        title: Text('Select Category'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality if needed
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Animals'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeApp(
                    words: animalWords,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Computer Science'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeApp(
                    words: cswords,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Sports'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeApp(
                    words: sportWords,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Countries'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeApp(
                    words: countryWords,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Fruits'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeApp(
                    words: fruitWords,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Movies'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeApp(
                    words: movieWords,
                  ),
                ),
              );
            },
          ),
          ..._customCategories.map((customCategory) => Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                customCategory.name,
                style: TextStyle(
                  color: AppColor.primaryColorDark,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Words: ${customCategory.words.join(', ')}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: AppColor.primaryColorDark),
                    onPressed: () => _editCategory(_customCategories.indexOf(customCategory)),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: AppColor.primaryColorDark),
                    onPressed: () => _deleteCategory(_customCategories.indexOf(customCategory)),
                  ),
                ],
              ),
              onTap: () {
                widget.onCategorySelected(customCategory.words);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeApp(
                      words: customCategory.words,
                    ),
                  ),
                );
              },
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCategoryDialog,
        child: Icon(Icons.add),
        backgroundColor: AppColor.primaryColorDark,
      ),
    );
  }
}

class CustomCategory {
  final String name;
  final List<String> words;

  CustomCategory({required this.name, required this.words});
}
