import random


def gen_date():
    day = random.randint(1, 29)
    month = random.randint(1, 12)
    year = random.randint(1900, 2000)
    return '%d-%d-%d' % (year, month, day)

names = ['Nikita', 'Alexander', 'Dima', 'Nastya', 'Dasha']
surnames = ['Ivanov', 'Smirnov', 'Vasilev', 'Petrov', 'Kyznetsov']
fatherNames = ['Ivanovich', 'Alexeevich', 'Vasilich', 'Olegovich']

vals = []

id = 1;

for name in names:
    for surname in surnames:
        for fatherName in fatherNames:
            fio = '%s %s %s' % (surname, name, fatherName)
            sql = "INSERT INTO students VALUES ('" + str(id) +"', '" + fio +"', '"+gen_date()+"', '"+str(random.randint(1, 5))+"');"
            vals.append(sql)
            id+=1

with open('out.txt', 'w', encoding="ASCII") as f:
    f.write('\n'.join(vals))
