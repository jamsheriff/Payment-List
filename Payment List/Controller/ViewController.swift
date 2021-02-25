//
//  ViewController.swift
//  Payment List
//
//  Created by Sherif Musa on 21.02.2021.
//

import UIKit

class ViewController: UIViewController  {

     
    
    @IBOutlet weak var usernameTF: UITextField!
    

    @IBOutlet weak var passwordTF: UITextField!
    

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func loginTapped(_ sender: UIButton) {
    
        performSegue(withIdentifier: "detailSegue", sender: nil)
    
        let token = "..."
        let url = URL(string: "https://82.202.204.94/api/")!

        // prepare json data
        let json: [String: Any] = ["State": 1]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        // create post request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }

        task.resume()


    }
   
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        
    guard segue.identifier == "unwindSegue" else { return }
    guard let svc = segue.source as? PaymentViewController else { return }
    self.resultLabel.text = svc.label.text
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let dvc = segue.destination as? PaymentViewController else { return }
    dvc.login = usernameTF.text
    
}

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
 }

}

