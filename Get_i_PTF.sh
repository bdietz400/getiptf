#!/QOpenSys/pkgs/bin/bash

#  Bryan Dietz   06/23/2023
#  *** work in progress***
#  for now install in directory /ptfs
# make sure rpm pile is install plus "lftp"
# 
#  use the first email from IBM for the first 4 "parms"
#  and the last email wit hthe PWD for the given sftp user



echo "sFTP User Name: "
read s_user
echo "Remote Server: "
read rmt_srv
echo "Remote Directory: "
read rmt_dir
echo "Local Directory: "
read lcl_dir
echo "User Password: "
read u_pwd

echo "-----------------"
echo "sFTP User Name  : ${s_user}"
echo "Remote Server   : ${rmt_srv}"
echo "Remote Directory: ${rmt_dir}"
echo "Local Directory : ${lcl_dir}"
echo "User Password   : ${u_pwd}"
echo "-----------------"

/QOpenSys/pkgs/bin/lftp -c "set sftp:auto-confirm on; set xfer:clobber on; \
set xfer:log-file /ptfs/my_lftp.log; \
open -u $s_user,$u_pwd \
sftp://$rmt_srv;lcd $lcl_dir;\
cd $rmt_dir;ls;mirror --verbose --use-pget-n=2 -c --verbose . $lcl_dir"  
ls -la $lcl_dir
