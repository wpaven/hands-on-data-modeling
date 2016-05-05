REM Use this to deploy source code to the modules database.
REM  
REM Usage:
REM   deploy-transform.bat <filename to deploy> <name of transform>

REM Update if required
SET USERNAME="dr-who"
SET PASSWORD="doctor"

SET ARG1=%1
SET ARG2=%2

REM If deploying an JavaScript extension, change the Content-type to
REM application/vnd.marklogic-javascript

echo "Deploying" %ARG1% as %ARG2%
curl --anyauth --user %USERNAME%:%PASSWORD% -X PUT --data-binary @%ARG1% -v -i -H "Content-Type:application/vnd.marklogic-javascript" "http://localhost:8080/v1/config/transforms/%ARG2%"

