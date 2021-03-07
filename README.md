# Databae
CS374 Database Management Final Project
-Finn McClone, Andi Brandsness, James Holtz, and Spencer Gariano

Description: 
This project is a  for Whitworth students. First wel gathered data from students using a google sheet questionnaire. 
Each person was asked 10 matchmaking questions as well as general information questions such as email and name. 
That data was put into a MySQL database as shown in the relations below. 
Our keys are ID, QuestionID, ResponseID, and PersonID, and each are foreign keys to each other table. 

Each question is assigned a number of points depending on how important the question is for finding a good couple.  
An algorithm keeps track of the total points between a pair and which questions they matched on.  
Then, the algorithm takes the top 3 matches for each individual and chooses three random questions that they matched with each person on and gets those response texts.  
The response text along with an email intro, the matches’ names and bios, and an email conclusion These emails are sent to their recipient and the project is finished! 
