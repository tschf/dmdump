function writeLine(str){
    ctx.write(str);
    ctx.write('\n');
}

function runCmd(cmd){
    sqlcl.setStmt(cmd);
    sqlcl.run();
}

function makeDir(path){
    runCmd('host mkdir -p ' + path)
}

runCmd('set echo off \
set verify off \
set feedback off \
set heading off \
set trimspool on \
set termout off \
set pagesize 0');

var userObjects = util.executeReturnList("select object_name, object_type from user_objects", []);
var foldersCreated = {};

for (var objIdx = 0; objIdx < userObjects.length; objIdx++){
    var objectName = userObjects[objIdx].OBJECT_NAME;
    var objectType = userObjects[objIdx].OBJECT_TYPE;
    objectType = objectType.toLowerCase();

    var extension = '.sql';
    var destFolder = objectType;



    if (objectType === 'package body') {
        extension = '.pkb';
        destFolder = 'package';
    } else if (objectType === 'package'){
        extension = '.pks';
        destFolder = 'package';
    }

    if ( ! foldersCreated[destFolder]) {
        makeDir(destFolder);
        foldersCreated[destFolder] = true;
    }

    runCmd('spool ' + destFolder + '/' + objectName + extension);
    runCmd('ddl ' + objectName + ' ' + objectType);
    runCmd('spool off');
}
