//
//  NetworkController.swift
//  YelpAPI
//
//  Created by Nicolas Garaycochea on 11/30/22.
//

import Foundation

/*
 This is our goal, to get to a URL just like this one:
 https://api.yelp.com/v3/businesses/search?term=pizza&location=1550 Digital Dr %23400, Lehi, UT 84043&limit=10
 */

class YelpController {
    //This is our singleton/shared instance. This allows us to access properties on this file, from other files easily.
    static let shared = YelpController()
    
    /*
     At this point our URL is this: "https://api.yelp.com/v3"
     */
    var baseURL = URL(string: Constants.baseURL)
    
    ///This function makes a network call to the Yelp API
    func fetchBusiness(searchTerm: String, completion: @escaping (Result<YelpInfo, YelpError>) -> Void){
        // 1 - URL
        
        guard var unwrappedURL = baseURL else { return completion(.failure(.invalidURL)) } //"https://api.yelp.com/v3"
        unwrappedURL.append(path: Constants.buissnessComponent)//"https://api.yelp.com/v3/businesses"
        unwrappedURL.append(path: Constants.searchComponent) // "https://api.yelp.com/v3/businesses/search"
        print(unwrappedURL.description)
        
        var urlComponents = URLComponents(url: unwrappedURL, resolvingAgainstBaseURL: true)
        
        //At this point our URL should look like this
        //https://api.yelp.com/v3/businesses/search
        urlComponents?.queryItems = [
            URLQueryItem(name: "term", value: searchTerm), //api.yelp.com/v3/businesses/search?term=pizza
            URLQueryItem(name: "location", value: "1550 Digital Dr #400, Lehi, UT 84043"),
            URLQueryItem(name: "limit", value: "10")
        ]
        
        //At this point we have the following:  https://api.yelp.com/v3/businesses/search?term=pizza&location=1550 Digital Dr %23400, Lehi, UT 84043&limit=10
        //NOTE: - The URL wont work unless the header is included
        guard let builtURL = urlComponents?.url else {
            completion(.failure(YelpError.invalidURL))
            return
        }
        
        //include the header
        var request = URLRequest(url: builtURL)
        request.allHTTPHeaderFields = Constants.header
        print(request.description)
        
        /* at this point we have our fully built URL and have included the top secrete header as well:
         https://api.yelp.com/v3/businesses/search?term=pizza&location=1550 Digital Dr %23400, Lehi, UT 84043&limit=10
         */
        // 2 - Data Task
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            // 3 - Error Handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            
            // 4 - Check for Data
            guard let data = data else {
                print("Failed at the data part of URL call")
                print("error: \(String(describing: error)): \(error?.localizedDescription ?? "error unable to be determined")")
                return completion(.failure(.noData))
            }
            
            // 5 - Decode Data
            do {
                let businesses = try JSONDecoder().decode(YelpInfo.self, from: data)
                return completion(.success(businesses))
            } catch {
                print(":(")
                print(error)
                print(error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            
        }.resume()
    }
}


extension YelpController {
    class NetworkManagerV2 {
        
        //NOTE: - Fetching a Yelp business image - The master copy of this project does not include a URLSession DataTask method for fetching a Yelp business image object. Instead in the the file titled 'Extensions' there's a method titled 'loadImage' that handles fetching a Yelp business image. If you would like to fetch an image using the URLSession Data Task method please refer to the DevMnt Pokemon project for reference code.
        
        ///Please review [Yelps Api page](https://www.yelp.com/developers/documentation/v3/business_search) documentation on using this endpoint
        let baseURL = URL(string: "https://api.yelp.com/v3")
        static let shared = NetworkManagerV2()
        
        ///Fetch business data from the Yelp API. This method takes in a string as its parameter. The string passed in is what the Yelp API will attempt to search.
        func fetchBusiness(type: String,completion: @escaping (Result<YelpInfo, YelpError>) -> Void ) {
            guard var url = baseURL else {
                completion(.failure(YelpError.invalidURL))
                return
            }
            
            url.appendPathComponent("businesses")
            url.appendPathComponent("search")
            
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            
            components?.queryItems = [
                URLQueryItem(name: "term", value: type),
                ///The location value is the location the Yelp API will use to search for possible results. In this project we have hardcoded the address below.
                URLQueryItem(name: "location", value: "1550 Digital Dr #400, Lehi, UT 84043"),
                URLQueryItem(name: "limit", value: "10")
            ]
            
            guard let builtURL = components?.url else {
                completion(.failure(YelpError.invalidURL))
                return
            }
            
            var request = URLRequest(url: builtURL)
            
            //The Yelp API requires a header value be provided
            request.allHTTPHeaderFields = Constants.header
            
            //NOTE: - If you'd like to plug in your builtURL URL into a search browser to see the JSON, you need to account for the required header value. Without the header, the URL request inside a web browser will not work. Consider using an API client like Postman that easily allows a header to be provided in order to see the JSON result
            print("[NetworkManager] - \(#function) builtURL: \(builtURL.description)")
            
            //MARK: - URL Session Data Task
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(YelpError.thrownError(error)))
                    print("error: \(error): \(error.localizedDescription)")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(YelpError.invalidURL))
                    return
                }
                
                guard let data = data else {
                    print("error: \(String(describing: error)): \(error?.localizedDescription ?? "")")
                    completion(.failure(YelpError.noData))
                    return
                }
                
                do {
                    let business = try JSONDecoder().decode(YelpInfo.self, from: data)
                    completion(.success(business))
                    return
                } catch {
                    print("error: \(error): \(error.localizedDescription)")
                    completion(.failure(YelpError.thrownError(error)))
                    return
                }
            }.resume()
        }
    }
}
