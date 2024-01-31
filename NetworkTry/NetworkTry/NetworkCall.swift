//
//  NetworkCall.swift
//  NetworkTry
//
//  Created by Paarth Parikh on 28/01/24.
//

import Foundation

class NetworkCall : NSObject, ObservableObject, URLSessionDelegate {
    @Published var reply = [Reply]()
    
    func sendDataToServer(IP_Add: String,reqType: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Replace with your server URL
        var url_send = "http://"+IP_Add+":80/Apprequests"
        let serverURL = URL(string: url_send)!

        // Replace with your data and make sure it's in the correct format (e.g., JSON)

        var request = URLRequest(url: serverURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(reqType, forHTTPHeaderField: "req_type")

        let session = URLSession.shared

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    completion(.success(responseString))
                } else {
                    completion(.failure(NSError(domain: "InvalidResponse", code: 0, userInfo: nil)))
                }
            } else {
                completion(.failure(NSError(domain: "NoData", code: 0, userInfo: nil)))
            }
        }
        task.resume()
    }
    func sendDataToServer(IP_Add: String,reqType: String,Switch_Number:String, completion: @escaping (Result<String, Error>) -> Void) {
        // Replace with your server URL
        var url_send = "http://"+IP_Add+":80/Apprequests"
        let serverURL = URL(string: url_send)!

        // Replace with your data and make sure it's in the correct format (e.g., JSON)

        var request = URLRequest(url: serverURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(reqType, forHTTPHeaderField: "req_type")
        request.addValue(Switch_Number, forHTTPHeaderField: "Switch_Number")

        let session = URLSession.shared

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    completion(.success(responseString))
                } else {
                    completion(.failure(NSError(domain: "InvalidResponse", code: 0, userInfo: nil)))
                }
            } else {
                completion(.failure(NSError(domain: "NoData", code: 0, userInfo: nil)))
            }
        }
        task.resume()
    }
    
    func sendDataToServer(IP_Add: String,reqType: String,Identification:String,Wifi_SSID:String,Wifi_Password:String,completion: @escaping (Result<String, Error>) -> Void) {
        // Replace with your server URL
        var url_send = "http://"+IP_Add+":80/Apprequests"
        let serverURL = URL(string: url_send)!

        // Replace with your data and make sure it's in the correct format (e.g., JSON)

        var request = URLRequest(url: serverURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(reqType, forHTTPHeaderField: "req_type")
        request.addValue(Identification, forHTTPHeaderField: "Identification")
        request.addValue(Wifi_SSID, forHTTPHeaderField: "Wifi_SSID")
        request.addValue(Wifi_Password, forHTTPHeaderField: "Wifi_Password")

        let session = URLSession.shared

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    completion(.success(responseString))
                } else {
                    completion(.failure(NSError(domain: "InvalidResponse", code: 0, userInfo: nil)))
                }
            } else {
                completion(.failure(NSError(domain: "NoData", code: 0, userInfo: nil)))
            }
        }
        task.resume()
    }
}
