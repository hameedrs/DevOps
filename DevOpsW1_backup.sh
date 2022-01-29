#! /bin/bash

FOLDERNAME=$1
COMP=$2
OUTPUTNAME=$3


ZIP=$"cvf"

ZIPOPTION=$ZIP$COMP


if [ -z "$COMP" ];
then
echo "Compression option is empty please use correct type and try it agian"
exit 1
fi

if [  $COMP != "j" ] && [  $COMP != "z" ];

then

echo "parameter is not right please choose j or z for compression ($COMP)" > error.log
exit 1

fi


tar $ZIPOPTION $OUTPUTNAME $FOLDERNAME  &> error.log

openssl aes-256-cbc -a -salt -pbkdf2 -in $OUTPUTNAME -out $OUTPUTNAME$".enc" &>> error.log