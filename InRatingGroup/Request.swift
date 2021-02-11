//
//  Request.swift
//  InRatingGroup
//
//  Created by Robert on 09.02.2021.
//

import Foundation

class NetworkLayer {
    
    enum Endpoint: String {
        case getPost = "users/posts/get"
        case getLikers = "users/posts/likers/all"
        case getReposters = "users/posts/reposters/all"
        case getCommentators = "users/posts/commentators/all"
        case getMentions = "users/posts/mentions/all"
    }
    
    func startRequest<T: Codable>(endpoint: Endpoint, body: [String: Any], response: T.Type, complition: @escaping (T?, Error?)->())  {
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        // create post request
        let url = URL(string: "https://api.inrating.top/v1/\(endpoint.rawValue)")! //PUT Your URL
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY3ZGJlNWQyMjBlMzQ0MGY5MTdhNTY2ZGUwMTFhMTU2ZGQ5NzliMGM2NzRhM2JlNTEwNWY3ZGQ4YTE2YjhlZWVjNzZiMGQxNjI1MGUzNzZjIn0.eyJhdWQiOiIzIiwianRpIjoiNjdkYmU1ZDIyMGUzNDQwZjkxN2E1NjZkZTAxMWExNTZkZDk3OWIwYzY3NGEzYmU1MTA1ZjdkZDhhMTZiOGVlZWM3NmIwZDE2MjUwZTM3NmMiLCJpYXQiOjE2MTIzNDcxMTQsIm5iZiI6MTYxMjM0NzExNCwiZXhwIjoxNjQzODgzMTE0LCJzdWIiOiI0MzM5MTgiLCJzY29wZXMiOltdfQ.nsRB7c3wIYad8b1uCxK288zO_xCYLqRNNUCmjeQX6ED0okzx-xb5-nzXbIxOq3twbr8G_CqMswnwPF-SKozT0mzHeqf5rAACwUugWI3z5MWDu1JBqkzcAEUO71fI5auFEzRci5lhcHBKkpmHfoyttrZf-SAi_0DjCBPC1zXJapr0xvWRhuU6ExH_s2iFwAZn-nix6CU1i93oBuCryamZhLj4qczbjDYpIKb2bPIzrG4l_Otdt1NZIa1Slv9Cv-wyDy8CJLZQZxEopfT3Mfef-Aiu5jgygzz9GSVASsSFV6HQsqoQb9hFL3Ygq6LERru7xA3zWJsd2HxhNZjzlP1zAoAJCSq3bnf6E_6ivKtJcT1JKtyZ5Kb40kERDb9be39yUY_VJcpYcFcR9UDOqlXSKOA638bwcStpTvZdmZcZTY-qwDEg5LOpQhGkACGbcKHssXoU5aEWbrbxSSMwpCkQ8l-aZN34PNaLZ8EWpcvKF4gvaWDiud7zKuj6ySmHOy-n5MjZH7jOBYXxaNVsA0U14w_oSgPiNDy3Ow-uCtJ2gszsc8zB2Jo8OHUbzpdJ5m5KIRF9gjTI23KSfXYugZcH03MC_yvgJU_3wd1dqUFFewQBzlFH055OQNpEnzRJC1_VJjEmm1f95eWPJn7Y_TmZ_x8nd6VK96nsdU2t06Ys7q8", forHTTPHeaderField: "Authorization")
        
        // insert json data to the request
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, urlRespons, error in
            guard let data = data, error == nil, urlRespons != nil else {
                complition(nil, error)
                print("something is wrong")
                return
            }
            print("downloaded")
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(T.self, from: data)
                complition(response, nil)
                
            } catch let DecodingError.dataCorrupted(context) {
                complition(nil, context.underlyingError)
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                complition(nil, context.underlyingError)
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                complition(nil, context.underlyingError)
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                complition(nil, context.underlyingError)
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                complition(nil, error)
                print("error: ", error)
            }
        }.resume()
    }
}
