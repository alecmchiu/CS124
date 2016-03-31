__author__ = 'Alec'

"""
Given: Two positive integers a and b, each less than 1000.

Return: The integer corresponding to the square of the
hypotenuse of the right triangle whose legs have lengths
a and b.

Example:

    Input:
        a = 3
        b = 5

    Output:
        34

"""

# Pythagorean theorem: a^2 + b^2 = c^2
# Find c^2

a = int(raw_input("First number? "))
b = int(raw_input("Second number? "))

print (a**2) + (b**2)