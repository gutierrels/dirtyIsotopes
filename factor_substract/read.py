import numpy as np
import matplotlib.pyplot as plt
from scipy.ndimage import gaussian_filter

x, y, z = 180, 180, 300
dtype = np.float32 
F = 75.86 

dataAB = np.fromfile('phantom1_AB.img', dtype=dtype)
dataB_prime = np.fromfile('phantom1_B_prime.img', dtype=dtype)

dataAB, dataB_prime = dataAB.reshape((z, y, x)), dataB_prime.reshape((z, y, x))
dataB_prime = gaussian_filter(dataB_prime, sigma=1.5)
dataB = F * dataB_prime
dataA = np.maximum(0, dataAB - dataB)

slice_z = z // 2
image_slice = dataAB[slice_z, :, :]
image_sliceB_prime = dataB_prime[slice_z, :, :]

image_sliceB = dataB[slice_z, :, :]
image_sliceA = dataA[slice_z, :, :]

# gráficas

plt.figure(figsize=(10, 8))
plt.subplot(2, 2, 1)
plt.imshow(image_slice, cmap="gnuplot") 
plt.title(f'Image Slice AB (z={slice_z})')
plt.colorbar(label='Intensity')

plt.subplot(2, 2, 2)
plt.imshow(image_sliceB_prime, cmap="gnuplot") 
plt.title(f'Image Slice B_prime (z={slice_z})')
plt.colorbar(label='Intensity')

plt.subplot(2, 2, 3)
plt.imshow(image_sliceB, cmap="gnuplot") 
plt.title(f'Image Slice B (z={slice_z})')
plt.colorbar(label='Intensity')

plt.subplot(2, 2, 4)
plt.imshow(image_sliceA, cmap="gnuplot") 
plt.title(f'Image Slice A (z={slice_z})')
plt.colorbar(label='Intensity')
plt.savefig('mp.png')

# Guardar solo la imagen A
plt.imsave('solo_A.png', image_sliceA, cmap="gnuplot")

# Guardar solo la imagen B_prime
plt.imsave('solo_B_prime.png', image_sliceB_prime, cmap="gnuplot")

