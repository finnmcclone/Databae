#CS374 Database Management Final Project 
# -Finn McClone, Andi Brandsness, James Holtz, and Spencer Gariano

import sys
from question import Question
from person import Person
import smtplib
import random

import pymysql.cursors


#Funtion that connects to the database
# Use at the beginning of each function 
# with input ('Databae', 'your mysql root password')
def connect(database, root_password):
    connection = pymysql.connect(host='localhost',
                             user='root',
                             password=root_password,
                             db=database,
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
    return connection

# Input: QuestionID 
# Output: list of ResponseID and list of ResponseText from MatchResponse Table
def getQuestionResponse(questionID):
    connection = connect('Databae', 'brandsness')
    MRresponseID = []
    MRresponseText = []
    try:
        with connection.cursor() as cursor:
            sql = 'SELECT ResponseID, ResponseText '
            sql += 'FROM MatchResponse '
            sql += 'WHERE QuestionID = '
            sql += str(questionID)
            sql += ';'
            cursor.execute(sql)
            rows = cursor.fetchall()
            for row in rows:
                #use these lists to set response text and id of a question object
                MRresponseID.append(row['ResponseID'])
                MRresponseText.append(row['ResponseText'])
    finally:
        connection.close()
    return MRresponseID, MRresponseText

# Input: QuestionID. 
# Output: points of that question from Questions Table
def getQuestionPoints(questionID):
    connection = connect('Databae', 'brandsness')
    try:
        with connection.cursor() as cursor:
            sql = 'SELECT points FROM Questions WHERE ID = '
            sql += str(questionID)
            sql += ';'
            cursor.execute(sql)
            rows = cursor.fetchall()
            for row in rows:
                Qpoints = row['points']
    finally:
        connection.close()
    return Qpoints

# Output: returns a list of personIDs
def GetPersonIDList():
    connection = connect('Databae', 'brandsness')
    IDs = []
    try:
        with connection.cursor() as cursor:
            sql = 'SELECT ID FROM PersonInfo;'
            cursor.execute(sql)
            rows = cursor.fetchall()
            for row in rows:
                IDs.append(row['ID'])
    finally:
        connection.close()
    return IDs

# Output: returns a list of QuestionIDs
def GetQuestionIDList():
    connection = connect('Databae', 'brandsness')
    IDs = []
    try:
        with connection.cursor() as cursor:
            sql = 'SELECT ID FROM Questions;'
            cursor.execute(sql)
            rows = cursor.fetchall()
            for row in rows:
                IDs.append(row['ID'])
    finally:
        connection.close()
    return IDs

# Input: PersonID
# Output: Everything from PersonID about that person
def GetPersonInfo(personID):
    connection = connect('Databae', 'brandsness')
    try:
        with connection.cursor() as cursor:
            sql = 'SELECT ID, FirstName, LastName, email, bio, ReferredBy FROM PersonInfo '
            sql += 'WHERE ID = '
            sql += str(personID)
            sql += ';'
            cursor.execute(sql)
            rows = cursor.fetchall()
            for row in rows:
                    FName = row['FirstName']
                    LName = row['LastName']
                    email = row['email']
                    bio = row['bio']
                    referredBy = row['ReferredBy']
    finally:
        connection.close()
    return FName, LName, email, bio, referredBy

def GetPersonAnswer(personID):
    QuestionID = []
    Answers = []
    connection = connect('Databae', 'brandsness')
    try:
        with connection.cursor() as cursor:
            sql = 'SELECT QuestionID, Answer '
            sql += 'FROM PersonAnswers '
            sql += 'WHERE PersonID = '
            sql += str(personID)
            sql += ';'
            cursor.execute(sql)
            rows = cursor.fetchall()
            for row in rows:
                    QuestionID.append(row['QuestionID'])
                    Answers.append(row['Answer'])
    finally:
        connection.close()
    return QuestionID, Answers


# Output: a dict of questions containing their ID, points, and dict of responseTexts
def MakeQuestionObjects():
    QIDs = GetQuestionIDList() #list of Question IDs
    questions = {} #holds question objects, key is QuestionID and value is that question object
    
    # Uses constructor to make a question with a number of points
    for i in QIDs:
        questions[i] = ( Question( i, getQuestionPoints(i) ) )

    # Put response texts in each question object
    for i in QIDs:
        resp_id, resp = getQuestionResponse(i) #get info from database
        for k in range(len(resp)):
            questions[i].setResponse( resp_id[k], resp[k] )
    
    return QIDs, questions
        
# Output: a dict of people containing their first and last names, email, bio, and referred by
# --- person.totalScore is set to 0
def MakePeopleObjects():
    PIDs = GetPersonIDList() #list of people IDs
    people = {} #holds person objects, key is personID, value is that person object
    
    for i in PIDs:
        answers = {}
        # make dict of people's answers
        QuestionID, A = GetPersonAnswer(i)
        for k in range(len(QuestionID)):
            answers[QuestionID[k]] = A[k]
        FName, LName, email, bio, referredBy = GetPersonInfo(i)
        people[i] = ( Person(answers, 0, i, FName, LName, email, bio, referredBy) )

    return PIDs, people

# Send Email Functions 
#https://www.pythonforbeginners.com/code-snippets-source-code/using-python-to-send-email/
def sendEmail(email, full_text):

    header = 'Subject: ' + ' Databae Questionnaire Matchmaking Results'
    message = header + '\n\n' + full_text
 
    server = smtplib.SMTP('smtp.gmail.com',587) # It might be ('smtp.gmail.com:587') or ('...',587)
    server.starttls()
    server.login('databae374@gmail.com','asciiart')
    server.sendmail('Databae', email, message)
    server.quit()

# Output: a two dimensional matrix, matches, where 
# matches[0][1] is the number of points personID = 1 and personID = 2 have between themselves
def CalculateMatchPoints():
    # initialized to -1s so that we know when a pair has been analized even if they get 0 points
    matches = [[-1 for i in range(len(PIDs))] for j in range(len(PIDs))]
    questions_matched = {}
    for p1 in PIDs: #person1
        for p2 in PIDs: #person2
            if matches[p1-1][p2-1] == -1 and p1 != p2: #then the pair has not been analyzed yet and p1 and p2 are different people
                points = 0
                questions_matched[p1, p2] = [] # to store the questions matched on by p1 and p2
                questions_matched[p2, p1] = []
                for q in QIDs:
                    #start with person1,
                    if people[p1].answers[q] == people[p2].answers[q]: #if they answered the same for question with ID = q
                        points += questions[q].points #add the number of points that match is worth
                        questions_matched[p1, p2].append(q) #store q in dictionary
                        questions_matched[p2, p1].append(q)
                #put points in some kind of 
                matches[p1-1][p2-1] = matches[p2-1][p1-1] = points
    return matches, questions_matched

# Input: 2d list of match points, the desired number of top matches to be found, 
# Output: Sets topMatches dictionary in person's class
def findTopMatches(matches, numTopMatches, personID):
    highest_points = [0]*numTopMatches #holds the three highest points so far found
    IDs = [-1]*numTopMatches #holds the ids of the current three highest points
    this_match = matches[personID - 1]
    for i in range(len(this_match)): #look through list of person's matches
        #this should keep the points in order of highest at index 0 and lowest at index numTopMatches-1
        for j in range(numTopMatches):
            if this_match[i] > highest_points[j]: 
                #push the values down to make room for the new match:
                for k in range(numTopMatches - j):
                    highest_points[numTopMatches - 1 - k] = highest_points[numTopMatches - 2 - k]
                    IDs[numTopMatches - 1 - k] = IDs[numTopMatches - 2 - k]
                highest_points[j] = this_match[i] #set new match
                IDs[j] = i+1 #set corresponding ID
                break #move on so we don't repeat the same value
    # set topMatches dictionary in personID's class
    for i in range(numTopMatches):
        people[personID].setTopMatches( IDs[i], highest_points[i] )

# Input: personID of the person whose email we want to generate
# Output: the email of the person who the text is being sent to, and
#         the text that will go in the email
def generateEmail(personID):
    email_text = ''
    email = people[personID].getEmail()
    #for each person in the top matches:
    for p2 in people[personID].topMatches:
        name = people[p2].getName() 
        bio = people[p2].getBio()

        # pick three random questions that they matched on, make sure they're different
        chosen_qs_indices = [] #holds the indices of those random questions
        rand_qID = random.randrange(0,len(questions_matched[personID,p2]))
        while len(chosen_qs_indices) < 3:
            if rand_qID not in chosen_qs_indices:
                chosen_qs_indices.append(rand_qID)
            rand_qID = random.randrange(0,len(questions_matched[personID,p2]))
        questionIDs = [] #holds the ids of the random questions
        for i in range(3):
            questionIDs.append(questions_matched[personID,p2][chosen_qs_indices[i]]) #make list of those question's IDs
        
        #get responseText for those question ids
        match_responses = []
        for i in range(len(questionIDs)):
            match_responses.append(questions[questionIDs[i]].responseText[people[personID].answers[questionIDs[i]]])

        #see if they were one of the pairs that match on ALL questions! Wow
        perfect_match_text = ''
        if len(questions_matched[personID,p2]) == 10:
            perfect_match_text = 'Wowie Zowie!! You and ' + people[p2].getName() + ' answered every question the same! You two are a match made in heaven! <3\n'

        email_text += name + ': ' + bio + '\n'
        email_text += perfect_match_text
        email_text += match_responses[0] + '\n' + match_responses[1] + '\n' + match_responses[2] + '\n\n'
        
    email_text_intro = "Hi " + people[personID].firstName + ',' + "\n\n"
    email_text_intro += 'Your results are in!! Your top three matches from ' + people[personID].referredBy + "'s Database final project have been calculated!\n\n"
    email_text_intro += 'Below are your three matches, their bio, so that you can get to know them a little bit, as well as three questions that you answered in common.\n\n'
    conclusion = "Thank you for participating in our matchmaking service!  Please don't feel obligated to reach out to any of your matches. The intention for this project was to make something fun, not actually to help you find love. (We're sorry)."
    conclusion += '\n\nWith Love, \nDatabae Squad'

    full_text = email_text_intro + email_text + conclusion
    return email, full_text
        


# PIDs is a list of all people IDs in order, used to loop though people dictionary
# people is a dictionary where key = PersonID and value = that person's object
PIDs, people = MakePeopleObjects()

# QIDs is a list of all question IDs in order, used to loop though question dictionary
# quesions is a dictionary where key = QuestionID and value = that questions's object
QIDs, questions = MakeQuestionObjects()

# matches: a 2D list of points between a pair of people
# questions_matched: a dictionary where the key is a tuple, (personID_1, personID_2) and 
#       the value is a list of questionIDs that those two people matched on
#       e.g. : questions_matched[1,2] is the list containing matched question IDs of the people with IDs 1 and 2
matches, questions_matched = CalculateMatchPoints()

#for i in PIDs: 
#    findTopMatches(matches, 3, i) # find the top 3 matches of personID = i
#    email, full_text = generateEmail(i) # store the email adress we want to send to in email, and the message to put in tht email in full_text
#    sendEmail(email, full_text)
#print('done')


