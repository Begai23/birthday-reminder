//
//  ViewController3.swift
//  BirthdayReminder
//
//  Created by Begai Bakytovna on 22/12/23.
//

import UIKit

class ViewController3: UIViewController {
    
    weak var delegate : ViewController2?
   // let cancelButton = UIButton()
    //let addButton = UIButton()
    let photoButton = UIButton()
    let nameLabel = UILabel()
    let name = UITextField()
    let dataLabel = UILabel()
    let data = UITextField()
    let ageLabel = UILabel()
    let age = UITextField()
    let genderLabel = UILabel()
    let gender = UITextField()
    let instaLabel = UILabel()
    let insta = UITextField()
    let datePicker = UIDatePicker()
    let agePicker = UIPickerView()
    let genderPicker = UIPickerView()
    let genderChoice = ["Man", "Woman"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        let navBar = UINavigationBar(frame: CGRect(x: 1, y: 90, width: 150, height: 30))
        let navItem = UINavigationItem(title: "Friends")
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        navItem.leftBarButtonItem = closeButton
        navItem.rightBarButtonItem = addButton
        navBar.setItems([navItem], animated: false)
        view.addSubview(navBar)
        
       /* self.cancelButton.frame = CGRect(x: 1, y: 90, width: 150, height: 30)
        view.addSubview(cancelButton)
        self.cancelButton.setTitle("Cancel", for: .normal )
        self.cancelButton.setTitleColor(UIColor.blue, for: .normal)
        self.cancelButton.layer.cornerRadius = 5
        
        self.addButton.frame = CGRect(x: 250, y: 90, width: 150, height: 30)
        view.addSubview(addButton)
        self.addButton.setTitle("Add", for: .normal)
        self.addButton.setTitleColor(UIColor.blue, for: .normal)
        self.addButton.layer.cornerRadius = 5
        */
        
        self.photoButton.frame = CGRect(x: 70, y: 250, width: 250, height: 90)
        view.addSubview(photoButton)
        self.photoButton.setTitle("Change the photo", for: .normal)
        self.photoButton.setTitleColor(UIColor.blue, for: .normal)
        self.photoButton.layer.cornerRadius = 5
        
        self.nameLabel.frame = CGRect(x: 75 , y: 350, width: 150, height: 30)
        view.addSubview(nameLabel)
        self.nameLabel.text = "Name"
        self.nameLabel.textColor = .blue
       
        
        self.name.frame = CGRect(x: 75, y: 380, width: 250, height: 30)
        view.addSubview(name)
        self.name.borderStyle = .bezel
        self.name.backgroundColor = .white
        self.name.placeholder = "Enter your name"
        
        self.dataLabel.frame = CGRect(x: 75, y: 420, width: 150, height: 30)
        view.addSubview(dataLabel)
        self.dataLabel.text = "Date"
        self.dataLabel.textColor = .blue
        
        self.data.frame = CGRect(x: 75, y: 450, width: 250, height: 30)
        view.addSubview(data)
        self.data.borderStyle = .bezel
        self.data.placeholder = "Enter the date"
        
        self.ageLabel.frame = CGRect(x: 75, y: 490, width: 150, height: 30)
        view.addSubview(ageLabel)
        self.ageLabel.text = "Age"
        self.ageLabel.textColor = .blue
        
        self.age.frame = CGRect(x: 75, y: 520, width: 250, height: 30)
        view.addSubview(age)
        self.age.borderStyle = .bezel
        self.age.placeholder = "Enter your age"
        
        self.genderLabel.frame = CGRect(x: 75, y: 560, width: 150, height: 30)
        view.addSubview(genderLabel)
        self.genderLabel.text = "Gender"
        self.genderLabel.textColor = .blue
        
        self.gender.frame = CGRect(x: 75, y: 590, width: 250, height: 30)
        view.addSubview(gender)
        self.gender.borderStyle = .bezel
        self.gender.placeholder = "Enyer your gender"
        
        
        self.instaLabel.frame = CGRect(x: 75, y: 630, width: 150, height: 30)
        view.addSubview(instaLabel)
        self.instaLabel.text = "Instagram"
        self.instaLabel.textColor = .blue
        
        self.insta.frame = CGRect(x: 75, y: 660, width: 250, height: 30)
        view.addSubview(insta)
        self.insta.borderStyle = .bezel
        self.insta.placeholder = "Add"
        
        
        //adding thr picker
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = .init(identifier: "Russian")
        //
        createDatePicker()
        createPicker()
        
        
        //adding pickers to textfield
       // data.inputView = datePicker
        age.inputView = agePicker
        gender.inputView = genderPicker
        
        //calling the dataSource and Delegate
        agePicker.dataSource = self
        agePicker.delegate = self
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        
        //index
        agePicker.tag = 0
        genderPicker.tag = 1
        
        //creating the toolbar and button done for  datePicker
        
    }
    func createDatePicker () {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //barButton
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDateAction))
        toolbar.setItems([doneButton], animated: true)
        data.inputAccessoryView = toolbar
        data.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    //creating the toolbar and buttondone for picker
    func createPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneAction))
        toolbar.setItems([doneButton], animated: true)
        age.inputAccessoryView = toolbar
        gender.inputAccessoryView = toolbar
    }
    @objc func doneDateAction() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = .init(identifier: "Russian")
        data.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    ////for picker gender and age
    @objc func doneAction() {
        view.endEditing(true)
    }
    ///cancel
    @objc func cancelAction() {
        dismiss(animated: true, completion: nil)
    }
    ///Add
    @objc func add () {
        delegate?.update(name: name.text!, age: age.text!)
        dismiss(animated: true, completion: nil)
    }

}
extension ViewController3 : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{
        case 0:
            return 100
        case 1:
            return genderChoice.count
        default:
            return 1
            
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 0:
            return String(row)
        case 1:
            return genderChoice[row]
        default: return " "
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag{
        case 0 :
            age.text = String(row)
        case 1:
            gender.text = genderChoice[row]
        default: break
        }
    }
}
