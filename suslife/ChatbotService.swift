//
//  ChatbotService.swift
//  suslife
//
//  Created by Sarah Saiyed on 28/06/2024.
//

//import Foundation
//import Foundation
//import Alamofire
//
//class ChatbotService {
//    private let apiKey = "sk-proj-a550RF38RSWZcrirEx7aT3BlbkFJP9ddaLWMLM3SmYpkBjAP"
//    // Replace with your actual API key
//    private let apiUrl = "https://api.openai.com/v1/engines/davinci-codex/completions"
//
//    func getResponse(for query: String, completion: @escaping (String) -> Void) {
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer \(apiKey)"
//        ]
//        
//        let parameters: [String: Any] = [
//            "prompt": query,
//            "max_tokens": 100
//        ]
//        
//        AF.request(apiUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in switch response.result {
//            case .success(let value):
//                if let json = value as? [String: Any],
//                   let choices = json["choices"] as? [[String: Any]],
//                   let text = choices.first?["text"] as? String {
//                    completion(text.trimmingCharacters(in: .whitespacesAndNewlines))
//                } else {
//                    completion("Sorry, I couldn't understand your question.")
//                }
//            case .failure(let error):
//                print("Error: \(error)")
//                completion("Sorry, there was an error processing your request.")
//            }
//        }
//    }
//}
