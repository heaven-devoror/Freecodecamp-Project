#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#Random number genretor
SECRET_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))

# Input username
echo "Enter your username:"
read USERNAME

PLAY_GAME(){
  NUMBER_OF_GUESS=1
  echo "Guess the secret number between 1 and 1000:"
  read GUESSED_NUMBER
  if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  fi
  while [[ $GUESSED_NUMBER != $SECRET_NUMBER ]]
  do
    if [[ $GUESSED_NUMBER -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $GUESSED_NUMBER -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi
    read GUESSED_NUMBER
    (( NUMBER_OF_GUESS++ ))
  done
  echo "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $SECRET_NUMBER. Nice job!"
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  if [[ -z $BEST_GAME ]]
  then
    BEST_GAME=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESS WHERE username='$USERNAME'")
  elif [[ $NUMBER_OF_GUESS -lt $BEST_GAME ]]
  then
    NEW_BEST_GAME=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESS WHERE username='$USERNAME'")
  fi
}

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME=$($PSQL "INSERT INTO users (username, games_played) VALUES('$USERNAME',1)")
  PLAY_GAME
else
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  PLAY_GAME
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=games_played + 1 WHERE username='$USERNAME'")
fi