import UIKit

// HOL 1 - Basics of Swift

//Basic variables declaration and printing

var aNumber:Int //uppercase I for Integer!
aNumber = 5 // variable assignment

var firstNumber:Int
var secondNumber:Int
var answer:Int

firstNumber = 5
secondNumber = 14
answer = firstNumber + secondNumber

print("The answer is: \(answer)")

//var firstNumber:Int
//var secondNumber:Int
//var answer:Int   -- can't reassign var using the var statement

firstNumber = Int(arc4random_uniform(10))
secondNumber = Int(arc4random_uniform(10))
answer = firstNumber + secondNumber
print("The answer is: \(answer)")

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

// let languageName = "Swift"
// languageName = "Swift++"  -- let does not allow reassignment of variable

print(friendlyWelcome)

print("The current value of friendlyWelcom is \(friendlyWelcome)")

let cat = "🐱"
print(cat)

let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8

//Array Declaration

var arrayOfIntegers:[Int] = [1,2,3,4,5,6,7,8,9,10]
// print out all the numbers in the array
for(number) in arrayOfIntegers{
    print(number)
    
}

//Dictionaries (Key and Value)
let interestingNumbers = [
    "Prime":[2, 3, 5, 7, 11, 13],
    "Fiboncacci": [1, 1, 2, 3, 5, 8],
    "Square":[1, 4, 9, 16, 25],
]

for(kind, numbers) in interestingNumbers{
    print(kind, numbers)
}


//Structure
struct Resolution {
    var width = 1024
    var height = 768
}

//Class
class VideoMode{
    var resolution = Resolution()// struct type
    var interlaced = false
    var frameRate  = 0.0
    var name: String? //? Infers optional type
}


//Creating Instance
let aResolution = Resolution() // struct instance
let aVideoMode = VideoMode() // class instance
// accessing properties
print("The width of aResolution is \(aResolution.width)")

//Set Properties of a Class and Struct
//set the video mode resolution in the class struct
aVideoMode.resolution.width = 1280
print("The width of aVideoMode is now \(aVideoMode.resolution.width )")

//Type Alias
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

//Tuple
let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")// Prints "The status code is 404"
print("The status message is \(statusMessage)")


//Type Conversion
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)


//Nil
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}


//Handling Errors
func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
    } catch {
    // an error was thrown
}

//Assertion
//let age = -3
//assert(age >= 0, "A person's age can't be less than zero.")
// -3 causes assert to throw an errors


//Functions
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))


func greetAgain(person: String) -> String {
    let greeting = "Good to see you again, " + person + "!"
    return greeting
}

//Functions with Parameters
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }}
print(greet(person: "Tim", alreadyGreeted: true))
