//
//  OkCanselAlert.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 28.01.2022.
//

import UIKit

extension UIViewController {
    
    func canselOkAlert(title: String, massage: String?, complitiosHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            complitiosHandler()
        }
        let cansel = UIAlertAction(title: "Cansel", style: .cancel)
        alertController.addAction(ok)
        alertController.addAction(cansel)
        
        present(alertController, animated: true, completion: nil)
    }
}
