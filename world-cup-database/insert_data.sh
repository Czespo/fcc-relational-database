#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

maybe_insert_team () {
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$1'")
  if [[ -z $TEAM_ID ]]
  then
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$1')")
    echo Inserted into teams, $1
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$1'")
  fi
  return $TEAM_ID
}

echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # Insert teams into the database if not already there.
    maybe_insert_team "$WINNER"
    WINNER_ID=$?
    maybe_insert_team "$OPPONENT"
    OPPONENT_ID=$?

    # Insert game into database
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    echo Inserted into games, $WINNER - $OPPONENT $YEAR
  fi
done
