//: ----------------------------------------------------
//: ## NSURLSession and Parsing JSON
//: ----------------------------------------------------
import Foundation
import UIKit
import XCPlayground

// Step 0: Intro
//: - callout(Instructor:): Same exact data as before, but hosted on the web via myjson service! Again this can be referred to later as a pseudo-api. 
let catInstaEndpoint: NSURL = NSURL(string: "https://api.myjson.com/bins/254uw")! // again, be careful with force unwraps

/*: 
 For reference: [Objc.io](https://www.objc.io/issues/5-ios7/from-nsurlconnection-to-nsurlsession/)
 
 - callout(Instructor:): 
    1. Intro to NSURLSession: Every request begins with a session, which gets instatiated with a specified `NSURLSessionConfiguration`. For our purposes, we will only ever use `NSURLSessionConfiguration.defaultSessionConfiguration()`
    2. (optional) Why all the Optionals in our completion block? well, you might not get data back if the request is bad, you might not get a response if the internet is down (is this true? not sure when you wouldnt get a response,), and you might not get an error is everything goes right
    3.  Best practices says to check for errors first! 
    4.
 */

// 1. Intro
func makeInstaCatRequest() {
  
  // 1. NSURLSession/Configuration
  let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
  session.dataTaskWithURL(catInstaEndpoint) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
    // 2. (optional)
    
    // 3.
    if error != nil {
      print("Error encountered!: \(error!)")
    }
    
    // 4. we could print out the data here, but its not going to be of much use as encoded bits...
    if let validData: NSData = data {
      print(validData)
      
      // 5. Ok now we have data... presumably JSON. But how do we get it out now.... *sly wink*
      let allTheCats: [InstaCat]? = InstaCatFactory.createCatsFromData(validData)
      if allTheCats != nil {
        for cat in allTheCats! {
          print(cat.description)
        }
      }
    }
    }.resume() // 4. Easily forgotten, but we need to call resume to actually launch the task
  
}

// 1. setup
//XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//makeInstaCatRequest()
