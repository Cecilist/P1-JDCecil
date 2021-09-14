# Project 1: Un-named 2D Physics-Based Game
Created By: Jacob Cecil

This project was assigned as Project 1 by Dr. Gestwicki for CS 315 Game Programming at Ball State University during the Fall 2021 semester. 

## Instructions:
Goal: Get the ball to the flag.

Hold Space bar to build power, and let go to launch.

Up arrow - Increase angle of launch

Down arrow - Decrease angle of launch

## Project Report
### Iteration 1: 
I was really excited to start this project! Looking ahead to what the final iteration is supposed to look like, I can see this project quickly becoming the kind of game I would play on some flash game site instead of paying attention in high school. Most of the necessary tools were demonstrated to us in class, so this first iteration wasn't to challenging. The only thing I had to figure out to meet all of the B requirements was clamping. Luckily Godot's built-in clamp method was eay to understand. The A requirements were where a lot more trial and error took place. At the start, I had ideas to incorporate more visual elements to display power and angle, but alas my schedule was tight this week. I wanted to try and implement kind of meter to show power. For angle, I envisioned a simple arrow that would point in the angle the projectile would travel. One easy thing I hope to implement soon is putting a maximum on power.

### Iteration 2: 
At the start of this iteration, I foolishly believed that this weeks tasks would be simple. I allready had 2D graphics, and adding a sound effect was easy enough. I found a sound on free sound, that is supposed to simulate the sound a far off cannon. The originated from a basketball which, since my projectile is just a weird alien ball thing, seemed appropriate. Instancing my projectile proved to be a difficult task, one which I was unable to complete in the given time period. My first idea to achieve this was attaching a visibility notifier to the projectile scene, and kill the current instance of projectile on the viewport_exited signal. Then, when the projectile node sent the exit_tree() signal, I attempted to create a new instance of projectile. This would work once, but my guess is the instance of projectile wasn't inheriting the exit_tree() signal the way I thought it would. I tried another method involving an Area2D covering the entire level that would use signals to "respawn" the projectile when the projectile exited the area, but that didnt pan out either. I'm hoping to remedy this by the end of iteration 3. I still hope to also add a maximum on power, show some kind of power "charging" animation, and some graphical indication of the angle of the projectile. 


Self Evaluation: 

I beleive I have met all requirents for a B
- [x] D-1: The repository link is submitted to Canvas before the project deadline.
- [x] D-2: The repository contains a <code>README.md</code> file in its top-level directory.
- [x] D-3: The project content is eligible for an <a href="https://www.esrb.org/ratings-guide/">ESRB Rating</a> of M or less.
- [x] C-1: Your repository is well-formed, with an appropriate <code>.gitignore</code> file and no unnecessary files tracked.
- [x] C-2: Your release is tagged using <a href="https://semver.org/">semantic versioning</a> where the major version is zero, the minor version is the iteration number, and the patch version is incremented as usual for each change made to the minor version, and the release name matches the release tag.
- [x] C-3: You have a clear legal right to use all incorporated assets, and the licenses for all third-party assets are tracked in the <code>README.md</code> file.
- [x] C-4: The <code>README.md</code> contains instructions for how to play the game or such instructions are incorporated into the game itself.
- [x] C-5: The project content is eligible for an <a href="https://www.esrb.org/ratings-guide/">ESRB Rating</a> of T or less.
- [x] C-6: The projectile and targets are shown with 2D graphics.
- [x] C-7: The game plays an appropriate sound effect when the projectile is fired.
- [x] B-1: The <code>README.md</code> file contains a personal reflection on the iteration and self-evaluation, as defined above.
- [x] B-2: Earn one star.
- [ ] A-1: Earn three stars.
- [ ] ⭐ The player has a small inventory of projectiles, and only one can be launched at a time.
- [x] ⭐ The background and ground use 2D graphics.
- [ ] ⭐ A <abbr title="Heads-Up Display">HUD</abbr> shows the current game state such as the score and number of projectiles remaining.

## Third Party Assets 
All fonts used are built into the Godot engine. 

Launch sound effect uploaded by freesound.org user stomachache. (CC0 1.0 Universal) Source: https://freesound.org/people/stomachache/sounds/565794/

All other Assets, as of version 0.2.0, created by Kenney.nl (CC0 1.0 Universal) Source: https://www.kenney.nl/assets/physics-assets

