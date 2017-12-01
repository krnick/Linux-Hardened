# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "$PS1" ]; then
  if [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi



# User Login Log
NOW=`date +%Y%m%d:%H%M%S`
echo "[$NOW]: $REMOTEHOST : $USER .`pinky |awk '{print $6}'`" > /tmp/userlogin.log
mail -s "User Login  !!" sungboss2004@gmail.com < /tmp/userlogin.log
rm -f /tmp/userlogin.log






#rm backup to home dir .deleted-files
current_file="$(pwd)/useful_shell/newrm"
alias rm=$current_file
