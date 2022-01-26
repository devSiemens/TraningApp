//
//  TimeStartWorkoutViewController.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 25.01.2022.
//

import UIKit

class TimeStartWorkoutViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    private func setupView(){
        view.backgroundColor = .specialBackground
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(ellipseImage)
        view.addSubview(detailsLabel)
        view.addSubview(timerView)
        view.addSubview(finishButton)
        view.addSubview(timerLabel)
    }
    
   
    
    private let startWorkoutLabel: UILabel = {
       let label = UILabel()
        label.text = "START WORKOUT"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton : UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(named: "CloseButton"), for: .normal)
        button.layer.cornerRadius = button.frame.height/2
        button.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let ellipseImage : UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "Ellipse")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let detailsLabel: UILabel = {
       let label = UILabel()
        label.text = "Details"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let timerLabel : UILabel = {
       let label = UILabel()
        label.text = "01:30"
        label.textColor = .specialGray
        label.font = .robotoBold36()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FINISH", for: .normal)
        button.tintColor = .specialBackground
        button.titleLabel?.font = .robotoBold16()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .specialGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func finishButtonTapped() {
        print("Finish button tapped")
    }
    
    @objc private func closeButtonTap() {
        dismiss(animated: true, completion: nil)
    }
    
    private let timerView = TimerView()
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startWorkoutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            startWorkoutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            ellipseImage.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 30),
            ellipseImage.heightAnchor.constraint(equalToConstant: 250),
            ellipseImage.widthAnchor.constraint(equalToConstant: 250),
            ellipseImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: ellipseImage.bottomAnchor, constant: 5),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsLabel.heightAnchor.constraint(equalToConstant: 30),
            detailsLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 0),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 15),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55),
        ])
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: ellipseImage.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: ellipseImage.centerYAnchor),
            timerLabel.heightAnchor.constraint(equalToConstant: 50),
            timerLabel.widthAnchor.constraint(equalToConstant: 245)
        
        ])
    }
    
}
