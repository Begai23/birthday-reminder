//
//  ViewController2.swift
//  BirthdayReminder
//
//  Created by Begai Bakytovna on 22/12/23.
//

import UIKit

protocol ViewController2Delegate: AnyObject  {
    func update(name: String, age: String)
}


class ViewController2: UIViewController, ViewController2Delegate {
    let nameL = UILabel()
    let ageL = UILabel()
    lazy var addButton1 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubview()
        configureUI()
        
        //func update(name: String, age: String) {
            
        //}
        self.nameL.frame = CGRect(x: 75, y: 150, width: 150, height: 40)
        self.ageL.frame = CGRect(x: 75, y: 180, width: 150, height: 40)
        
    }
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let destination = segue.destination as? ViewController3 else {return}
        destination.delegate = self
    }
    func update(name: String, age: String) {
        nameL.text? = name.capitalized
        ageL.text? = age + "years"
    }
    func configureUI () {
        navigationItem.rightBarButtonItem = addButton1
        navigationItem.title = "List"
        
        nameL.text = ""
        nameL.font = UIFont.boldSystemFont(ofSize: 16)
        ageL.text = ""
    }
    
    func addSubview() {
        view.addSubview(nameL)
        view.addSubview(ageL)
    }
    @objc func addButtonTapped() {
        let thirdViewController = ViewController3()
        thirdViewController.delegate = self
        thirdViewController.modalPresentationStyle = .formSheet
        present(thirdViewController, animated:  false, completion: nil)
    }
}
