//
//  LoginViewController.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 03/12/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var mobileOrEmailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let homeViewController = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
