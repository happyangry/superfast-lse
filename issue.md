Hi. 

I'm using superfast-lse for direction of arrival estimation. So I need to modify the signal model due to different array configurations.

For uniform linear array (ULA), the single-frequency signal model is `\sum_k exp(sign*j*2*pi*d/lambda*[0:N]*cos(\theta))`, where `d` denotes the sensor interval and `lambda` is the wavelength, here we choose `d=lambda/2` so `d/lambda=0.5`.