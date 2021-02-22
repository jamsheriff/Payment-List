//
//  PaymentViewController.swift
//  Payment List
//
//  Created by Sherif Musa on 21.02.2021.
//

import UIKit

class PaymentViewController: UIViewController {

    var login: String?

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = self.login else { return }
        label.text = "Hello, \(login)"
    }
    
    
    
    @IBAction func logoutTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    
    }
    
    
}
