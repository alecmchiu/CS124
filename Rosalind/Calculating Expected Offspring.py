input = open('rosalind_iev.txt','r')
child = [2*int(x) for x in input.readline().split()]
input.close()

expected = 0

for i in range(len(child)-1):
	if (i < 3):
		expected += child[i]
	elif i == 3:
		expected += child[i] * 0.75
	else:
		expected += child[i] * 0.5

print expected