import Foundation
import UIKit

/*
 Given an array of distinct elements, rearrange the elements of array in zig-zag 
 fashion in O(n) time. The converted array should be in form a < b > c < d > e < f.

 
 Example:
 Input:  arr[] = {4, 3, 7, 8, 6, 2, 1}
 Output: arr[] = {3, 7, 4, 8, 2, 6, 1}
 
 Input:  arr[] =  {1, 4, 3, 2}
 Output: arr[] =  {1, 4, 2, 3}
*/

enum ZigPattern {
  case lessThan, greaterThan
  
  func returnPattern() -> (Int, Int) -> Bool {
    if self == .lessThan {
      return { (x: Int, y: Int) in
        if x > y { return false }
        return true
      }
    }
    else {
      return { (x: Int, y: Int) in
        if x > y { return true }
        return false
      }
    }
  }
  
  func returnOppositePattern() -> ZigPattern {
    switch self {
    case .lessThan: return .greaterThan
    case .greaterThan: return .lessThan
    }
  }
}

let input: [Int] = [1, 2, 3, 4, 5, 6, 7]

func zigzagPattern(input: [Int], index: Int, pattern: ZigPattern) -> [Int] {
  
  print("input count: \(input.count)")
  guard input.count >= 2 else {
    return input
  }
  
  let indexMax = input.index(input.startIndex.advanced(by: index), offsetBy: 1, limitedBy: input.count - 1)
  print(indexMax)
  guard let validIndex = indexMax else {
    return input
  }
  
  let firstElement = input[index]
  let secondElement = input[validIndex]
  
  print("indexMax: \(validIndex)")
  print("first element: \(firstElement)")
  print("second element: \(secondElement)")
  
  let sortedItems = [firstElement, secondElement].sorted(by: pattern.returnPattern())

  print("Sorted items: \(sortedItems)")
  var updatedInput = input
  let replacementRange = index...index + 1
  
  print("replacement range: \(replacementRange)")
  updatedInput.replaceSubrange(replacementRange, with: sortedItems)
  
  print("Updated input array: \(updatedInput)")
  return zigzagPattern(input: updatedInput, index: index + 1, pattern: pattern.returnOppositePattern())
}

let ziggedArray = zigzagPattern(input: input, index: 0, pattern: .greaterThan)
print(ziggedArray)