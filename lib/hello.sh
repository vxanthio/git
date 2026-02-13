#!/bin/bash

<<<<<<< HEAD
echo "What's your name"
read my_name

echo "Hello, $my_name"
=======
source lib/greeter.sh

name="$1"
if [ -z "$name" ]; then
    name="World"
fi

Greeter "$name"
>>>>>>> fe4308e (feat(greet): integrate greeter info hello.sh)
