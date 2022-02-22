//
//  EditingProfileViewController.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 22.02.2022.
//

import Foundation
import UIKit

class EditingProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIew()
        setConstraints()
    }
    
    private func setupVIew(){
        view.backgroundColor = .specialBackground
        view.addSubview(closeButton)
    }
    
    private let closeButton : UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(named: "CloseButton"), for: .normal)
        button.layer.cornerRadius = button.frame.height/2
        button.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func closeButtonTap() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}


