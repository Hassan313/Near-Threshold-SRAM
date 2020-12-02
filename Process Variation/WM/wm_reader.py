fw = open("result.txt", "w")
fid = open("wm.ms0","r")
i = 0 
lines = fid.readlines()
for line in lines:
	i = i + 1
	if i > 5: 
#		print line
		wm = line.split(" ")[6]
		fw.write(wm + "\n")
		print wm
