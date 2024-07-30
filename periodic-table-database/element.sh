#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

SHOW_ELEMENT_INFO () {
  INFO=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$1")
  echo $INFO | while IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME MASS MELTING_POINT BOILING_POINT TYPE
  do
    echo "The element with atomic number $1 is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
}

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # Try find element with atomic number.
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
    if [[ $ATOMIC_NUMBER ]]
    then
      SHOW_ELEMENT_INFO $1
    else
      echo I could not find that element in the database.
    fi
  else
    # Find atomic number for symbol or name.
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")
    if [[ $ATOMIC_NUMBER ]]
    then
      SHOW_ELEMENT_INFO $ATOMIC_NUMBER
    else
      echo I could not find that element in the database.
    fi
  fi
fi
