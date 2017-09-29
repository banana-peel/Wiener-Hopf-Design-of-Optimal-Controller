---
abstract: |
    This project involves developing stabilizing controller for controlling
    the cyclic pitch dynamics of the helicopter. Initially the set of all
    stabilizing controllers are found and then one of them is selected to
    eliminate steady state error for a step response and give a finite value
    for ramp response. The frequency response of the sensitivity function of
    this controller is then plotted. It’s seen that the response goes to 1
    as frequency goes to infinity. In the next part we design an optimal
    controller. Here we give equal weight to the input and output cost.
    Simulations for various input responses are given for both the
    controllers
...

This is the project for fulfilling the course requirements for EL6243
System Theory and Feedback Control. The project involves implementation
of a Weiner Hopf design on a third order system and developing
stabilizing controllers for the same.

Participant: Saurabh Pitre

Course Instructor: Prashant Krishnamurthy

INTRODUCTION
============

The system considered here is a helicopter and stabilizing controllers
are developed for it’s dynamics at hover. More specifically the dynamics
for its pitch attitude are analyzed and a controller is developed for
controlling it. At hover the longitudinal and vertical dynamics are
decoupled and the transfer function for pitch control looks as follows.
$$\frac{\theta}{\text{B}_{LC}} =  \text{M}_{BL_c}\bigg[\frac{s + \frac{X_{BLc}M_u}{M_{BLc}}-X_u}{s^3 - (X_u + M_q)s^2 + M_qX_us + gM_u}\bigg]$$

Here $\theta$ is the pitch attitude in $deg$ and $\text{B}_{LC}$ is
pitch control in $deg$

Designing set of all stabilizing controller
===========================================

We first find the set of all stabilizing by finding values of
$\delta(r), \delta(M), \delta(L)$. As we are designing this controller
to give zero steady state error for step response we assume
$\delta(f) = 1$ also $\mu \nu$ hence we choose $\mu = 2$ as we have a
first oreder numerator and third order denominator. With this we get:
$$\delta(M)=5, \delta(L)=6, \delta(r)=3$$

Finding values of X and Y
-------------------------

To find the values of A and B we first consider $G_PH$ which comes out
as $$G_pH = \frac{-47.24s - 1.711}{s^3+ 3.16s^2 + 0.186s + 1.324}$$

Hence $A =s^3+ 3.16s^2 + 0.186s + 1.324$ and $B = -47.24s - 1.711$.
Factorizing this to get the value of X and Y such that $AX + BY = 1$ we
get $$X = 0.75677 \text{ and }Y= 0.016s^2 + 0.05s + 0.0012$$

Finding the set of all stabilizing controller
---------------------------------------------

we assume L to be $L = s^6 + 5s^5 + 11s^4 + 14s^3 + 11s^2 + 5s + 1$ a
strict hurwitz polynomial. Now the equation of the controller is given
by $$G_c = \frac{YL + AM}{XL-BM}$$ where M is given by
$M = M_5s^5 + M_4s^4 + M_3s^3 + M_2s^2 + M_1s + M_0$. Now sublstituing
the given values inside the first eqution $YL + AM$ we solve for $M$ by
setting the degrees above $\delta(r)$ to $0$. Additionally we require a
finite value of $Kv$ to get $0$ steady state error. For this we need
$sG_c(0)$ to be finite. This gives us a condition on $M_0$ Solving this
we get the following values of $M$ $$M_5 = -0.0160$$ $$M_4 = -0.07954$$
$$M_3 = -0.17327$$ $$M_2 = -0.197064$$ $$M_1 = -0.12933$$
$$M_0 = -0.4414$$

Substituting the values in the equation of $G_c$ we get
$$G_c = \frac{-0.4692s^3 - 1.4007s^2 -0.1975s - 0.5832}{s^3 + 1.877s^2 -17.2892s}$$

Simulation Result
-----------------

Firat the open loop operation of the is presented here.

![\[fig:openloop\]Open loop response of the
system.](images/openloop.jpg){width="100.00000%"}

It can be seen that the system is unable to track a step response
without a stabilizing controller. Next we simulate the response of the
system with the stabilizing controller found in the previous section for
a step input in Figure 2. There is also an added component of sinusoidal
disturbance for this.

![\[fig:stabilizin\_step\]Step
response.](images/stabilizing_step.jpg){width="80.00000%"}

It is seen that the controller succesfully stabilizes the system for a
step input. In addition to this we also simulate the system for a ramp
and sinusoidal input.

![\[fig:stabilizing\_ramp\]Ramp
Response.](images/stabilizing_ramp.jpg){width="80.00000%"}

![\[fig:stabilizing\_sin\]Sinusoidal
Response](images/stabilizing_sin.jpg){width="80.00000%"}

