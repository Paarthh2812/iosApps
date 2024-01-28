//
//  NetworkCall.swift
//  NetworkTry
//
//  Created by Paarth Parikh on 28/01/24.
//

import Foundation

class NetworkCall : NSObject, ObservableObject, URLSessionDelegate {
    @Published var posts = [Posts]()
    
    func loadPostData(completion:@escaping ([Posts]) -> ()) {
        guard let url = URL(string: "http://192.168.0.101:80/json") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(data as Any)
        }.resume()
    }
    
    func sendDataToServer() {
        // Replace with your server URL
        let serverURL = URL(string: "http://192.168.0.101:80")!

        // Replace with your data and make sure it's in the correct format (e.g., JSON)
        let jsonData = """
        {
            "key1": "value1",
            "key2": "value2"
        }
        """.data(using: .utf8)

        var request = URLRequest(url: serverURL)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared

        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            // Handle the response data here
            if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                print("Response: \(responseString ?? "No response data")")
            }
        }

        task.resume()
    }
    func senddataDataToServer() {
        // Replace with your server URL
        let serverURL = URL(string: "http://192.168.0.101:80/11")!

        // Replace with your data and make sure it's in the correct format (e.g., JSON)
//        let jsonData = """
//        {h$}
//        """.data(using: .utf8)

        let request = URLRequest(url: serverURL)
//        request.httpMethod = "POST"
//        request.httpBody = jsonData
//        request.addValue("application/text", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        
        let task = session.dataTask(with: request){ data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // Handle the response data here
            if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                print("Response: \(responseString ?? "No response data")")
            }
        }
//        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            // Handle the response data here
//            if let data = data {
//                let responseString = String(data: data, encoding: .utf8)
//                print("Response: \(responseString ?? "No response data")")
//            }
//        }

        task.resume()
    }
//    func Websocket_Task(){
//        let serverURL = URL(string: "192.168.0.101:80")!
//        let urlSession = URLSession(configuration: .default)
//        let webSocketTask = urlSession.webSocketTask(with: serverURL)
//        webSocketTask.resume()
//        webSocketTask.cancel(with: .goingAway, reason: nil)
//    }

}

//import Foundation
//
//class NetworkManager : NSObject, URLSessionStreamDelegate{
//    static var shared = NetworkManager()
//    
//    private var session: URLSession! = nil
//    
//    private var stream: URLSessionStreamTask! = nil
//    
//    override init() {
//        super.init()
//        let config = URLSessionConfiguration.default
//        config.requestCachePolicy = .reloadIgnoringLocalCacheData
//        self.session = URLSession(configuration: config, delegate: self, delegateQueue: .main)
//        self.stream = self.session.streamTask(withHostName: "http://192.168.0.101", port: 80)
//    }
//    
//    func loadData(){
//        self.stream.startSecureConnection()
////        self.stream.write("1".data(using: .unicode)!, timeout:60, completionHandler: {
////            (error) in print("ERROR")
////        })
////        self.stream.readData(ofMinLength: 0, maxLength: 100000, timeout: 60, completionHandler: { (data, bool, error) in
////            print("bool = \(bool)")
////            print("data = \(data)")
////            print("error = \(String(describing: error))")
////        })
//        self.stream.resume()
//    }
//}
//
//    
//    
//    
////    func loadPostData(completion:@escaping ([Posts]) -> ()) {
////        
////        URLSess
////        
////        URLSession.shared.dataTask(with: url) { data, response, error in
////            let posts = try! JSONDecoder().decode([Posts].self, from: data!)
////            DispatchQueue.main.async {
////                completion(posts)
////            }
////        }.resume()
////        
////    }
////}
