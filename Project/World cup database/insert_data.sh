#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games,teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != 'winner' ]]
    then
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      if [[ -z $TEAM_ID ]]
      then
        INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        if [[ $INSERT_WINNER == "INSERT 0 1" ]]
        then
          echo INSERTED VALUE, $WINNER
        fi
        TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      fi
  fi
  if [[ $OPPONENT != 'opponent' ]]
    then
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      if [[ -z $TEAM_ID ]]
      then
        INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
        then
          echo INSERTED VALUE, $OPPONENT
        fi
        TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      fi
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
    then
      WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      OPPO_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        INSERT_ALL_RECORD=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WIN_ID, $OPPO_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
        if [[ $INSERT_ALL_RECORD == "INSERT 0 1" ]]
        then
          echo Inserted into games, $WIN_ID VS $OPPO_ID
        fi
  fi 
done