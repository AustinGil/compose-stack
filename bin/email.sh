#!/bin/bash

source bin/variables.sh

echo "📧 Please enter your email and press [ENTER]:"
read email

emailRegex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"

if [[ $email =~ $emailRegex ]] ; then
	EMAIL=$email
else
  echo "Invalid email."
	exec $0
fi

