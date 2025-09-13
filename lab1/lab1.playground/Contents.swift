//step 1
let firstName: String = "Ayaulym"
let lastName: String = "Raimbek"
let currentAge: Int = 19
let birthYear: Int = 2006
let isStudent: Bool = true
let height: Double = 1.74
let currentYear: Int = 2025
let myAge = "my current age is \(currentYear - birthYear)"
print(myAge)

//  step 2
var hobby: String = "watching kdramas, doing some DIYs, drawing"
var numOfHobbies = 3
var favNumber = 18
var isHobbyCreative = true

//bonus task
var 🇫🇷 = "Paris"
let goal = "In the future, I want to develop an application for my jewelry store💍"
let dream = "I want to celebrate my birthday in "


 
// step 3
var lifeStory = """
My name is \(firstName). I am \(currentAge) years old, born in \(birthYear). I am currently a \(isStudent ? "student":"not student"). I enjoy \(hobby), which is
a \(isHobbyCreative ? "creative":"not creative") hobby. I have \(numOfHobbies) hobbies in total, and my favorite number is \(favNumber). \n\(goal). \(dream) \(🇫🇷). 
"""

// step 4
print(lifeStory)
