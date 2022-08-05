# NeXTCS Final Project
### Programmer 0: Krishna Dudani
### Programmer 1: Wyatt Smith
### Class period: 10
---
### Proposal
We will make a alien-invasion-themed tower defense game. Some portion of the curve of earth will be visible on the bottom of the screen. Aliens will fly down towards Earth from the top of the screen. If 10 alien ships land on Earth, all hope is lost; GAME OVER. You can build space-stations throughout the screen which shoot at alien ships. Aliens have health bars. You can also buy rammer-ships which fly around in nice curves towards aliens and crash into them doing some damage. After destroying an alien ship, users will collect rubedo - a rare space metal. They can use this material to construct new space-stations and rammer-ships, and upgrade existing ones. The player can pause the game by pressing space. When they click on a rammer-ship or space-station, they select it and see potential upgrades appear above it. Upgrades for space-stations include faster firing, more damage, and attack range. Upgrades for rammer-ships include faster speed, faster turning speed, and more crash damage.

### Classes and Files
Classes:
2) Ally: Has a PVECTOR location. Has a method to select nearest alien. Can be selected by being clicked on, and this will pop up a upgrade bar.
3) Space-station extends Ally: Has instance variable for each trait, such as firing speed. Has a method which shoots a projectile at an alien. Has a tick counter, and everytime this reaches the firing speed it will reset and shoot a projectile.
4) Rammer-ship extends Ally: Has instance variables for each trait, such as turning speed. Has a velocity PVECTOR. Has an instance variable which stores current alien target. Has a method which will use left and right boosters to accelerate toward current alien target. Will do damage to an alien if colliding with it.
5) Alien: Has a PVECTOR location, a health, and this health can be displayed above in a health bar. Has a method which moves it down the screen at a constant speed. Can check if colliding with earth; if so, do damage to earth.
6) Projectile: Has a PVECTOR location and velocity and a damage. Can check if colliding with an alien.
7) Earth: Just has a display method and a health.
8) Map; Stores ArrayLists of all the objects moving around the screen. Deals with interactions between them. Has an 'tick' method which moves all objects one tick forward in time.
###
Additional Files:
1) Art for the aliens, earth, rammer-ships, space-stations and projectiles stored as jpeg images
2) Sound effects and battle music stored as mp3s
### Concepts
1) Classes and subclasses for the aliens, rammer-ships, space-stations and projectiles
2) ArraysLists to store the aliens, rammer-ships, space-stations, projectiles, etc
3) Object-detection to determine when rammer-ships/projectiles hit aliens
4) PVectors and basic physics to control the movement of the rammer-ships; they will turn gradually by using left and right boosters.
5) Keyboard and mouse input (explained in User Interface)
6) Use of the sound library for zappy effects and battle music (if we have time)
7) Use of images pasted onto rectangles for space-art (like the DVD logo). Turning images to grayscale for when the player is deciding to build a defense. Giving images a yellow filter to show that that object is selected.
### User Interface
1. The player can press space to pause the game. 
2. The player can click on any available space to build a space-station. As the player hovers their mouse over space, they will see a grayscale version of a space-station beneath their mouse.
3. The player can click on a space-station to select it. When selected, the range of that space-station becomes visible by shading that portion of the screen red, also the space-station gets shaded yellow. Additionally, three buttons for trait upgrades appear in a row above that space station. Each button has three pieces of information on it: the current level of that trait, the name of that trait, and the price to upgrade that trait to the next level. Those buttons will be white with black text, with the three pieces of information in a vertical column. If the player can't afford the next upgrade for a trait, that button will be gray rather than white. The three traits are firing speed, damage, and attack range.
4. The player can click on a rammer-ship to select it. The rammer-ships are small, so there is a big click box for them. When selected, the rammer-ship turns yellow, and three buttons appear above just like for the space-stations.

<img width="564" alt="Screen Shot 2022-05-23 at 9 45 36 PM" src="https://user-images.githubusercontent.com/78610765/169931904-a78ea687-d1fd-4a79-a7a3-007e7f48bba6.png">
