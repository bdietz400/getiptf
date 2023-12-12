#!/QOpenSys/pkgs/bin/bash

displayUsageAndExit() {
	echo "Usage: get_from_FIX_Central.sh -u <userID> -p <password> -s <remote server> -d <remote directory> -l <local directory> "
	echo " "
    echo "Examples:"
	echo "  get_from_FIX_Central.sh -u BX1234 -p cAseSENsaTIve -s delivery01-bld.dhe.ibm.com -d PTFDIR123/C -l /path/to/PTF/dir"
	exit
}

if [ $# -lt 1 ] ; then
        displayUsageAndExit
fi 

while getopts u:p:s:d:l: flag
do
    case "${flag}" in
        u) s_user=${OPTARG};;
        p) u_pwd=${OPTARG};;
        s) rmt_srv=${OPTARG};;
        d) rmt_dir=${OPTARG};;
        l) lcl_dir=${OPTARG};;
    esac
done

# LOGNAME is from environment variables
log_file="$(/QOpenSys/pkgs/bin/mktemp ${lcl_dir}/$LOGNAME.XXXXXXXX.log)"

echo "-----------------"
echo "sFTP User Name  : ${s_user}"
echo "User Password   : ${u_pwd}"
echo "Remote Server   : ${rmt_srv}"
echo "Remote Directory: ${rmt_dir}"
echo "Local Directory : ${lcl_dir}"
echo "Log file        :" $log_file
echo "-----------------"

/QOpenSys/pkgs/bin/lftp -c "set sftp:auto-confirm on; set xfer:clobber on; \
set xfer:log-file $log_file; \
set sftp:connect-program \"ssh -a -x -o UserKnownHostsFile=/dev/null\"; \
open -u $s_user,$u_pwd \
sftp://$rmt_srv;lcd $lcl_dir;\
cd $rmt_dir;ls;mirror --verbose --use-pget-n=2 -c --verbose . $lcl_dir"  
ls -la $lcl_dir
echo "The log file is here -> " $log_file
