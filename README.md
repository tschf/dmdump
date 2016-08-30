# Database Dump

This project is designed to use [SQLcl](http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html) to dump the database objects for the connected SCHEMA to the filesystem.

dmdump requires the [SQLcl](http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html) bin directory to be in your `PATH`.

### Prerequisites
- Download and unzip [SQLcl](http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html).
- Add the SQLcl bin directory to your `PATH`.

### Install
- Clone or download dmdump onto your system.

#### Unix
- Create a symbolic link to the script `dmdump.sh`:
```bash
sudo ln -s /opt/dmdump/dmdump.sh /usr/bin/dmdump
```

#### Windows
- Add dmdump to your PATH:
```bat
SET PATH=%PATH%;C:\dmdump\
```

### Usage
- Navigate to the desired output directory.
- Run dmdump as follows:
```bash
dmdump {connect_string}
```

### Arguments
|Name  | Description             | Example |
|---            |---                      | ---     |
| connect_string | The connect string to connect to a database using `sqlcl` on the command line. <br>**Note:** A password is *required* at this stage. | - hr/hr@//server:port/service_name  <br />- hr/hr@//server:port:sid  <br />- hr/hr@XE1 |

### Sample Output
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
