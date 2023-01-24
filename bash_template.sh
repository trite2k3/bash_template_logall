#!/bin/bash

#################################
# Constants / global variables
#################################
LOGFILE='bashtemplate.log'
LOGLEVEL='DEBUG'


#################################
#ALL THE LOGS!
#################################
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>$LOGFILE 2>&1

#################################
# Functions
#################################

# Logging functions
function log_output {
  echo `date "+%Y/%m/%d %H:%M:%S"`" $@"
  echo `date "+%Y/%m/%d %H:%M:%S"`" $@" >> $LOGFILE
}

function log_debug {
  if [[ "$LOGLEVEL" =~ ^(DEBUG)$ ]]
  then
    log_output "DEBUG $@"
  fi
}

function log_info {
  if [[ "$LOGLEVEL" =~ ^(DEBUG|INFO)$ ]]
    then
    log_output "INFO $@"
  fi
}

function log_warn {
  if [[ "$LOGLEVEL" =~ ^(DEBUG|INFO|WARN)$ ]]
  then
    log_output "WARN $@"
  fi
}

function log_error {
  if [[ "$LOGLEVEL" =~ ^(DEBUG|INFO|WARN|ERROR)$ ]]
  then
    log_output "ERROR $@"
  fi
}

# Some other helper functions
# ...

# Help output
function usage {
  echo
  echo "This is a Bash script template"
  echo "Usage: ./bash_template.sh -l <logfile> -L <loglevel>"
  echo "Example: ./bash_template.sh -l example.log -L INFO"
  echo
}

#################################
# Main
#################################

# Get input parameters
while [[ "$1" != "" ]]
do
  case $1 in
      -l | --logfile )        shift
                              LOGFILE=$1
                              ;;
      -L | --loglevel )       shift
                              LOGLEVEL=$1
                              ;;
      -h | --help )           usage
                              exit
                              ;;
      * )                     usage
                              exit 1
  esac
  shift
done

# Check input parameters and other required conditions

# Check if a param is set to a valid value
if [[ ! "$LOGLEVEL" =~ ^(DEBUG|INFO|WARN|ERROR)$ ]]
then
  log_error "Logging level needs to be DEBUG, INFO, WARN or ERROR."
  exit 1
fi

#Check if folder to do work exists
if [ -d "files_for_processing" ]
then
    log_debug "Directory files_for_processing exists. Continue."
else
    log_error "Directory files_for_processing does not exist. Please create it and check that it contains files for processing before running this script."
    exit 1
fi

#
# Bash script logic starts here...
#

for file in $(ls files_for_processing)
do
    log_debug "Found these file:" $file "processing..."
    log_debug "Trying to send files."
    scp -i /home/user/.ssh/id_rsa files_to_process/$file user@ip.local:/patch/to/folder
    exitcode=$?
    log_debug "Checking file transferred status."
    if [ $exitcode -ne 0 ]
    then
        log_error "Exitcode:" $exitcode "for file:" $file "see above loglines for stdout/stderr."
        exit 1
    else
        log_debug "Filetransfer for file:" $file "successfull."
    fi
done



