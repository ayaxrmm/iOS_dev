//
//  main.swift
//  lab2
//
//  Created by Aya on 25.09.2025.
//

import Foundation
// problem 1
//for index in 1...100{
//    if index % 3 == 0 && index % 5 == 0{
//        print("FizzBuzz")
//    }else if index % 5 == 0 {
//        print("Buzz")
//    }else if index % 3 == 0 {
//        print("Fizz")
//    }else{
//        print(index)
//    }
//}
//// problem 2
//func isPrime(_ number: Int) -> Bool{
//    if number <= 1{
//        return false
//    }
//    for i in 2..<number{
//        if number % i == 0{
//            return false
//        }
//    }
//    return true
//}
//
//for index in 1...100{
//    if isPrime(index){
//        print(index)
//    }
//}

// problem 3
//func CtoF(_ c: Double) -> Double{
//    return c * 9/5 + 32
//}
//func CtoK(_ c: Double) -> Double{
//    return c + 273.15
//}
//func FtoC(_ f: Double) -> Double{
//    return (f - 32) * 5/9
//}
//func FtoK(_ f: Double) -> Double{
//    return (f - 32) * 5/9 + 273.15
//}
//func KtoF(_ k: Double) -> Double{
//    return (k - 273.15) * 9/5 + 32
//}
//func KtoC(_ k: Double) -> Double{
//    return k - 273.15
//}
//
//print("enter the temperture: ")
//if let inputTemp = readLine(), let temp = Double(inputTemp){
//    print("enter C or F or K: ")
//    if let unit = readLine(){
//        switch unit.uppercased(){
//        case "C":
//            print("\(temp)C = \(CtoF(temp))F")
//            print("\(temp)C = \(CtoK(temp))K")
//        case "F":
//            print("\(temp)F = \(FtoC(temp))C")
//            print("\(temp)F = \(FtoK(temp))K")
//        case "K":
//            print("\(temp)K = \(FtoC(temp))F")
//            print("\(temp)K = \(FtoC(temp))C")
//        default:
//            print("error! enter the C, F or K")
//        }
//    }
//}else{
//    print("error! enter the temperature: ")
//}
//
//problem 4
//var shopping_List: [String] = []
//func show_Menu(){
//    print("""
//        1. add
//        2. remove
//        3. show list
//        4. exit
//        """)
//}
//func printShoppingList(){
//    if shopping_List.isEmpty{
//        print("list is empty")
//    }else{
//        print("shopping list: ")
//        for item in shopping_List{
//            print("\(item)")
//        }
//    }
//}
//
//var isRunning = true
//
//while isRunning {
//    show_Menu()
//    print("choose from 1 to 4:")
//    if let choice = readLine(){
//        switch choice {
//        case "1":
//            print("enter the name of item:")
//            if let item = readLine(){
//                shopping_List.append(item)
//                print("successfully added")
//            }else{
//                print("not found such item")
//            }
//        case "2":
//            printShoppingList()
//            if !shopping_List.isEmpty{
//                print("enter the number of item:")
//                if let num = readLine(), let index = Int(num){
//                    shopping_List.remove(at: index - 1)
//                    print("successfully removed")
//                }else{
//                    print("not found")
//                }
//            }
//        case "3":
//            printShoppingList()
//        case "4":
//            isRunning = false
//        default:
//            print("error! choose from 1 to 4")
//        }
//    }
//}

//problem 5
//func Word(_ word: String) -> String{
//    return word
//        .lowercased()
//        .trimmingCharacters(in: .punctuationCharacters)
//}
//print("Enter your sentence:")
//if let sentence = readLine(){
//    let words = sentence.split(separator: " ").map{Word(String($0))}
//    var frequency: [String:Int] = [:]
//    for word in words where !word.isEmpty{
//        frequency[word, default: 0] += 1
//    }
//    print("frequency of words:")
//    for(word, count) in frequency {
//        print("\(word): \(count)")
//    }
//}

