#CS374 Database Management Final Project 
# -Finn McClone, Andi Brandsness, James Holtz, and Spencer Gariano

#Person is a class to hold the people in the database
#This will hold their answers, totalScore with others, ID, first name, last name, email and bio
class Person:
    
    #constructor where arguments are filled upon object creation
    def __init__(self,answers,totalScore, ID, firstName, lastName, email, bio, referredBy):
        self.answers = answers
        self.totalScore = totalScore
        self.ID = ID 
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.bio = bio
        self.referredBy = referredBy
        self.topMatches = dict()


    #returns answers of designated person
    def getAnswers(self):
        return self.answers

    #returns total score of designated person
    def getTotalScore(self):
        return self.totalScore

    #returns ID of designated person
    def getID(self):
       return self.ID

    #returns email of designated person
    def getEmail(self):
        return self.email

    #returns bio of designated person
    def getBio(self):
        return self.bio

    #returns first and last name of designated person
    def getName(self):
        return self.firstName + ' ' + self.lastName

    #returns who the person was referred by
    def getReferredBy(self):
        return self.referredBy

    def setTotalScore(self, score):
        self.totalScore = score
    
    #dictionary with key =  peopleIDs of the top three matches, and value = points of that match
    def setTopMatches(self, MatchID, points):
        self.topMatches[MatchID] = points
    
