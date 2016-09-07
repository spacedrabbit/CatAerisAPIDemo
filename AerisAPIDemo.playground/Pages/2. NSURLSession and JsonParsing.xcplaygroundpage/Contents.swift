//: ----------------------------------------------------
//: ## NSURLSession and Parsing JSON
//: ----------------------------------------------------
import Foundation
import UIKit
import XCPlayground

/*: 
 -----
 - callout(LESSON OBJECTIVE):
    This particular example is meant to be written mostly line-by-line to take students through each step of the network request -> receiving response -> parsing -> formatting and displaying data
    Students should understand: 
    - NSURL truly is "universal" as it can refer to a file on your local machine, or a web URL
    - Handling json data from web requests is exactly like dealing with a local dictionary/json
    - (Optional) Reusuability of code makes building something up to the point much easier as we can reuse the same parsing function from the prior lesson here. 
 
 ----
 */

// Step 0: Intro
//: - callout(Instructor:): Same exact data as before, but hosted on the web via myjson service! Again this can be referred to later as a pseudo-api. Perhaps note that a URL can refer to a local file or a web page if not already discussed. Effectively, I want to keep the logical leap from local to remote requests by recreating the first example with a web version
//: Additionally, you can direct students to the site to verify the contents of the json (it is read-only)
//: [Link](https://api.myjson.com/bins/254uw)
let catInstaEndpoint: NSURL = NSURL(string: "https://api.myjson.com/bins/254uw")! // again, be careful with force unwraps

/*: 
 For reference: [Objc.io](https://www.objc.io/issues/5-ios7/from-nsurlconnection-to-nsurlsession/)
 
 - callout(Instructor:): 
    1. Intro to NSURLSession: Every request begins with a session, which gets instatiated with a specified `NSURLSessionConfiguration`. For our purposes, we will only ever use `NSURLSessionConfiguration.defaultSessionConfiguration()`
    2. (optional) Why all the Optionals in our completion block? well, you might not get data back if the request is 
        bad, you might not get a response if the internet is down, and you might not get an error is everything goes 
        right. *This can be used as a callback when when API response json keys are explained*
    3.  We use the `dataTaskWithURL` method of `NSURLSession` to initiate our request
    4.  Best practices says to check for errors first
    5.  (optional) For some verification, we could print out the data here, but its not going to be of much use as encoded bits
    6.  Ok now we have data, presumably JSON. But how do we get it out now.... *sly wink*
    7.  Shift over to /Sources to check out the class made, indicate it's *nearly* identical to prior method built. So it's important to know that it accepts NSData and tries to convert it into readable JSON, and from that, `[InstaCat]`
    8.  Using our previous parsing, we're able to translate that same code here to parse json for a network request. Maybe a good time to bring up re-useability of code?
 
    Other: The .resume() caveat can be brought up whenever, but its likely better to do so after step 6 to debug why nothing is being printed out.
 */

func makeInstaCatRequest() {
  
  // 1. NSURLSession/Configuration
  let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
  
  // 2. (optional)
  // 3. dataTaskWithURL
  session.dataTaskWithURL(catInstaEndpoint) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
    
    // 4. Error Check
    if error != nil {
      print("Error encountered!: \(error!)")
    }
    
    // 5. (optional)
    // 6. Print the data
    if let validData: NSData = data {
      print(validData)
      
      // 7. New class made from previous lesson
      let allTheCats: [InstaCat]? = InstaCatFactory.createCatsFromData(validData)
      
      //: - callout(lecture note): it doesn't matter how we do the nil check here, whatever is best for class
      if allTheCats != nil {
        for cat in allTheCats! {
          print(cat.description)
        }
      }
    }
    }.resume() // Other: Easily forgotten, but we need to call resume to actually launch the task
}

//: - callout(Instructor:): Explain why .needsIndefiniteExecution is needed (ensuring that the playgrounds executes properly for network requests so that the request isn't stopped the moment after its code is executed)
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
makeInstaCatRequest()

/*: 
 - callout(POST LESSON:): Might be worth calling out that .dataTaskWithURL represents our request to an API and that the closure is the response we get back in JSON format.
    - Maybe also bring up the jsonlinting service to absolutely make sure your JSON is formatted properly. Good example of "garbage data in -> garbage data out"
*/
//: ----