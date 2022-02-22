//
//  ProfileView.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 22.02.2022.
//

import Foundation
import UIKit

class ProfileView: UIView{
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "USER NAME"
        label.textColor = .white
        label.font = .robotoMedium24()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private func setupView(){
        backgroundColor = .specialGreen
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
        addShadowOnView()
        addSubview(nameLabel)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1)
        ])
    }
}
