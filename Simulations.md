---
title: Pageone
layout: default
filename: Simulations.md
---

# Rocket Simulations
This page contains the simulations I have created and will be updated with new and revised versions. As I am still learning about rocketry and coding, some of these may seem rudimentary, but it is all for the purpose of documenting my learning.

### Simulation 1: Saturn V (26/06/2020)

#### Description
Saturn V was the flagship of NASA used to launch Apollo towards the Moon in its 1969 journey. It was one of the heaviest and largest rockets every built. It was a three stage rocket which utilized a Rocketdyne F-1 rocket motor.

#### Flight Path
The rocket launches completely vertical but levels off during its second stage. This means not only does it experience altitude gain, but also downrange gain. At the end of Stage 1, Saturn V is recorded to be in the North Atlantic Ocean `93 km` away from the launch site at Cape Canaveral. At the end of Stage 2, Saturn V is recorded to be completely horizontal at a downrange of `185 km` away from the launch site. Just before Stage 3.1 occurs, Saturn V is recorded to jettison its spent Stage 2 frame at `3200 km` downrange. Once the Stage 3.1 motors fire for around `165 seconds`, it is put into a stable parking orbit. It continues to revolve in this orbit for up to `3 times` before Stage 3.2 motors fire, putting it on a translunar trajectory towards the moon.

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





