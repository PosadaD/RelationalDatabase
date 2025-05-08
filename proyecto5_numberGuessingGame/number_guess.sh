#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( ( RANDOM % 1000 )  + 1 ))
GUESSES=1

#echo $RANDOM_NUMBER

echo "Enter your username: "
read USERNAME

IS_A_NUMBER(){
  while [[ ! $NUMBER_GUESS =~ ^-?[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read NUMBER_GUESS
  done
}

PLAY_GAME(){
  echo "Guess the secret number between 1 and 1000:";
  read NUMBER_GUESS
  IS_A_NUMBER 
  
  while [[ $NUMBER_GUESS -ne $RANDOM_NUMBER ]]
  do
    if [[ $NUMBER_GUESS -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
    read NUMBER_GUESS
    IS_A_NUMBER 
    ((GUESSES++)) 
  done
  
  echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
}


USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  NEW_USER_INSERT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")

  echo "Welcome, $USERNAME! It looks like this is your first time here."

  PLAY_GAME
  
  NEW_USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  NEW_GAME_INSERT_FOR_NEW_USER=$($PSQL "INSERT INTO games(attemps, user_id) VALUES($GUESSES, $NEW_USER_ID)")
else 
  GAMES_PLAYED=$($PSQL "SELECT COUNT(attemps) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(attemps) FROM games WHERE user_id=$USER_ID")

  #echo $GAMES_PLAYED $BEST_GAME 

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

  PLAY_GAME

  NEW_GAME_INSERT=$($PSQL "INSERT INTO games(attemps, user_id) VALUES($GUESSES, $USER_ID)")
fi
