//
//  DateAndRepeatView.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 18.01.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
        setConstraints()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let dateLabel: UILabel = {
       let label = UILabel()
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.text = "Date"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let workoutDatePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.tintColor = .specialGreen
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let repeatLabel: UILabel = {
       let label = UILabel()
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.text = "Repeat every 7 days"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let repeatSwitch: UISwitch = {
       let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.onTintColor = .specialGreen
        return repeatSwitch
    }()
    
    var dateStackView =  UIStackView()
    var repeatStackView = UIStackView()
    
    private func setupView () {
        backgroundColor = .specialBrown
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        
       dateStackView = UIStackView(arrangedSubviews: [dateLabel,workoutDatePicker],
                                   axis: .horizontal,
                                   spacing: 10)
        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel,repeatSwitch],
                                      axis: .horizontal,
                                      spacing: 10)
        addSubview(repeatStackView)
        addSubview(dateStackView)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            dateStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            repeatStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    
    
    
}
