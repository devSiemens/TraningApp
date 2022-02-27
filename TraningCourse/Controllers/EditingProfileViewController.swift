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
        addTap()
        addSlide()
    }
    
    private func setupVIew(){
        view.backgroundColor = .specialBackground
        view.addSubview(closeButton)
        view.addSubview(editingLabel)
        view.addSubview(chooseView)
        view.addSubview(choosePhotoImageView)
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(secondNameLabel)
        view.addSubview(secondNameTextField)
        view.addSubview(heightLabel)
        view.addSubview(heightTextField)
        view.addSubview(weightLabel)
        view.addSubview(weightTextField)
        view.addSubview(addTargetLabel)
        view.addSubview(addTargetTextField)
        view.addSubview(saveButton)
    }
    private func addTap(){
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(tapHideKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }
    
    private func addSlide(){
        let tapScreen = UISwipeGestureRecognizer(target: self, action: #selector(swifeHideKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }

    @objc private func tapHideKeyboard(){
        view.endEditing(true)
    }
    
    @objc private func swifeHideKeyboard(){
        view.endEditing(true)
    }
    
    private let closeButton : UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(named: "CloseButton"), for: .normal)
        button.layer.cornerRadius = button.frame.height/2
        button.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let editingLabel: UILabel = {
       let label = UILabel()
        label.text = "EDITING PROFILE"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chooseView: UIView = {
       let view = UIView()
        view.addShadowOnView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .specialGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var firstNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First Name"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        return label
    }()
    
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .specialBrown
        textField.font = .robotoBold20()
        textField.textColor = .specialGray
        textField.borderStyle = .none
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var secondNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Second Name"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        return label
    }()
    
    private let secondNameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .specialBrown
        textField.font = .robotoBold20()
        textField.textColor = .specialGray
        textField.borderStyle = .none
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var heightLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Height"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        return label
    }()
    
    private let heightTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .specialBrown
        textField.font = .robotoBold20()
        textField.textColor = .specialGray
        textField.borderStyle = .none
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var weightLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        return label
    }()
    
    private let weightTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .specialBrown
        textField.font = .robotoBold20()
        textField.textColor = .specialGray
        textField.borderStyle = .none
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var addTargetLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add Target"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        return label
    }()
    
    private let addTargetTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .specialBrown
        textField.font = .robotoBold20()
        textField.textColor = .specialGray
        textField.borderStyle = .none
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let choosePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.image = UIImage(named: "userPhoto")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SAVE", for: .normal)
        button.tintColor = .specialBackground
        button.titleLabel?.font = .robotoBold16()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .specialGreen
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func saveButtonTapped(){
        print("Save editing profile")
    }
    
    override func viewDidLayoutSubviews() {
        choosePhotoImageView.layer.cornerRadius = choosePhotoImageView.frame.width / 2
    }
    
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
        NSLayoutConstraint.activate([
            editingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            editingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            editingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            editingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            choosePhotoImageView.topAnchor.constraint(equalTo: editingLabel.bottomAnchor, constant: 20),
            choosePhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choosePhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            choosePhotoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            chooseView.topAnchor.constraint(equalTo: editingLabel.bottomAnchor, constant: 65),
            chooseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            chooseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            chooseView.heightAnchor.constraint(equalToConstant: 68)
        ])
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: chooseView.bottomAnchor, constant: 30),
            firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            firstNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            firstNameLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        NSLayoutConstraint.activate([
            firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 5),
            firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            secondNameLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 15),
            secondNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            secondNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            secondNameLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        NSLayoutConstraint.activate([
            secondNameTextField.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 5),
            secondNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            secondNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            heightLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 15),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            heightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            heightLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        NSLayoutConstraint.activate([
            heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 5),
            heightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            heightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            heightTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            weightLabel.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 15),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            weightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            weightLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        NSLayoutConstraint.activate([
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 5),
            weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            weightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            weightTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            addTargetLabel.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 15),
            addTargetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            addTargetLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addTargetLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        NSLayoutConstraint.activate([
            addTargetTextField.topAnchor.constraint(equalTo: addTargetLabel.bottomAnchor, constant: 5),
            addTargetTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            addTargetTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addTargetTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: addTargetTextField.bottomAnchor, constant: 40),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}


