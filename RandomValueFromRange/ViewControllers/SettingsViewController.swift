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
    var randomNumber: RandomNumber!
    var delegate: SettingsViewControllerDelegate!
    
//MARK: - Private Properties
    
//MARK: - Initializers
    
//MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTextField.text = String(randomNumber.minimumValue)
        maximumValueTextField.text = String(randomNumber.maximumValue)
    }
    
//MARK: - IB Actions
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        guard let minimumValue = minimumValueTextField.text else { return }
        guard let maximumValue = maximumValueTextField.text else { return }
        delegate.setNewValues(for: minimumValue, and: maximumValue)
        dismiss(animated: true)
    }
    
    
    
//MARK: - Public Methods
    
//MARK: Private Methods

}

//MARK: - Extensions
