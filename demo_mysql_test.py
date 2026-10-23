import numpy as np  
import matplotlib.pyplot as plt
import sys

# # Create 250 random numbers between 0 and 5
# x = np.random.uniform(0.0, 5.0, 250) #np.random.uniform(low, high, size)

# # Draw histogram with 5 bins
# counts, bins, patches = plt.hist(x, 5)

# # Show the y-values (frequencies)
# print("Y-values / counts:", counts)

# # Show the x bin edges
# print("Bin edges:", bins)

# # Display the histogram
# plt.show()

# x = np.random.normal(5.0, 1.0, 100000) #np.random.normal(mean, std, size)
# plt.hist(x, 100)
# plt.show()

# #Two  lines to make our compiler able to draw:
# plt.savefig(sys.stdout.buffer)
# sys.stdout.flush()

# Scatter Plot
# x = [5,7,8,7,2,17,2,9,4,11,12,9,6]

# y = [99,86,87,88,111,86,103,87,94,78,77,85,86]

# plt.scatter(x, y)
# plt.show()

# # random data distribution (scatter plot)
# x = np.random.normal(5.0, 1.0, 1000)
# y = np.random.normal(10.0, 2.0, 1000)

# plt.scatter(x, y)
# plt.show()

#MACHINE LEARNING -LINEAR REGRESSION
import matplotlib.pyplot as plt
from scipy import stats

x = [5,7,8,7,2,17,2,9,4,11,12,9,6]
y = [99,86,87,88,111,86,103,87,94,78,77,85,86]

slope, intercept, r, p, std_err = stats.linregress(x, y)

def myfunc(x):
  return slope * x + intercept

mymodel = list(map(myfunc, x))

plt.scatter(x, y)
plt.plot(x, mymodel)
plt.show()

## Find (r) or even any value(eg slope, p etc) using scipy
from scipy import stats

x = [5,7,8,7,2,17,2,9,4,11,12,9,6]
y = [99,86,87,88,111,86,103,87,94,78,77,85,86]

slope, intercept, r, p, std_err = stats.linregress(x, y)

print(r) # -0.76 => has a rlshp but not perfect


# Use our data to predict speed for a 15 year car
x = [5,7,8,7,2,17,2,9,4,11,12,9,6]
y = [99,86,87,88,111,86,103,87,94,78,77,85,86]

slope, intercept, r, p, std_err = stats.linregress(x, y)

def myfunc(x):
  return slope * x + intercept #(y = mx + b) line equation

speed = myfunc(15)
print(speed) # => 76.8366445916..



#Example of a bad fit data
import matplotlib.pyplot as plt
from scipy import stats

x = [89,43,36,36,95,10,66,34,38,20,26,29,48,64,6,5,36,66,72,40]
y = [21,46,3,35,67,95,53,72,58,10,26,34,90,33,38,20,56,2,47,15]

slope, intercept, r, p, std_err = stats.linregress(x, y)

def myfunc(x):
  return slope * x + intercept

mymodel = list(map(myfunc, x))

plt.scatter(x, y)
plt.plot(x, mymodel)
plt.show()
print(r) # => 0.013.. meaning bad rlshp, meaning not suitable for linear regressi