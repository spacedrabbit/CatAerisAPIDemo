//: [Previous](@previous)

import Foundation
import UIKit

var repeatedTestString: [String] = Array(repeating: "test", count: 10)

let arrayReference = repeatedTestString
let arrayOtherReference = repeatedTestString

// from SO: http://stackoverflow.com/questions/24058906/printing-a-variable-memory-address-in-swift
//for var item in repeatedTestString {
//  withUnsafePointer(to: &item) {
//    print("String: \(item): \($0)")
//  }
//}

/*
 If you have an address of a value, it's no longer immutable, because you can set raw memory at that address to mutate the value. There has been discussion about allowing this "anyway", with the penalty of UB if the memory is modified (even transiently), but introducing new kinds of UB is not exactly a high priority for Swift at present. For the vast majority of usecases, promoting to mutable is the right solution, unless you have much stronger guarantees than pointer usecases generally imply.
 */

var nonRepeatingTestStringArray: [String] = ["this", "is", "a", "test"]
//for var item in nonRepeatingTestStringArray {
//  withUnsafePointer(to: &item) {
//    print("String: \(item): \($0)")
//  }
//}

withUnsafePointer(to: &nonRepeatingTestStringArray) {
  print("Test array: \($0)")
}

withUnsafePointer(to: &nonRepeatingTestStringArray[3]) {
  print("Test array element 3: \($0)")
}

withUnsafePointer(to: &nonRepeatingTestStringArray[2]) {
  print("Test array element 2: \($0)")
}

withUnsafePointer(to: &nonRepeatingTestStringArray[1]) {
  print("Test array element 1: \($0)")
}

withUnsafePointer(to: &nonRepeatingTestStringArray[0]) {
  print("Test array element 0: \($0)")
}

withUnsafePointer(to: &repeatedTestString[1]) {
  print("Repeated element 1: \($0)")
}

withUnsafePointer(to: &repeatedTestString[0]) {
  print("Repeated element 0: \($0)")
}

nonRepeatingTestStringArray.insert("NEW ELEMENT", at: 2)
withUnsafePointer(to: &nonRepeatingTestStringArray) {
  print("Test array: \($0)")
}

withUnsafePointer(to: &nonRepeatingTestStringArray[0]) {
  print("Test array element 0: \($0)")
}

withUnsafePointer(to: &nonRepeatingTestStringArray[1]) {
  print("Test array element 1: \($0)")
}

withUnsafePointer(to: &nonRepeatingTestStringArray[2]) {
  print("Test array element 2: \($0)")
}

withUnsafePointer(to: &nonRepeatingTestStringArray[3]) {
  print("Test array element 3: \($0)")
}

withUnsafePointer(to: &nonRepeatingTestStringArray[4]) {
  print("Test array element 4: \($0)")
}
//: [Next](@next)