Addtionally the frequency response of the senitivity of the given
controller is given by the bode plot. It is observed that the magnitude
of the sensitivity goes to $0$ at $0$ frequency and goes to $1$ for high
frequencies

![\[fig:bode\_set\]The bode plot of the sensitiviy
function](images/bode_set.jpg){width="80.00000%"}

Finding the optimal controller
==============================

In this section we find the optimal controller. The optimal controller
can be found by integrating the square of the error and input. We can
also put different weights on the input and error to decide what is
penalized more. The error function is given as
$$J =\frac{1}{2\pi j} \int_{-j\inf}^{j\inf}[E(s)E(-s) + kU(s)U(-s)]ds$$

For this we assume the reference input is $R = \frac{1}{s+2}$ and
$k = 1$ additionally $G_uG_{u*} = 1$ and $HH_*=1$ It is observed that
all the assumptions A1 to A6 for designing set of sensitivity functions
of stabilizing controllers is satisfied.

Finding  and 
-------------

Implementing this in MATLAB we can find the values of  and as
$$\Phi 1 =\frac{-s^8 + 13.61 s^6 - 2262 s^4 + 8898 s^2 - 18.72}{2232 s^6 - 1.786e04 s^4 + 3.573e04 s^2 - 46.84}$$

$$\Phi 2 = \frac{s^6 - 9.614 s^4 - 8.333 s^2 - 1.753}{ 2232 s^4 - 8929 s^2 + 11.71}$$

Additionally for this $\chi_r$ is $1$ hence we can find the values of
$\Omega$ and $\Omega_*$ as
$$\Omega = \frac{(s + 0.04588)(s^2 + 10.19s + 47.15)}{(s+2)(s+0.03622)}$$
$$\Omega_* = \frac{-0.00044811(s - 0.04588)(s^2 - 10.19s + 47.15)}{(s-2)(s-0.03622)}$$

Now we need to calculate the value of $\Gamma_l$. This can be done by
taking the partial fractions of $\frac{\Phi 2\chi_r\chi_r}{\Omega_*}$.
Taking the terms with poles in the left half plane we get.
$$\Gamma_l = \frac{0.3194s - 0.2491}{s^2 1.721s + 0.06805}$$

Now the formula for sensitivity function is given by:
$$S_o = \frac{f(s)-\Gamma_l}{\Omega}$$

Now the degree of $f(s)$ is 1 as
$\delta(f(s)) = \delta(n_{\Omega}) - \delta(d_{\Omega})$

Substituting the value of $\Gamma_l$ in the above equation we get
$$S_o = \frac{(f_1s + f_0)(s^2 + 2.036s + 0.07244) - 0.3258s 0.2471}{(s + 0.04588)(s^2 + 10.19s +47.15)}$$

Now we need $1-S_o =\bigg( \frac{1}{\omega^{l+1}}\bigg)$. This will
decide the top $l+1$ coefficients of $S_o$. Solving we get
$$f_1 = 1\text{ and }f_0 = 8.2035$$

Solving we get the optimal sensitivity function as
$$S_o = \frac{s^3 + 10.24 s^2 + 16.45 s + 0.842}{s^3 + 10.24 s^2 + 47.62 s + 2.163}$$

The corresponding stabilizing controller is
$$G_c = \frac{- 0.6595 s^4 - 2.113 s^3 - 0.211 s^2 - 0.8787 s -0.03703}{s^4 + 10.28 s^3 + 16.82 s^2 + 1.438 s + 0.0305}$$

Simulation of Optimal Controller
--------------------------------

![\[fig:simulink\_model\]The Simulink Model used to simulate the
system](images/simulink_model.jpg){width="80.00000%"}

![\[fig:optimal\_bode\]The Bode plot of the sensitivity
function](images/optimal_bode.jpg){width="80.00000%"}

![\[fig:optimal\_reference\]Tracking of the reference
trajectory](images/optimal_reference.jpg){width="80.00000%"}

![\[fig:optimal\_ramp\]Error while tracking a ramp
reference](images/optimal_ramp.jpg){width="80.00000%"}

These simulations are done with additional sinusoidal disturbance input
as shown in the simulink figure.

From the Bode plot it is seen that the sensitivity function goes to $1$
as s goes to $\infty$. Additionally it can be seen that the controller
is able to track the given reference trajectory, which is a decay from
an initial value to $0$ with 0 steady state error. However it does not
track a ramp output properly.

Conclusion
==========

It is observed that the two controllers designed to control the cyclic
pitch of the helicopter are able to control the cyclic pitch for the
given reference trajectory with minimal error. Additionally the optimal
control is able to achieve this at a reduced overall cost.

It should be noted however that we weren’t able to design the optimal
controller for a step response. This is because even though one of the
set of all stabilizing controller stabilized a step response, that
wasn’t the optimal controller.
