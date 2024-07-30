#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read USERNAME

BIFS=$IFS
GET_USER_RESULT=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE name='$USERNAME'")
if [[ $GET_USER_RESULT ]]
then
  IFS="|"
  read USER_ID GAMES_PLAYED BEST_GAME <<< $GET_USER_RESULT

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  GET_USER_RESULT=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE name='$USERNAME'")
  IFS="|"
  read USER_ID GAMES_PLAYED BEST_GAME <<< $GET_USER_RESULT

  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

IFS=$BIFS
SECRET_NUMBER=$(($RANDOM % 1000 + 1))
GUESSES=0

echo "Guess the secret number between 1 and 1000:"
while true
do
  read GUESS
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    ((GUESSES++))
    if [[ $GUESS -eq $SECRET_NUMBER ]]
    then
      echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      ((GAMES_PLAYED++))
      if [[ $GUESSES -lt $BEST_GAME ]]
      then
        BEST_GAME=$GUESSES
      fi
      UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE user_id=$USER_ID");
      exit
    else
      if [[ $GUESS -lt $SECRET_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      else
        echo "It's lower than that, guess again:"
      fi
    fi
  else
    echo "That is not an integer, guess again:"
  fi
done
