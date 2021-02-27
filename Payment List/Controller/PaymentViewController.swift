//
//  PaymentViewController.swift
//  Payment List
//
//  Created by Sherif Musa on 21.02.2021.
//

import UIKit

class PaymentViewController: UIViewController, PaymentListManagerDelegate {
    func didFailWithError(error: Error) {
        print( error)
    }
    
    
    func didUpdateList(list: String) {
        
          print(list)
    
    }
    
    
    
    
  
    var login: String?
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    var paymentListManager = PaymentListManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        paymentListManager.delegate = self
        
       self.textView.text = paymentListManager.textArray[Int.random(in:0...3)]
         
        
        guard let login = self.login else { return }
        label.text = "Ваш Платежи, \(login)"
        
        
        
        
    }
    
    
    
    @IBAction func logoutTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
        
    }
    
    
    
    
}
