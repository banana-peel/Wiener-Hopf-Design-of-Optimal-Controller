%This code will give the optimal controller transfer function

num = [-47.24 -1.711]
dem = [1 3.16 0.186 1.324]
num_gp_s = [47.24 -1.711]
dem_gp_s = [-1 3.16 -0.186 1.324]
num_gp = conv(num,num_gp_s)
dem_gp = conv(dem,dem_gp_s)
dem_traj = conv([1 2],[-1 2])
dem_phi_r = conv(num_gp,dem_traj)
phi_r = tf(dem_gp,dem_phi_r)
phi_l = tf(1,dem_traj)
phi = phi_l + phi_r
zpk(phi)
phi2 = (-1)*phi_r
zpk(phi2)
s = tf('s')
omega_s = (-0.0004481)*(s - 0.04588)*(s^2 -10.19*s + 47.15)/((s-2)*(s - 0.003622))
poly = phi2/omega_s
poly_zpk = zpk(poly)
poly_num = [-1 2.004 9.606 -19.26 8.403 -16.7 1.813 -3.512 0.0127]
poly_dem = [1 -10.24 43.62 38.79 -109.5 8.602 0.2499 -0.01135]
[r,p,k] = residue(poly_num,poly_dem)
s = tf('s')
omega = (s + 0.04588)*(s^2 + (10.19*s) + 47.15)/((s + 2)*(s + 0.03622))
gammal_1 = (-0.132156)/(s + 0.03622)
gammal_2 = 0.457978/(s + 2)
gammal = gammal_1 + gammal_2
f_s = (s + 8.2035)
So = (f_s - gammal)/omega
So = minreal(So)
Gp = tf(num,dem)
Gc = (1 - So)/(So*Gp)
Gc = minreal(Gc)
