//
//  MainViewController.swift
//  RandomValueFromRange
//
//  Created by Maxim Kucherov on 09.09.2021.
//

import UIKit

protocol SettingsViewControllerDelegateProtocol {
    func setNewValue(for randomNumber: RandomNumber)
}

class MainViewController: UIViewController {

//MARK: - IB Outlet
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    @IBOutlet var getResultButton: UIButton!
    
    private var randomValue = RandomNumber(minimumValue: 0, maximumValue: 100)
    
//MARK: - Public Properties
    
//MARK: - Private Properties
    
//MARK: - Initializers
    
//MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getResultButton.layer.cornerRadius = 15
        minimumValueLabel.text = String(randomValue.minimumValue)
        maximumValueLabel.text = String(randomValue.maximumValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingVC.random = randomValue
        settingVC.delegate = self
    }
    
//MARK: - IB Actions
    @IBAction func getResultButtonPressed(_ sender: UIButton) {
        randomValueLabel.text = String(randomValue.getRandom)
    }
    
//MARK: - Public Methods
    
//MARK: - Private Methods

}

//MARK: - Extensions
extension MainViewController: SettingsViewControllerDelegateProtocol {
    func setNewValue(for randomNumber: RandomNumber) {
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
        randomValue = randomNumber
    }

}


