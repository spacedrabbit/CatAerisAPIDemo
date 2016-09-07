//: [Previous](@previous)

import Foundation
import UIKit

let instaCats: NSURL = NSURL(fileReferenceLiteral: "InstaCats.json")


// Step 1 - Getting raw data
if let catData: NSData = NSData(contentsOfURL: instaCats) {
  if let validJSON = try? NSJSONSerialization.JSONObjectWithData(catData, options: []) {
    print(validJSON)
  }
}

// Step 2 - Casting data
if let catData: NSData = NSData(contentsOfURL: instaCats) {
  if let validJSON = try? NSJSONSerialization.JSONObjectWithData(catData, options: []) as? [String : AnyObject] {
    print(validJSON)
  }
}


// Step 3 - Iterration & Printing
if let catData: NSData = NSData(contentsOfURL: instaCats) {
  if let validJSON = try NSJSONSerialization.JSONObjectWithData(catData, options: []) as? [String : AnyObject] {
    
    if let catArray = validJSON["cats"] as? [AnyObject] {
      for cat in catArray {
        print(cat)
      }
    }
    
  }
}


// Step 4 - Exploring optionals in dictionaries
if let catData: NSData = NSData(contentsOfURL: instaCats) {
  if let validJSON = try NSJSONSerialization.JSONObjectWithData(catData, options: []) as? [String : AnyObject] {
    
    if let catArray = validJSON["cats"] as? [AnyObject] {
      for cat in catArray {
        print(cat["name"])
        print(cat["instagram"])
        print(cat["cat_id"])
      }
    }
    
  }
}

// Step 5 - Model
internal struct InstaCat {
  let name: String
  let catID: Int
  let instagramURL: String
  
  init(name: String, id: Int, instagramURL: String) {
    self.name = name
    self.catID = id
    self.instagramURL = instagramURL
  }
  
  var description: String {
    return "Nice to me you, I'm \(self.name)"
  }
}


// Step 6 - Casting and creating instances of InstaCat
if let catData: NSData = NSData(contentsOfURL: instaCats) {
  if let validJSON = try NSJSONSerialization.JSONObjectWithData(catData, options: []) as? [String : AnyObject] {
    
    if let catArray = validJSON["cats"] as? [AnyObject] {
      for cat in catArray {
        guard let catName: String = cat["name"] as? String,
          let catID: String = cat["cat_id"] as? String,
          let instaURL: String = cat["instagram"] as? String else {
            print("error")
            break
        }
        
        let castedInt: Int = Int(catID)! // overload! careful though, we know for sure this will evaluate correctly this time...
        let newCat: InstaCat = InstaCat(name: catName, id: castedInt, instagramURL: instaURL)
        
        print(newCat.description)
      }
    }
  }
  
}
