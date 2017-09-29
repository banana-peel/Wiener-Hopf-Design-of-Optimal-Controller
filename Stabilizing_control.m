%This code will find the stabilizing controller for the given system

A = [1 3.16 0.186 1.324]
B = -47.24*[1 0.03622]
[fpart, rem] = deconv(A,B)
Y = (-fpart)/1.3214
L = [1 4 7 7 4 1]
L1 = [1 1]
L = conv(L,L1)
M = [-0.0160 -0.07954 -0.17327 -0.197064 -0.12933 -0.4414]
BM = conv(B,M)
dem = XL - BM
XL = 0.75677*L
dem = XL - BM
YL = conv(Y,L)
AM = conv(A,M)
num = YL + AM