//
//  CommonProperty.swift
//  Library_application
//
//  Created by user189640 on 5/16/21.
//

import Foundation
import UIKit

class CommonProperty {
    
    let defaults = UserDefaults.standard
    
    func setDefaultCustomTextFieldSettings(_ uiTextField: UITextField) {
        uiTextField.textColor = UIColor.black
        uiTextField.layer.borderWidth = 1.0
        uiTextField.layer.borderColor = appColor.cgColor
        uiTextField.layer.cornerRadius = 5
        uiTextField.clearsOnBeginEditing = false
        uiTextField.autocorrectionType = .no
    }
    
    func setDefaultCustomStackViewSettings(_ uiStackView: UIStackView){
        uiStackView.layer.cornerRadius = 5
    }
    
    func setDefaultCustomButtonSettings(_ uiButton: UIButton) {
        uiButton.backgroundColor = appColor
        uiButton.setTitleColor(UIColor.white, for: .normal)
        uiButton.layer.cornerRadius = 5
        uiButton.titleLabel?.numberOfLines = 1
        uiButton.titleLabel?.adjustsFontSizeToFitWidth = true
        uiButton.titleLabel?.lineBreakMode = .byClipping
    }
    
    func retrieveAndDecodeStoredUsersData() -> [UserData] {
        let propertyListDecoder = PropertyListDecoder()
        if let savedUsersData = defaults.object(forKey: "usersData") as? Data {
            if let decodedUsersData = try? propertyListDecoder.decode(Array<UserData>.self, from: savedUsersData) {
                return decodedUsersData
            }
        }
        return []
    }
    
    func encodeAndStoreUsersData(usersData: [UserData]) {
        let propertyListEncoder = PropertyListEncoder()
        if let encodedScores = try? propertyListEncoder.encode(usersData) {
            defaults.set(encodedScores, forKey: "usersData")
        }
    }

}