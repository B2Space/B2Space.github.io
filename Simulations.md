---
title: Pageone
layout: default
filename: Simulations.md
---

# Rocket Simulations
This page contains the simulations I have created and will be updated with new and revised versions. As I am still learning about rocketry and coding, some of these may seem rudimentary, but it is all for the purpose of documenting my learning.


### Simple Projectile Motion

The aim of this simulation was to get an undertsanding of the forces and behaviour of a body with initial velocity and in freefall. In general, this type of motion falls under [Projectile Motion.](https://phys.libretexts.org/Bookshelves/University_Physics/Book%3A_Physics_(Boundless)/3%3A_Two-Dimensional_Kinematics/3.3%3A_Projectile_Motion) However it does not incorporate real world dynamics of wind resistance/drag, weightforce and thrust if it was a powered body. 



From projectile motion, the next step up is powered flight vertically with constant force upwards. This means Newton's Equations need to be used to derive an Equation of Motion based off the forces on the body.



### Orbits

The aim of this project was mainly for me to get used to Object Oriented Programming. In fact this is the first project where I use OOP, simply to model the solar system with the planet's size and orbital radius being totally inaccurate. Actually, the only kind of accurate thing about this simulation is the order of planets and their rotation speeds which are factor 10 less than what is stated on [NASA's Planetary Fact Sheet](https://nssdc.gsfc.nasa.gov/planetary/factsheet/).

The code to this project is located [here](./Code/Processing/SimpleOrbit.pde).

A short GIF below shows how it looks:

![orbit](https://user-images.githubusercontent.com/68944131/89402012-8c0dd780-d759-11ea-8d5e-232bd8a3f53b.gif)

















### Saturn V Simulation

#### Description
Saturn V was the flagship of NASA used to launch Apollo towards the Moon in its 1969 journey. It was one of the heaviest and largest rockets every built. It was a three stage rocket which utilized a Rocketdyne F-1 rocket motor.

#### Flight Path
The rocket launches completely vertical but levels off during its second stage. This means not only does it experience altitude gain, but also downrange gain. At the end of Stage 1, Saturn V is recorded to be in the North Atlantic Ocean `93 km` away from the launch site at Cape Canaveral with an altitude of`61 km` travelling at `2380 m/s`. At the end of Stage 2, Saturn V is recorded to be completely horizontal at a downrange of `185 km` away from the launch site. Just before Stage 3.1 occurs, Saturn V is recorded to jettison its spent Stage 2 frame at `3200 km` downrange. Once the Stage 3.1 motors fire for around `165 seconds`, it is put into a stable parking orbit. It continues to revolve in this orbit for up to `3 times` before Stage 3.2 motors fire, putting it on a translunar trajectory towards the moon.

#### Data

Stage | Thrust | Fuel | Oxidizer | Burn Time | Fuel Mass | Rocket Body Mass | Coasting Period 
------------ | ------------ | ------------ | ------------ | ------------ | ------------| ------------ | ------------
Stage 1 | 33.4 MN | Refined Kerosene | Liquid Oxygen | 150 s | 2.04 Mt | 0.136 Mt | 4.4 s
Stage 2 | 5.02 MN| Liquid Hydrogen | Liquid Oxygen| 360 s | 0.428 Mt| 0.0432 Mt| 6.5 s
Stage 3.1 | 1.00 MN| Liquid Hydrogen| Liquid Oxygen| 165 s | 0.0356 Mt| - | 3 orbits
Stage 3.2 | 1.00 MN| Liquid Hydrogen| Liquid Oxygen| 312 s | 0.0674 Mt| 0.0174 Mt| - 

#### Assumptions
For the sake of modelling the rocket to create a simulation, it is necessary to make assumptions about the rocket's flight and its dynamics.
1. Saturn V is modelled as a single rigid body that 'discharges' mass instantaneously when jettisonning spent stages.
1. Interconnections between the stages such as latching mechanisms, and other mechanical components such as damping and springforce will not be modelled.
1. Thrust is constant until fuel runs out in that stage.
1. Drag is not considered.
1. Gravity does not remain constant at all altitudes.
1. During the 'Coasting period' there is 0 net force on the rocket.





