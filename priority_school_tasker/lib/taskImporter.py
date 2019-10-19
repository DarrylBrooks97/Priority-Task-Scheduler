from canvasapi import Canvas

# Canvas API URL
API_URL = "https://famu-fsu-eng.instructure.com"
# Canvas API key
API_KEY = "12564~DnjktTW4xXJC6LPoU1S398ZaVZy4qJD9e2hVoes3tMjLks03JvrJZ91r1PkHMlBb"

# Initialize a new Canvas object
canvas = Canvas(API_URL, API_KEY)

courseNum = canvas.get_course(284)

print("Course Number: " + str(courseNum))


