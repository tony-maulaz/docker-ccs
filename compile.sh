#!/bin/bash

echo Import project

eclipse -noSplash \
        -data /workspace \
        -application com.ti.ccstudio.apps.projectImport \
        -ccs.location $("pwd") 2> /dev/null

if [ $? -eq 0 ]
then
  echo -e "\e[1;42m Successfully import project \e[1;0m"

  echo Compile project

  eclipse -noSplash \
          -data /workspace \
          -application com.ti.ccstudio.apps.projectBuild \
          -ccs.workspace \
          -ccs.listErrors \
          -ccs.listProblems 2> /dev/null

  if [ $? -eq 0 ]
  then
    echo -e "\e[1;42m Successfully compile \e[1;0m"
  else
    echo -e "\e[1;41m Could not compile \e[1;0m" >&2
  fi

else
  echo -e "\e[1;41m Could not import project \e[1;0m" >&2
fi

