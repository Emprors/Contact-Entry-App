//
//  ViewController.swift
//  Contact Entry App
//
//  Created by Bouna Anour NDIAYE on 2020-02-06.
//  Copyright © 2020 Bouna Anour NDIAYE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var lastField: UITextField!
    @IBOutlet weak var companyField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet var textfields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gesture()
        
        
    }

    @IBAction func saveButton(_ sender: UIButton) {
        alertValidation()
    }
    
    @IBAction func texfieldDoneEditing(_ sender: UITextField){
        sender.resignFirstResponder()
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .actionSheet)
        let actionOne = UIAlertAction(title: "Yes, I am sure", style: .destructive) { (UIAlertAction) in
            self.emptyTextfield()
        }
        let actionTwo = UIAlertAction(title: "No Way", style: .cancel, handler: nil)
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        present(alert, animated: true,completion: nil)
    }
    
    //MARK: - Methods
    
//     Gesture method
    func gesture (){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped() {
        firstField.resignFirstResponder()
        lastField.resignFirstResponder()
        companyField.resignFirstResponder()
        phoneField.resignFirstResponder()
        emailField.resignFirstResponder()
    }
    
//     Setting empty textfields method
    func emptyTextfield () {
        firstField.text = ""
        lastField.text = ""
        companyField.text = ""
        phoneField.text = ""
        emailField.text = ""
    }
    
//     Creating an alert based on validation rulea
    func alertValidation (){
        
        for textfield in textfields {
            let textfieldIdentifier = textfield.accessibilityIdentifier ?? ""
            if textfield.text?.isEmpty == true {
                let alert = UIAlertController(title: "Error", message: " \(textfieldIdentifier) field is empty", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        guard  let firstName = firstField.text else {return}
        let alert = UIAlertController(title: "New Contact Saved", message: " \(firstName) is now a contact!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: emptyTextfield)
        
    }
            

}
