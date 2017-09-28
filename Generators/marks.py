import random


sql = []

for x in range(1000):
    sql.append('INSERT INTO marks VALUES (%d, %d, %d, %d);' % (x+1, random.randint(1, 100), random.randint(1, 58), random.randint(1,10)))

with open('marks.txt', 'w') as f:
    f.write('\n'.join(sql))