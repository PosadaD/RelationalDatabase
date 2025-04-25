#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


LIMPIAR_DB=$($PSQL "TRUNCATE TABLE games, teams") 
if [[ $LIMPIAR_DB == "TRUNCATE TABLE" ]]
then 
  echo -e "\nTABLAS LIMPIAS\n"
fi

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_G OPPONENT_G
  do 
    if [[ $YEAR != "year" ]]
    then

      # revisar si ya existe el equipo 
      EQUIPO=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")

      EQUIPO2=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")

      if [[ -z $EQUIPO ]] 
      then 
          # insertar valores en teams table 
          NOMBRE_EQUIPO=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')" ) 
      fi

      if [[ -z $EQUIPO2 ]] 
      then 
        NOMBRE_EQUIPO2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      fi

      if [[ $NOMBRE_EQUIPO == "INSERT 0 1" || $NOMBRE_EQUIPO2 == "INSERT 0 1" ]]
      then 
        echo -e "Elemento agregado a tabla teams"
      fi

      #insertar valores en games table 

      # obtener los ids de los equipos
      WINNER_ID=$($PSQL "SELECT team_id FROM teams where name='$WINNER'")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams where name='$OPPONENT'")

      INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_G, $OPPONENT_G)")

      if [[ $INSERT_GAME == "INSERT 0 1" ]]
      then 
        echo "Elemento agregado a tabla games"
      fi
    fi 
  done
  