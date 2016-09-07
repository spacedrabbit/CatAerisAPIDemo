import Foundation

public struct InstaCat {
  let name: String
  let catID: Int
  let instagramURL: String
  
  init(name: String, id: Int, instagramURL: String) {
    self.name = name
    self.catID = id
    self.instagramURL = instagramURL
  }
  
  public var description: String {
    return "Nice to me you, I'm \(self.name)"
  }
}

public class InstaCatFactory {
  
  public class func createCatsFromData(data: NSData) -> [InstaCat]? {
    var catsToReturn: [InstaCat] = []
    
    // one small change here, try! is explicit so as not to have to handle throwing or mark the function as throws
    if let validJSON = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String : AnyObject] {
      
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

          catsToReturn.append(newCat)
        }
      }
    } else {
      return nil
    }
    
    return catsToReturn
  }
  
}