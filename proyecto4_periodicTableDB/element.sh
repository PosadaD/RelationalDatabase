#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 ]]
  then
    if [[ $1 =~ ^-?[0-9]+$ ]]
    then 
      ELEMENT=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number=$1");
    else 
      TOUPPER="${1^}"
      ELEMENT=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE symbol='$TOUPPER' OR name='$TOUPPER'");
    fi

    if [[ -z $ELEMENT ]]
      then
        echo "I could not find that element in the database."
      else
        IFS='|' read ATOMIC_NUMBER SYMBOL NAME <<< "$ELEMENT"

        PROPERTY=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
        
        IFS='|' read ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID <<< "$PROPERTY"    

        TYPE=$($PSQL "SELECT type from types WHERE type_id=$TYPE_ID")

        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      fi    
  else
    echo "Please provide an element as an argument.";
  fi  
  
