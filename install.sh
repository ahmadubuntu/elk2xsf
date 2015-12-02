#! /bin/bash

if test -d ~/.xcrysden
then
	echo ""
else
	mkdir ~/.xcrysden
fi


cat >> ~/.xcrysden/custom-definitions <<EOF
#------------------added by elk2xsf
addOption --elkin ${PWD}/shelk2xsf.sh {
  load structure from elk code elk.in file format
}					
EOF

cat > shelk2xsf.sh << EOF
#! /bin/bash
${PWD}/elk2xsf \$1
EOF

chmod +x shelk2xsf.sh
chmod +x elk2xsf


echo "Now you can visualize elk.in via xcrysden using the following command:"
echo "xcrysden --elkin elk.in"
