//
//  WorkoutTableViewCell.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 16.01.2022.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {

    private let workoutCell : UIView = {
       let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let traningImage : UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "weight")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let workoutNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Pull Ups"
        label.font = .robotoMedium24()
        label.textColor = .specialDarkGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsNumberLabel: UILabel = {
       let label = UILabel()
        label.text = "Reps: 10"
        label.font = .robotoMedium14()
        label.textColor = #colorLiteral(red: 0.3913812339, green: 0.3912524879, blue: 0.3872336149, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setNubmerLabel: UILabel = {
       let label = UILabel()
        label.text = "Sets: 2"
        label.font = .robotoMedium14()
        label.textColor = #colorLiteral(red: 0.3913812339, green: 0.3912524879, blue: 0.3872336149, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.tintColor = .specialDarkGreen
        button.titleLabel?.font = .robotoMedium24()
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func startButtonTapped(){
        print("Start button tapped")
    }
    
    func cellConfigure(model:WorkoutModel) {
        workoutNameLabel.text = model.workoutName
        let (min,sec) = {(secs: Int) -> (Int,Int) in
            return (secs  / 60, secs % 60) }(model.workoutTimer)
        
        repsNumberLabel.text = (model.workoutTimer == 0 ? "Reps: \(model.workoutReps)" : "Timer: \(min) min \(sec) sec")
        setNubmerLabel.text = "Sets: \(model.workoutSet)"
        guard let imageData = model.workoutImage else {return}
        guard let image = UIImage(data: imageData) else {return}
        traningImage.image = image
    }
    
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(workoutCell)
        addSubview(workoutNameLabel)
        addSubview(repsNumberLabel)
        addSubview(setNubmerLabel)
        contentView.addSubview(startButton)
        addSubview(backView)
        addSubview(traningImage)
    }
    
    private func setConstrains(){
        
        NSLayoutConstraint.activate([
            workoutCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            workoutCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            workoutCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            workoutCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            workoutNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            workoutNameLabel.heightAnchor.constraint(equalToConstant: 26),
            workoutNameLabel.widthAnchor.constraint(equalToConstant: 90)
        ])
        NSLayoutConstraint.activate([
            repsNumberLabel.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 5),
            repsNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            repsNumberLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
        NSLayoutConstraint.activate([
            setNubmerLabel.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 5),
            setNubmerLabel.leadingAnchor.constraint(equalTo: repsNumberLabel.trailingAnchor, constant: 10),
            setNubmerLabel.heightAnchor.constraint(equalToConstant: 16),
            setNubmerLabel.widthAnchor.constraint(equalToConstant: 65)
        ])
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: repsNumberLabel.bottomAnchor, constant: 5),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: workoutCell.topAnchor, constant: 10),
            backView.leadingAnchor.constraint(equalTo: workoutCell.leadingAnchor, constant: 10),
            backView.trailingAnchor.constraint(equalTo: repsNumberLabel.leadingAnchor, constant: -10),
            backView.bottomAnchor.constraint(equalTo: workoutCell.bottomAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            traningImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            traningImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 5),
            traningImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -5),
            traningImage.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5)
        ])
    }
    
    
    
}
