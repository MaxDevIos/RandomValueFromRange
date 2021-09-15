//
//  SettingsViewController.swift
//  RandomValueFromRange
//
//  Created by Maxim Kucherov on 13.09.2021.
//

import UIKit

class SettingsViewController: UIViewController {

//MARK: - IB Outlet
    @IBOutlet var minimumValueTextField: UITextField!
    @IBOutlet var maximumValueTextField: UITextField!
    
//MARK: - Public Properties
    var random: RandomNumber!
    var delegate: SettingsViewControllerDelegateProtocol!
    
//MARK: - Private Properties
    
//MARK: - Initializers
    
//MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTextField.delegate = self
        maximumValueTextField.delegate = self
        minimumValueTextField.text = String(random.minimumValue)
        maximumValueTextField.text = String(random.maximumValue)
    }
    
//MARK: - IB Actions
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        minimumValueTextField.resignFirstResponder()
        maximumValueTextField.resignFirstResponder()
        delegate.setNewValue(for: random)
        dismiss(animated: true)
    }
    
//MARK: - Public Methods
    
//MARK: Private Methods

}

//MARK: - Extensions
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let newValue = textField.text else { return }
        guard let numberValue = Int(newValue) else { return
            showAlert(with: "Wrong format",
                      and: "Please enter values of min and max range!")
        }
        
        if textField == minimumValueTextField {
            random.minimumValue = numberValue
        } else {
            random.maximumValue = numberValue
        }
    }
}

extension SettingsViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.minimumValueTextField.text = ""
            self.maximumValueTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
