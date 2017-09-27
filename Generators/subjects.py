import random


subjects = []
with open('in.txt', 'r') as f:
    for line in f:
        if line != '\n':
            subjects.append(line.strip())

sql = []
for idx, val in enumerate(subjects):
    sql.append('INSERT INTO subjects VALUES (%d, %s, %d);' % (idx + 1, "'" + val + "'", random.randint(1,5)));

with open('out1.txt', 'w') as f:
    f.write('\n'.join(sql))