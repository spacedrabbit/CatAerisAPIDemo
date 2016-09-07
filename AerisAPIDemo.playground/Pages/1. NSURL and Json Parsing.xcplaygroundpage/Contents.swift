//: ----------------------------------------------------
//: ## Using NSURL and Parsing JSON
//: ----------------------------------------------------
import Foundation
import UIKit

// Step 0 - Introducing the data source
//: - callout(Instructor:): Take a moment to direct attention the the json file packaged with this playground page. Can be referred to later to illustrate JSON really is just a dictionary and thus a familiar iOS construct
let instaCats: NSURL = NSURL(fileReferenceLiteral: "InstaCats.json")


//: ----
// Step 1 - Getting raw data
/*:
 - callout(Instructor:): Intro concept of importing "json" from local file
 */
if let catData: NSData = NSData(contentsOfURL: instaCats) {
  if let validJSON = try? NSJSONSerialization.JSONObjectWithData(catData, options: []) {
    print(validJSON)
  }
}


//: ----
// Step 2 - Casting data
/*:
 - callout(Instructor:): Casting raw "json" into a dictionary. try no longer needs ? as it moves to the cast
 */
if let catData: NSData = NSData(contentsOfURL: instaCats) {
  if let validJSON = try NSJSONSerialization.JSONObjectWithData(catData, options: []) as? [String : AnyObject] {
    print(validJSON)
    //: - callout(Instructor:): Show results of casting to verify result
  }
}


//: ----
// Step 3 - Iterration & Printing
/*:
 - callout(Instructor:): Further casting using known keys
 */
if let catData: NSData = NSData(contentsOfURL: instaCats) {
  if let validJSON = try NSJSONSerialization.JSONObjectWithData(catData, options: []) as? [String : AnyObject] {
    
    if let catArray = validJSON["cats"] as? [AnyObject] {
      for cat in catArray {
        print(cat)
      }
    }
    
  }
}


//: ----
// Step 4 - Exploring optionals in dictionaries
/*:
 - callout(Instructor:): More casting with known keys (this is just demo purposes and this step prob can be skipped)
 */
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


//: ----
// Step 5 - Model
/*:
 - callout(Instructor:): Creating a model from our json data (can be used as a callback when later creating models from API responses.
 */
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


//: ----
// Step 6 - Casting and creating instances of InstaCat
/*:
 - callout(Instructor:): Creating instances of InstaCat model from our parsed json
 */
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
        
        //: - callout(Instructor:): Might be worth noting the dangerous of doing a forced unwrap like this and explain its being done because we control the data source so we know that this will always work. might not always be the case
        let castedInt: Int = Int(catID)!
        let newCat: InstaCat = InstaCat(name: catName, id: castedInt, instagramURL: instaURL)
        
        print(newCat.description)
      }
    }
  }
  
}
