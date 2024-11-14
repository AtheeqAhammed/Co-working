//
//  LoginViewController.swift
//  Co-working
//
//  Created by Ateeq Ahmed on 03/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginModel: LoginModel?
    var loginViewModel = LoginViewModel()

    @IBOutlet weak var mobileOrEmailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
//        checkValidation()
        let homeViewController = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func checkValidation() {
          if mobileOrEmailTxt.text == "" {
              showAlert(message: "Enter valid email")
          } else if let validphone = mobileOrEmailTxt.text, validphone.isValidPhone() || validphone.isValidEmail() {
          }else{
            showAlert(message: "Enter valid email or mobile number")
          }
    }
    
    func getUserDetails(){
//        loginViewModel.loginUser(loginDetails: LoginModel()) { success, error in
//            if let error = error {
//                self.showAlert(message: error)
//            } else {
//                self.loginModel = self.loginViewModel.getUserDetails()
//            }
//        }
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
}
