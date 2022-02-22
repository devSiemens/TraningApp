//
//  ProfileViewController.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 18.01.2022.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    private let localRealm = try! Realm()
    private let userArray : Results<UserModel>! = nil
    private let workoutArray: Results<WorkoutModel>! = nil
    private func setupView(){
        view.backgroundColor = .specialBackground
        view.addSubview(profileLabel)
        view.addSubview(profileView)
        view.addSubview(userPhotoImageView)
        heightWeightStack = UIStackView(arrangedSubviews: [heightLabel,weightLabel],
                                        axis: .horizontal,
                                        spacing: 10)
        view.addSubview(heightWeightStack)
        view.addSubview(editingButton)
    }
    
    private let profileView = ProfileView()
    private var heightWeightStack = UIStackView()
    
    private let editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "editProfile"), for: .normal)
        button.addTarget(self, action: #selector(editingProfile), for: .touchUpInside)
        button.backgroundColor = .clear
        button.tintColor = .specialGreen
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -110)
        button.setTitle("Editing", for: .normal)
        button.titleLabel?.font = .robotoMedium18()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func editingProfile() {
        let editingProfile = EditingProfileViewController()
        editingProfile.modalPresentationStyle = .fullScreen
        present(editingProfile, animated: true)
       
    }
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.image = UIImage(named: "userPhoto")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
    
    private let heightLabel : UILabel = {
       let label = UILabel()
        label.text = "Height: _"
        label.font = .robotoMedium18()
        label.textColor = .specialBlack
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightLabel : UILabel = {
       let label = UILabel()
        label.text = "Weight: _"
        label.font = .robotoMedium18()
        label.textColor = .specialBlack
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profileLabel: UILabel = {
       let label = UILabel()
        label.text = "PROFILE"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            profileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            profileLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 65),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            profileView.heightAnchor.constraint(equalToConstant: 115)
        ])
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20),
            userPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            heightWeightStack.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 5),
            heightWeightStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            heightWeightStack.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            editingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            editingButton.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 5),
            editingButton.heightAnchor.constraint(equalToConstant: 20),
            editingButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
}
