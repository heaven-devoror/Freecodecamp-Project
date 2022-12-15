#/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_RESULT=$($PSQL "SELECT atomic_number, symbol, name, types, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties USING(atomic_number) WHERE atomic_number=$1")
  if [[ -z $ELEMENT_RESULT ]]
  then
    echo 'I could not find that element in the database.'
    exit
  fi
  echo "$ELEMENT_RESULT" | while read ATOMIC_NUM BAR SYM BAR NAME BAR TYPE BAR ATM_MASS BAR MPC BAR BPC
  do
  echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYM). It's a $TYPE, with a mass of $ATM_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
  done
elif [[ ${#1} -le 2 || $1 =~ [A-Za-z] ]]
then
  ELEMENT_RESULT=$($PSQL "SELECT atomic_number, symbol, name, types, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties USING(atomic_number) WHERE name='$1' OR symbol='$1'")
  if [[ -z $ELEMENT_RESULT ]]
  then
    echo 'I could not find that element in the database.'
    exit
  fi
  echo "$ELEMENT_RESULT" | while read ATOMIC_NUM BAR SYM BAR NAME BAR TYPE BAR ATM_MASS BAR MPC BAR BPC
  do
  echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYM). It's a $TYPE, with a mass of $ATM_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
  done
fi

REMOVE_NONEXISTENT=$($PSQL "DELETE FROM elements WHERE atomic_number=1000")
REMOVE_NONEXISTENT=$($PSQL "DELETE FROM properties WHERE atomic_number=1000")