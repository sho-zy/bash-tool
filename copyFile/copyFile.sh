#!/bin/sh

echo "*** copyFile.sh start!"
####################################################
# READ SETTING
####################################################
cd  /usr/local/bash-tool/copyFile
. ./setting.ini

####################################################
# CHECK SETTING
####################################################
if [ ! -d $BASE_DIR ]; then
  echo "Setting file error: Not exist BASE_DIR"
  exit 1
fi
if [ ! -d "${BASE_DIR}/${MASTER_DIR}" ]; then
  echo "Setting file error: Not exist MASTER_DIR"
  exit 1
fi
if [ ! -f $TARGET_DIR_LIST ]; then
  echo "Setting file error: Not exist TARGET_DIR_LIST"
  exit 1
fi
if [ ! -f $TARGET_MODULE_LIST ]; then
  echo "Setting file error: Not exist TARGET_MODULE_LIST"
  exit 1
fi
while read line
do
  if [ -z "$line" ]; then
    continue
  fi
  if [ ! -d "${BASE_DIR}/${line}" ]; then
    echo "Setting file error: Not exist TARGET_DIR[${line}]"
    exit 1
  fi
done < $TARGET_DIR_LIST
while read line
do
  if [ -z $line ]; then
    continue
  fi
  if [ ! -f "${BASE_DIR}/${MASTER_DIR}/${line}" ]; then
    echo "Setting file error: Not exist TARGET_MODULE[${line}]"
    exit 1
  fi
done < $TARGET_MODULE_LIST

####################################################
# Create Dir & File
####################################################
while read tmpDir
do
  while read tmpModule
  do
    # DIR CHECK
    if [ `echo $tmpModule | grep '/'` ] && [ ! -d "${BASE_DIR}/${tmpDir}/${tmpModule%/*}" ]; then
      # CREATE DIR
      mkdir -p "${BASE_DIR}/${tmpDir}/${tmpModule%/*}"
      echo "Create dir: ${BASE_DIR}/${tmpDir}/${tmpModule%/*}"
    fi

    # COPY FILE
    cp -f "${BASE_DIR}/${MASTER_DIR}/${tmpModule}" "${BASE_DIR}/${tmpDir}/${tmpModule}"
    echo "Copy file: ${BASE_DIR}/${tmpDir}/${tmpModule}"
  done < $TARGET_MODULE_LIST
done < $TARGET_DIR_LIST

echo "*** copyFile.sh finished!"
