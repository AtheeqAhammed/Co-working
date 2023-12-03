//
//  CreateAccountViewController.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 03/12/23.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    var accountCreateModel: AccountCreateModel?
    var createAccountViewModel = CreateAccountViewModel()

    @IBOutlet weak var fullNameTxt: UITextField!
    @IBOutlet weak var mobileNumberTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mobileNumberTxt.delegate = self

    }

    @IBAction func logInTapped(_ sender: UIButton) {
        let loginViewController = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        if validation() == true {
            createUserDetails()
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(homeViewController, animated: true)
        } else {
            showAlert(message: "Failed to create account")
        }
    }
    
    func validation() -> Bool{
        
        if fullNameTxt.text == "" {
            showAlert(message: "Name cannot be empty")
        }
        if mobileNumberTxt.text == "" || mobileNumberTxt.text?.count != 10 {
            showAlert(message: "Enter valid mobile number")
        }
        if emailTxt.text == "" || emailTxt.text?.isValidEmail() == false {
            showAlert(message: "Enter valid email")
        }
        return true
    }
    
    func createUserDetails(){
        
        var accountModel = AccountCreateModel()
        accountModel.name = self.fullNameTxt.text!
        accountModel.mobileNumber = self.mobileNumberTxt.text
        accountModel.email = self.emailTxt.text
        
        createAccountViewModel.accountCreate(userDetails: accountModel) { success, error in
            if let error = error {
                self.showAlert(message: error)
            } else {
                self.accountCreateModel = self.createAccountViewModel.getUserDetails()
            }
        }
    }
    
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
}

