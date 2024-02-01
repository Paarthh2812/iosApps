//
//  Network.swift
//  iSwitch
//
//  Created by Paarth Parikh on 31/01/24.
//
//
import Foundation

//@MainActor
class NetworkManager : NSObject, ObservableObject, URLSessionDelegate {
    
    func getIP()-> String? {
            
            var address: String?
            var ifaddr: UnsafeMutablePointer<ifaddrs>?
            
            if getifaddrs(&ifaddr) == 0 {
                
                var ptr = ifaddr
                while ptr != nil {
                    defer { ptr = ptr?.pointee.ifa_next } // memory has been renamed to pointee in swift 3 so changed memory to pointee
                    
                    guard let interface = ptr?.pointee else {
                        return nil
                    }
                    let addrFamily = interface.ifa_addr.pointee.sa_family
                    if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                        
                        guard let ifa_name = interface.ifa_name else {
                            return nil
                        }
                        let name: String = String(cString: ifa_name)
                        
                        if name == "en0" {  // String.fromCString() is deprecated in Swift 3. So use the following code inorder to get the exact IP Address.
                            var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                            getnameinfo(interface.ifa_addr, socklen_t((interface.ifa_addr.pointee.sa_len)), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                            address = String(cString: hostname)
                        }
                        
                    }
                }
                freeifaddrs(ifaddr)
            }
            
            return address
        }
    func sendDataToServer(IP_Add: String,reqType: String, completion: @escaping (Result<String, Error>) -> Void){
        // Replace with your server URL
        let url_send = "http://"+IP_Add+":80/Apprequests"
        let serverURL = URL(string: url_send)!

        // Replace with your data and make sure it's in the correct format (e.g., JSON)

        var request = URLRequest(url: serverURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(reqType, forHTTPHeaderField: "req_type")
        request.timeoutInterval = 1

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
        let url_send = "http://"+IP_Add+":80/Apprequests"
        let serverURL = URL(string: url_send)!
        let switchno = Int(Switch_Number)!+1

        // Replace with your data and make sure it's in the correct format (e.g., JSON)

        var request = URLRequest(url: serverURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(reqType, forHTTPHeaderField: "req_type")
        request.addValue(String(switchno), forHTTPHeaderField: "Switch_Number")

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
    
    func sendDataToServer(IP_Add: String,reqType: String,Identification:String,Wifi_SSID:String,Wifi_Password:String,completion: @escaping (Result<String, Error>) -> Void){
        // Replace with your server URL
        let url_send = "http://"+IP_Add+":80/Apprequests"
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
