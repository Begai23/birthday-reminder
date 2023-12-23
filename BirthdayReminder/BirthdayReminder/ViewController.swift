//
//  ViewController.swift
//  BirthdayReminder
//
//  Created by Begai Bakytovna on 22/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    let maintitle = UILabel()
    let signInTitle = UILabel()
    let emailLabel = UILabel()
    let email = UITextField()
    let passwordLabel =  UILabel()
    let password = UITextField()
    let switchLabel = UILabel()
    let switch2 = UISwitch()
    let enterButton = UIButton()

    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        self.maintitle.frame = CGRect(x: 90, y: 100, width: 250, height: 30)
        view.addSubview(maintitle)
        self.maintitle.text = "Birthday reminder"
        self.maintitle.font = .boldSystemFont(ofSize: 30)
        self.maintitle.textColor = .blue
        
        self.signInTitle.frame = CGRect(x: 75, y: 220, width: 150, height: 50)
        view.addSubview(signInTitle)
        self.signInTitle.text = "Sign in"
        self.signInTitle.font = .boldSystemFont(ofSize: 25)
        self.signInTitle.textColor = .black
        
        self.emailLabel.frame = CGRect(x: 75, y: 290, width: 150, height: 30)
        view.addSubview(emailLabel)
        self.emailLabel.text = "Email"
        self.emailLabel.textColor = .black
        
        self.email.frame = CGRect(x: 75, y: 330, width: 250, height: 50)
        view.addSubview(email)
        self.email.borderStyle = .roundedRect
        
        self.passwordLabel.frame = CGRect(x: 75, y: 400, width: 150, height: 30)
        view.addSubview(passwordLabel)
        self.passwordLabel.text = "Password"
        self.passwordLabel.textColor = .black
        
        self.password.frame = CGRect(x: 75, y: 440, width: 250, height: 50)
        view.addSubview(password)
        self.password.borderStyle = .roundedRect
        
        self.switchLabel.frame = CGRect(x: 120, y: 520, width: 100, height: 30)
        view.addSubview(switchLabel)
        self.switchLabel.text = "Face ID"
        self.switchLabel.textColor = .black
        
        self.switch2.frame = CGRect(x: 275, y: 520, width: 0, height: 0)
        view.addSubview(switch2)
        
        self.enterButton.frame = CGRect(x: 110, y: 600, width: 180, height: 60)
        view.addSubview(enterButton)
        self.enterButton.backgroundColor = .blue
        self.enterButton.setTitle("Enter", for: .normal)
        self.enterButton.layer.cornerRadius = 5
        self.enterButton.setTitleColor(UIColor.white, for: .normal)
        self.enterButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
    }
    @objc func buttonClick () {
        if email.text!.isEmpty || password.text!.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Enter your email and password", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        let secondController = ViewController2 ()
        navigationController?.pushViewController(secondController, animated: true)
       // let thirdController = ViewController3()
        //navigationController?.pushViewController(thirdController, animated: true)
    }

}

