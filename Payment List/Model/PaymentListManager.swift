//
//  PaymentListManager.swift
//  Payment List
//
//  Created by Sherif Musa on 23.02.2021.
//

import Foundation

protocol PaymentListManagerDelegate {
    func didUpdateList(list: String)
    func didFailWithError(error: Error)
}

struct  PaymentListManager {
    
    var delegate: PaymentListManagerDelegate?
    
    let baseURL = "https://82.202.204.94/api/"
    let apiKey = "12345"
    let v      =   1
    let textArray = ["...", "-"  ,   " Это Ваши Платежи", "вы все оплатили"]
    
    func getList(for list: String) {
        
        let urlString = "\(baseURL)/?app-key=\(apiKey)&v=\(v)"
       print(urlString)
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if self.parseJSON(safeData) != nil {
                        _ = String()
                       
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> String? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ContentData.self, from: data)
            let mylist = decodedData.list
            print(mylist)
            return mylist
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

     



