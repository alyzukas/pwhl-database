Part D: Reflection (Short Write-Up)

1) What does one row of your cleaned dataset represent?

One row of our dataset represents a single shot with all associated contextual data. This shot is made by a shooting player on Team A against a goalie player on Team B within a given game for a given season. The shooting player's name, position, handedness, home town and area, birthdate, and jersey number are included. The game date and duration are also included. The shot would have details such as when within a game it was made, where from the arena it was made, and the type of quality of the shot. The shot may or may not be a successful goal. If so, there are details to be tracked on that goal type. A shot may possibly have a blocker from Team B if it failed. A shot may have 0, 1, or 2 assist players from Team A if it was a successful goal. 

2) Which cleaning or transformation steps mattered most?

Accounting for missing values in the case of binary goal statistics and acceptably null assist or blocking player names were very important. This made it possible to accurately convert datatypes to integer or string. We should also mention that reviewing the base query with a keen eye was important for catching incomplete joins which could have created multiple rows for a single shot.

3) How did your SQL query structure help or limit your pandas work?

Our query structure was very robust with many strategic joins which allowed for minimal rework within pandas itself to copy values across records or combine duplicates. Being very thoughtful with our original data storage of dates and times in datetime SQL columns made for converting those columns in pandas from Object to Datetime very smooth. This also allowed us to break out details like full number of hours a game lasted with ease.
