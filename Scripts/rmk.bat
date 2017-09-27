SET isql=C:\"Program Files"\Firebird\Firebird_2_5\bin\isql.exe -u SYSDBA -p masterkey

del ..\students.fdb

%isql% -i ..\Sql\students.sql
%isql% -i ..\Sql\groups.sql
%isql% -i ..\Sql\subjects.sql
%isql% -i ..\Sql\marks.sql