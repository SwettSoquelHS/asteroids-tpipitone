Asteroids (Part 1)
==================
In this assignment we will start to replicate the old video game Asteroids. You will write a program that has a space ship that can be controlled with the keyboard. You will need to write a `Spaceship` class. Your `Spaceship` class will extend the `Mover` class which will represent the things that move. Because things that move are not limited to our asteroid game there is an interface called `Moveable` for the Mover class to implement. The `Mover` class will implement the `Movable` interface but some of the methods defined in `Moveable` will be implmented in subsequent classes which means we will need to make Mover an `abstract` class and tag those methods to be implemented later as abstract too.

An `abstract` class is an "incomplete" class. It has `abstract` methods--incomplete methods that have no body. Once you write a class that extends an `abstract` class, you then typically write the methods that are needed to "complete" the class. _Note: To complete (Part 1)  of the assignment you will be writing two classes `Spaceship` and `Star`._

Suggested steps to complete this assignment
-------------------------------------------
* Clone this repository.
* Open the program by opening `AsteroidsGame.pde` in Processing.
* Uncomment the `implements Movable` on Line 70
* Scroll down to line 128-ish, and complete Moveable by implementing the get/set methods outlined in the Movable interface.
  * Note, that I have taken care of `update, collidingWith`.  `show` has been tagged as abstract and will be overriden in sub-classes.
* Uncomment the `extends Mover` on Line 7-ish of `Spaceship.pde`
* The `Spaceship` class inherits from `Mover` and the only method you need to implement is `show()` and the two constructors previously defined in Mover
  * Note, an instance of Spaceship will have all the variables already specified in Mover. You do need to redefine these variables.
* Write the `Spaceship` constructors. You may find slides #1 - 68 on [Asteroids slideshow](https://docs.google.com/presentation/d/1-NUJtmxfJ06K_RFNjdTwKlqEEAw7JUvq_0nx43Fobu4/edit#slide=id.g45b409ab78_7_6) and the [Spaceship design worksheet](https://docs.google.com/document/d/14BTGf9DjeZZfd5FJKUQzFo_K2eOOf1wwiqPe-EshhQM/edit?usp=sharing) helpful. You may also find [this sample Spaceship program](https://apcslowell.github.io/AsteroidsVariableDemoV2/) helpful in understanding how the `protected Mover` variables affect the Spaceship's movement.
* At the top of `AsteroidsGame.pde`, declare a variable of type `Spaceship`
* Initialize the `Spaceship` as a new instance of the class
* In `draw()` in `AsteroidsGame.pde` call the Spaceship's `show()` function.

Next, is to get your ship to respond to key presses
---------------------------------------------------
* When you are happy with appearance of the Spaceship, add a `public void keyPressed()` function in `AsteroidsGame.pde`
  * (We did this work before break, so I have already included keyPressed/keyReleased)
* Write code in draw that checks which keys have been pressed and tell the spaceship to act accordingly.
  * If left arrow, you might tell the shapship to rotate( -0.1 ), or if right arrow to rotate(0.1)
  * your spaceship class will probably need to introduce extra functionality, such as rotate and increase speed
* We haven't implemented the hyperspace functionality yet, so you will need to do this. (Follow the pattern for up arrow and the other keys) 
  * There is no requirement for any fancy visual effects, hyperspace just needs to stop the ship, and give it a new random position and direction.
* Add code to the `draw()` in `AsteroidsGame.pde` to `update()` the Spaceship
* OPTIONAL: If you have extra time and are looking for a challenge, you might try to add an animation of "rockets" that appear from the back of the ship when you accelerate, simliar to the [this sample Spaceship program](https://apcslowell.github.io/AsteroidsVariableDemoV2/). 

Finally, get draw a starfield for a nice background effect
----------------------------------------------------------
* Finish the `Star` class in `Star.pde`
  * Create Star constructors, and their own show() method.
* Finally, add code to `AsteroidsGame.pde` that declares and initializes an array of instances of the `Star` class to create a number of stars in random positions.

Some important things to keep in mind
-------------------------------------
1. Abstract classes are "unfinished"
2. Abstract classes are one way that programmers can collaborate and divide up the work of a large program
3. You're collaborating! Some of the work for the `Spaceship` class has already been done in the `Mover` class. Don't change it! Your job is to extend the `Mover` class to "build on top of it" to make a `Spaceship` class. 
3. To create the `Spaceship` class you need to write a constructor and finish the "unfinished" `abstract` functions in `Floater`.
4. When you are sketching out your ship on th [Spaceship design worksheet](https://docs.google.com/document/d/14BTGf9DjeZZfd5FJKUQzFo_K2eOOf1wwiqPe-EshhQM/edit?usp=sharing) make sure the ship is centered at (0,0) and pointing to the right - this can be used for your asteroids down the road too.
4. Don't declare any duplicate variables in your `Spaceship` class. You are inheriting all the variables you need from `Mover`
5. Make sure your `Spaceship` constructor initializes all 9 of the `protected` variables it inherits from `Mover`

Samples of Student Work
-----------------------
[Timmy](https://tidang.github.io/AsteroidsGame/)   
[David](https://daamaya.github.io/AsteroidsGame/)   
[Erica](https://ekwkk.github.io/AsteroidsGame/)   
[Joanna](https://j0annalu.github.io/AsteroidsGame/)   
[Jonathan](https://jonathanchu33.github.io/AsteroidsGame/)   
[Derek](https://keredlew.github.io/AsteroidsGame/)   
[Mi-Kaela](https://mikamarciales.github.io/AsteroidsGame/)   



*This assignment was selected as a "Nifty CS Assignment" in 2008 by Nick Parlante @ Stanford*
