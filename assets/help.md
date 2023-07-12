# Appy Pizza

This app can be used to calculate which pizza size option is the best value for money.

Let's say, you go to a pizzeria, and you see the following prices on the menu:

* Normal - 33 cms - € 10.50
* Medium - 40 cms - € 15.50
* Family - 50 cms - € 22.00

You are on a budget, so you would like to know which size is the best deal, by comparing the 
price per surface area for the different options.

Here is how you do that:

* On the home screen of the app you click the "+" button, by which you create a new "calculation".
* You give it a name, which can be the name of the pizzeria, or the flavor pizza, for example. 
* A new screen opens that displays the newly created calculation. It does not contain any size options yet. 
  You need to add them one by one.
* For each option (Normal / Medium / Family in our case) you do the following:
  * Click on the "+" button, which adds a new option to the calculation
  * Click on the "Name" field and either pick one from the list (like: "Medium"), or define a new one
    if needed (by clicking on the "gear" icon on the top right)
  * Click on diameter and type the size of the pizza. The unit does not matter (like inches or centimeters) 
    as long as you give the size in the same unit for all options. If you have the dimension of the radius, 
    instead of the diameter, that is also fine.
    The shape of the pizza is also irrelevant (like, "square pizza") as long the size is defined by a some length
    measurement.
  * Click on the "Price" and specify the, well, price. The currency is irrelevant. 
  * Click on the "disk" icon. The option will be added to calculation and the app will return to the screen that 
    lists the options. 
* The app runs the calculation each time you add an option, so once you added all of them, all you need to do is
  look at the list and see how the value for money for the different options compares to one another. The first 
  three columns contain the values that you have entered. You will want to look at the fourth column. This 
  column displays the relative price per pizza surface, compared to the cheapest option. By default, the
  list will be sorted by this column so the best value will be in the first line. You can confirm this by 
  checking that the first line displays a medal (🥇) icon, this option is the winner. The rest of the 
  lines will contain a decimal number that represents how much higher the price per surface area is for those 
  options, compared to the cheapest one.

The app is free and displays no ads. The source code is also available [here](https://github.com/maprohu/pizza_flutter).

Bom apetite! 😋
