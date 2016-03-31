__author__ = 'Alec'

"""
Given: A string s of length at most 200 letters and four integers a, b, c and d.

Return: The slice of this string from indices a through b and c through d (with space in between), inclusively.

Example:

    Sample Dataset:

        HumptyDumptysatonawallHumptyDumptyhadagreatfallAlltheKingshorsesandalltheKingsmenCouldntputHumptyDumptyinhisplaceagain.
        22 27 97 102

    Sample Output:

        Humpty Dumpty

"""

# retrieve string
s = raw_input("String? ")

# retrieve four indicies
a = int(raw_input("First index? "))
b = int(raw_input("Second index? "))
c = int(raw_input("Third index? "))
d = int(raw_input("Fourth index? "))

# create strings between indicies
string12 = s[a:b+1]
string34 = s[c:d+1]

# print concatenated strings
print string12 + " " + string34
