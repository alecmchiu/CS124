def prob(k,m,n):
	total = float(k+m+n)
	k_path = k/total
	m_path = (m/total)*(k/(total-1)) + 0.75*(m/total)*((m-1)/(total-1)) + 0.5*(m/total)*(n/(total-1))
	n_path = (n/total)*(k/(total-1)) + 0.5*(n/total)*(m/(total-1))
	return k_path+m_path+n_path

print prob(22,23,23)