//problem 6
//func fibonacci(_ n: Int) -> [Int] {
//    if n <= 0{
//        return []
//    }
//    if n == 1{
//        return [1]
//    }
//    var sequence = [0,1]
//    for i in 2..<n{
//        let num = sequence[i-1] + sequence[i-2]
//        sequence.append(num)
//    }
//    return sequence
//}
//print("Enter n:")
//if let input = readLine(), let n = Int(input){
//    let result = fibonacci(n)
//    print(result)
//}

//problem 7
//var student_list: [String : Double] = [:]
//func add_student(){
//    print("Enter name:")
//    if let name = readLine(){
//        print("Enter csore:")
//        if let score = readLine(), let score_num  = Double(score){
//            student_list[name] = score_num
//        }
//    }else{
//        print("invilid input")
//    }
//}
//
//print ("enter the number of students:")
//if let input = readLine(), var n = Int(input){
//    while n > 0{
//        add_student()
//        n -= 1
//    }
//}
//
//
//func av_score() -> Double{
//    var total: Double = 0
//    for score in student_list.values{
//        total += score
//    }
//    return total / Double(student_list.count)
//}
//
//func highest_score() -> Double{
//    var max = -1.0
//    for score in student_list.values{
//        if score > max{
//            max = score
//        }
//    }
//    return max
//}
//
//func lowest_score() -> Double{
//    var min = 100.0
//    for score in student_list.values{
//        if score < min{
//            min = score
//        }
//    }
//    return min
//}
//
//func display_list(){
//    for (name, score) in student_list{
//        if score < av_score(){
//            print("\(name): \(score) : below than average score")
//        }else if score > av_score(){
//            print("\(name): \(score) : above than average score")
//        }else{
//            print("\(name): \(score) : average score")
//        }
//    }
//}
//
//print("average score: \(av_score())")
//print("highest score: \(highest_score())")
//print("lowest score: \(lowest_score())")
//display_list()
//


//problem 8
//print("enter a text:")
//func isPalindrome(_ text: String) -> Bool{
//    let cleaned = text.lowercased().filter(\.isLetter)
//    let reversed = String(cleaned.reversed())
//    return cleaned == reversed
//}
//if let text = readLine(){
//    if isPalindrome(text){
//        print("\(text) is a palindrome")
//    }else{
//        print("\(text) is not a palindrome")
//    }
//}

//problem 9
//func show_menu(){
//    print("""
//        1. addition (+)
//        2. subtruction (-)
//        3. multiplication (*)
//        4. division(/)
//        5. exit
//        """)
//}
//func addition(_ a: Int, _ b: Int) -> Int{
//    return a + b
//}
//func subtuction(_ a: Int, _ b: Int) -> Int{
//    return a - b
//}
//func multiplication(_ a: Int, _ b: Int) -> Int{
//    return a * b
//}
//func division(_ a: Int, _ b: Int) -> String{
//    if b == 0 {
//        return "Error: division by zero"
//    } else {
//        return "\(a / b)"
//    }
//}
//
//var isRunning = true
//
//print("enter two numbers:")
//if let firstNumber = readLine(), let secondNumber = readLine(), let a = Int(firstNumber), let b = Int(secondNumber){
//    while isRunning{
//        print("choose from 1 to 5:")
//        show_menu()
//        if let choice = readLine(){
//            switch choice{
//            case "1": print("\(addition(a, b))")
//            case "2": print("\(subtuction(a, b))")
//            case "3": print("\(multiplication(a, b))")
//            case "4": print("\(division(a, b))")
//            case "5": isRunning = false
//            default: print("Error! choose from 1 to 5")
//            }
//        }
//    }
//}

//problem 10
print("enter a text:")
func hasUniqueCharacters(_ text:String) -> Bool{
    var seen: Set<Character> = []
    for char in text{
        if seen.contains(char){
            return false
        }
        seen.insert(char)
    }
    return true
}
if let text = readLine(){
    print(hasUniqueCharacters(text))
}

