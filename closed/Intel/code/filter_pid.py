import sys

file = sys.argv[1]
command = sys.argv[2]
f = open(file, "r")
lines = f.readlines()
for line in lines:
    if command in line:
        print(line.split()[1], end=' ')
print()
