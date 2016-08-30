# Database Dump

This project is designed to dump the database objects into the file system. The scripting engine required to run these scripts is SQLcl. SQLcl must be in your PATH

I suggest cloning the project onto your system somewhere and then creating a symbolic link to the script `dmdump.sh`. This can be done with:

```sql
sudo ln -s /opt/dmdump/dmdump.sh /usr/bin/dmdump
```

Then, to run the dumps, go to the directory where you want the source files located, and then run:

```bash
dmdump user pass server port sid
```

Sample file system layout would then look:

```
.
├── function
│   └── GET_NAMES.sql
├── index
│   ├── COUNTRY_C_ID_PK.sql
│   ├── DEPT_ID_PK.sql
│   ├── DEPT_LOCATION_IX.sql
│   ├── EMP_DEPARTMENT_IX.sql
│   ├── EMP_EMAIL_UK.sql
│   ├── EMP_EMP_ID_PK.sql
│   ├── EMP_JOB_IX.sql
│   ├── EMP_MANAGER_IX.sql
│   ├── EMP_NAME_IX.sql
│   ├── JHIST_DEPARTMENT_IX.sql
│   ├── JHIST_EMP_ID_ST_DATE_PK.sql
│   ├── JHIST_EMPLOYEE_IX.sql
│   ├── JHIST_JOB_IX.sql
│   ├── JOB_ID_PK.sql
│   ├── LOC_CITY_IX.sql
│   ├── LOC_COUNTRY_IX.sql
│   ├── LOC_ID_PK.sql
│   ├── LOC_STATE_PROVINCE_IX.sql
│   └── REG_ID_PK.sql
├── package
│   ├── FOO.pkb
│   └── FOO.pks
├── procedure
│   ├── ADD_JOB_HISTORY.sql
│   ├── NAMED_NOTATION_DEMO.sql
│   └── SECURE_DML.sql
├── sequence
│   ├── DEPARTMENTS_SEQ.sql
│   ├── EMPLOYEES_SEQ.sql
│   └── LOCATIONS_SEQ.sql
├── table
│   ├── COUNTRIES.sql
│   ├── DEPARTMENTS.sql
│   ├── EMPLOYEES.sql
│   ├── JOB_HISTORY.sql
│   ├── JOBS.sql
│   ├── LOCATIONS.sql
│   └── REGIONS.sql
├── trigger
│   ├── SECURE_EMPLOYEES.sql
│   └── UPDATE_JOB_HISTORY.sql
├── type
│   └── CL_VARCHAR2_TABLE.sql
└── view
    ├── EMP_DETAILS_VIEW.sql
    └── V_MY_VIEW.sql
```
