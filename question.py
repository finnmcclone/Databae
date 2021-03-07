#CS374 Database Management Final Project 
# -Finn McClone, Andi Brandsness, James Holtz, and Spencer Gariano

# question is a class to hold:
# the points awarded if two people match
# a dictionary of responses and their corrosponding responseText
class Question:
    # this is a constructor to just make empty data points
    def __init__(self, ID, p):
        self.responseText = dict()
        self.ID = ID
        self.points = p

    # this will return the number of points for the question
    def getPoints(self):
        return self.points

    # this adds or adjusts the response of a match response
    def setResponse(self, r, t):
        self.responseText[r] = t

    # this will set the value of points earned
    def setPoints(self, p):
        self.points = p

    # this will return a specific question response
    def getResponseText(self, r):
        return self.responseText[r]