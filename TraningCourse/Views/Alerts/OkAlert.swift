//
//  OkAlert.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 24.01.2022.
//

import UIKit

extension UIViewController {
    
    func okAlert(title: String, massage: String?) {
        let alertController = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        
        present(alertController, animated: true, completion: nil)
    }
}
