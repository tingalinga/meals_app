import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static final routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildTitle(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildTitle(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
