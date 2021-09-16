# Manage docker image for Code Composer

## Compile
- docker run -it --mount type=bind,source=/mnt/<local>,target=/tmp/project ccs10
- **Inside container** `. ~/compile.sh` 

## Commands
- `docker run -it --mount type=bind,source=/mnt/d/tmp/test-ccs,target=/tmp/project ccs10`

- `eclipse -noSplash -data /workspace -application com.ti.ccstudio.apps.projectImport -ccs.help`

- `eclipse -noSplash -data /workspace -application com.ti.ccstudio.apps.projectImport -ccs.location /tmp/project`

- `eclipse -noSplash -data /workspace -application com.ti.ccstudio.apps.projectBuild -ccs.help`

- `eclipse -noSplash -data /workspace -application com.ti.ccstudio.apps.projectBuild -ccs.projects software_v6.x`

- `eclipse -noSplash -data /workspace com.ti.ccstudio.apps.inspect` 

- `eclipse -nosplash -data c:\workspace -application com.ti.ccstudio.apps.projectImport -ccs.location /tmp/project/software`

## Links
- https://software-dl.ti.com/ccs/esd/documents/ccs_projects-command-line.html