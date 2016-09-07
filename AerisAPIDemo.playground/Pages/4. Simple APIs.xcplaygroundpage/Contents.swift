//: ----------------------------------------------------
//: ## myJson and The Random User API
//: ----------------------------------------------------
/*:
 
 #### [myJson](http://myjson.com/)
- callout(Instructor:): Refer back to the NSURLSession example as being a quasi-API request. We requested the data at the URL and our response was that data as base64encoded(?) but then we parsed it out into a dictionary for use in our example.
 
 - callout(DEMO:): (optional) This might be a fun time to have the students write out their own simple json response to myJson and practice making requests to it via the NSURLSession playground or Postman.. just for overall familiarity/comfort with the concept and tool. Would be a good exercise in parsing json as well if we add the additional constraints of different data types in the custom json
 
 As you see, making test requests is a big part of software, and iOS, development. So much so that a fellow developer created the myJson site after he became annoyed that there were no simple ways of hosting json with the intention of testing network requests and json parsing. Making web requests, specifically to service APIs, and parsing the returned response is going to be a part of a vast majority of iOS apps. Think about all the apps you use that you can log in with Facebook! That's it's own API that needs integration in an iOS app.
 
 ---
*/

/*:
 #### The Random User API
 One of my favorite APIs to use for quick testing of creating user accounts is the [Random User API](https://randomuser.me/)
- callout(Instructor:): Side note, I found an easter egg in the source code of the site's documentation page and tweeted at the developer with my own take on it 😀 (it was a function named like konamiCode()). Could be a nice little anecdote on the development community culture in general. - Louis
 
  Many of the APIs discussed prior require some sort of authentication method, but fortunately the Random User API doesn't require it making it quite easy to hit the ground rounning with testing with it. 
 
 - callout(Interactive Example:):
    1. I think this would be a good API for the students to test out requests and parameters due to the single endpoint, limited parameters, and easy to understand/straightforward documentation.
      - Thoughts: We could do an entire practice lesson on API usage with this API... making the requests, model, etc.. Doing this before moving onto the more complicated Aeris API may serve to ease the learning curve invovled.
    2. Part of this interaction should include clicking on the RandomUser image URLs to further reinforce the universality of the the URL and the need for the developer to handle not only the "plain text" dictionary portion of the json responses, but also their content can vary considerably and will impact how their app should function.
 
 - callout(Instructor:):
    1. This may be an appropriate time to also introduce HTML status codes
    2. Additionally, mentioning GET/POST requests in concept. I don't think the RandomUser API has POST options
    3. Maybe even mentioning that JSON isn't the only possibly return format, the RU API allows for XML, CSV, YML
 ---
 */


/*:
  #### General API concepts
  - callout(Instructor:): 
  To be discussed:
  1. Rate limits
  2. Authentication (briefly)
    - id/secret as params
    - Basic w/ base64 encoded user/pass strings
    - (optional for now) Token in conjunction with OAuth2
    - (optional) Callback URL's for OAuth2
  3. Obtaining application keys
    - And how this can be unique for iOS apps due to bundle identifier requirements
  4. Request/Response Headers
    - also passing authentication in headers for APIs that allow/require it
 */

/*:
  - callout(Helpful Links:):
    - Simple JSON hosting: [myjson](http://myjson.com/)
    - Using Dropbox to host json: [Stack Overflow](http://stackoverflow.com/questions/18520456/ios-hosting-json-file-to-parse-it-using-url)
    - Verifying json format: [JSONlinter](http://jsonlint.com/)
 */
