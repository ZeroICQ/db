SET isql=C:\"Program Files"\Firebird\Firebird_3_0\isql.exe -u SYSDBA -p masterkey
SET sqlfolder=%~dp0\..\Sql\

del %~dp0\..\students.fdb

%isql% -i %sqlfolder%\students.sql
%isql% -i %sqlfolder%\groups.sql
%isql% -i %sqlfolder%\subjects.sql
%isql% -i %sqlfolder%\marks.sql
