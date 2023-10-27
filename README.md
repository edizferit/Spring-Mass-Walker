# Spring Mass Walking Model

A project for Technische Universität München's **IN2352: Applied Biorobotics** class.

A SIMULINK model is created by using the **spring loaded inverted pendulum (SLIP)** system that will represent bipedal walking. From that model, several values like speed, position, and spring forces are extracted to MATLAB. Plots are produced, which give the opportunity to investigate the patterns in bipedal walking, energy transformation during motion, stability of the system, failure modes, and spring forces. Also, maximum and instantaneous speeds are calculated.

- Report can be seen [here](report/report.pdf).
- Simulink model can be seen [here](simulink-image.png).

<p align="center">
  <img src="https://github.com/edizferit/Spring-Mass-Walking-Model/blob/main/figures/preview.jpg?raw=true" width="80%">
</p>
<p align="center">
  (source: <a href="https://doi.org/10.1109/ROBOT.2010.5509500">J. Rummel, 2010</a>)
</p>

### Mass's Trajectory and Spring Forces

Trajectory of the mass in 2D space (x,y) and spring forces are shown below. Red colored lines show the spring forces belonging the first leg while the black ones represents the second leg.

<p align="center">
  <img src="https://github.com/edizferit/Spring-Mass-Walking-Model/blob/main/figures/forces.png?raw=true" width="80%">
</p>

### Stability Analysis of Limit Cycle

Vertical velocity and position are plotted against each other. The model converged to a limit cycle showing the system is stable, which can be seen below:

<p align="center">
  <img src="https://github.com/edizferit/Spring-Mass-Walking-Model/blob/main/figures/limitcycle.png?raw=true" width="80%">
</p>

**Average forward speed** is found as approximately 1.1 m/s which is equal to 3.96 km/h. A human can walk in that speed which shows that this model is compatible with the real world. Note that, the mass and the spring lengths are chosen such that they are similar to the measures of a human. This enables us to comment on the validity of the forward speed of the model.

