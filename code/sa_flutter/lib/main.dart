import 'package:flutter/material.dart';
import 'package:sa_flutter/models/recipe.dart';
import 'package:sa_flutter/networking/api_client.dart';
import 'package:sa_flutter/widgets/recipe_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Food Book'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  bool receiptsAndInstructionReceived = false;
  List<Recipe> fullRecipes = List();
  final ApiClient apiClient = ApiClient();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/seasoning.jpeg"),
              fit: BoxFit.cover,
            ))),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.blueGrey.withOpacity(0.6),
              centerTitle: true,
              title: Text(widget.title),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.autorenew),
                  onPressed: () {
                    setState(() {
                      isLoading = false;
                      receiptsAndInstructionReceived = false;
                    });
                  },
                ),
              ],
            ),
            body: Center(
              child: receiptsAndInstructionReceived
                  ? ListView.builder(
                      itemCount: fullRecipes.length,
                      itemBuilder: (context, index) {
                        final Recipe item = fullRecipes[index];
                        return RecipeCard(item);
                      })
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isLoading
                              ? CircularProgressIndicator(backgroundColor: Colors.white)
                              : Column(
                                  children: <Widget>[
                                    TextField(
                                        onChanged: (value) {
                                          searchQuery = value;
                                        },
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: 'Search',
                                            prefixIcon: Icon(Icons.search),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25))))),
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(28.0)),
                                        splashColor: Colors.white,
                                        color: Colors.blueGrey.withOpacity(0.9),
                                        onPressed: () {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          apiClient
                                              .getRecipeAndInstructionsBySearchstring(
                                                  searchString: searchQuery)
                                              .then((result) {
                                            setState(() {
                                              receiptsAndInstructionReceived =
                                                  true;
                                              fullRecipes = result;
                                            });
                                          });
                                        },
                                        child: Text(
                                          'Search',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                        )
                      ],
                    ),
            ))
      ],
    );
  }
}
