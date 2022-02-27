//
//  NewWorkoutViewController.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 17.01.2022.
//

import UIKit
import RealmSwift

class NewWorkoutViewController: UIViewController {

    private let newWorkoutLabel: UILabel = {
       let label = UILabel()
        label.text = "NEW WORKOUT"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(named: "CloseButton"), for: .normal)
        button.layer.cornerRadius = button.frame.height/2
        button.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        return label
    }()
    
    private let dateAndRepeatLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date and repeat"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .specialBrown
        textField.font = .robotoBold20()
        textField.textColor = .specialGray
        textField.borderStyle = .none
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
//        textField.becomeFirstResponder()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    private let localRealm = try! Realm()
    private var workoutModel = WorkoutModel()
    private let testImage = UIImage(named: "weight")
    
    private let repsOrTimerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Reps or timer"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        return label
    }()
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SAVE", for: .normal)
        button.tintColor = .specialBackground
        button.titleLabel?.font = .robotoBold16()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .specialGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        setDeligate()
        addTap()
        addSlide()
    }
    
    private let mainVC = MainViewController()
    
    @objc private func closeButtonTap() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func saveButtonTapped() {
        setModel()
        saveModel()
    }
    
   //MARK: - SetupView
    private func setupView() {
        view.backgroundColor = .specialBackground
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(dateAndRepeatLabel)
        view.addSubview(dateAndRepeatView)
        view.addSubview(repsOrTimerLabel)
        view.addSubview(repsOrTimerView)
        view.addSubview(saveButton)
    }
    
    private func setDeligate(){
        nameTextField.delegate = self
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
    
    private func setModel(){
        guard let nameWorkout = nameTextField.text else {return}
        workoutModel.workoutName = nameWorkout
        workoutModel.workoutDate = dateAndRepeatView.workoutDatePicker.date.localDate()
        workoutModel.workoutNumberOfDay = dateAndRepeatView.workoutDatePicker.date.getWeekdayNumber()
        
        workoutModel.workoutRepeat = (dateAndRepeatView.repeatSwitch.isOn)
        workoutModel.workoutSet = Int(repsOrTimerView.setsSlider.value)
        workoutModel.workoutReps = Int(repsOrTimerView.repsSlider.value)
        workoutModel.workoutTimer = Int(repsOrTimerView.timeSlider.value)
        guard let imageData = testImage?.pngData() else {return}
        workoutModel.workoutImage = imageData
    }

    private func saveModel(){
        guard let text = nameTextField.text else {return}
        let count = text.filter {$0.isNumber || $0.isLetter}.count
        
        if count != 0 && workoutModel.workoutSet != 0 && (workoutModel.workoutReps != 0 || workoutModel.workoutTimer != 0) {
            RealmManager.shared.saveWorkoutModel(model: workoutModel)
            okAlert(title: "Succes", massage: nil)
            workoutModel = WorkoutModel()
            refreshWorkoutObjects()
        }else {
            okAlert(title: "Failed to save", massage: "Enter data")
        }
    }
    private func refreshWorkoutObjects() {
        dateAndRepeatView.workoutDatePicker.setDate(Date(), animated: true)
        dateAndRepeatView.repeatSwitch.isOn = true
        nameTextField.text = ""
        repsOrTimerView.timeSlider.value = 0
        repsOrTimerView.setsSlider.value = 0
        repsOrTimerView.repsSlider.value = 0
        repsOrTimerView.countOfRepsLabel.text = "0"
        repsOrTimerView.countOfSetLabel.text = "0"
        repsOrTimerView.countOfTimeLabel.text = "0"
    }
}

//MARK: - SetConstraints
extension NewWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newWorkoutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            newWorkoutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 60),
            nameLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateAndRepeatLabel.widthAnchor.constraint(equalToConstant: 100),
            dateAndRepeatLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            dateAndRepeatView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 5),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 93)
        ])
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 20),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsOrTimerLabel.widthAnchor.constraint(equalToConstant: 100),
            repsOrTimerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            repsOrTimerView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 5),
            repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 275)
        ])
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 30),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55),
//            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        
        ])
    }
}

extension NewWorkoutViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
    }
}
