//
//  RepsOrTimerView.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 18.01.2022.
//

import UIKit

class RepsOrTimerView: UIView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let setLabel: UILabel = {
       let label = UILabel()
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.text = "Sets"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsLabel: UILabel = {
       let label = UILabel()
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.text = "Reps"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timerLabel: UILabel = {
       let label = UILabel()
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.text = "Timer"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let countOfSetLabel: UILabel = {
       let label = UILabel()
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let countOfRepsLabel: UILabel = {
       let label = UILabel()
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let countOfTimeLabel: UILabel = {
       let label = UILabel()
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chooseLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "Choose repeat or timer"
         label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
         label.adjustsFontSizeToFitWidth = true
         label.font = .robotoMedium14()
         return label
    }()
    
     let setsSlider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 15
        slider.maximumTrackTintColor = .specialLightBrown
        slider.minimumTrackTintColor = .specialGreen
        slider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
     let repsSlider: UISlider = {
        let slider = UISlider()
         slider.minimumTrackTintColor = .specialGreen
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.maximumTrackTintColor = .specialLightBrown
        slider.minimumTrackTintColor = .specialGreen
        slider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
         slider.translatesAutoresizingMaskIntoConstraints = false
         return slider
    }()
    
    let timeSlider: UISlider = {
        let slider = UISlider()
         slider.minimumValue = 0
         slider.maximumValue = 300
         slider.maximumTrackTintColor = .specialLightBrown
         slider.minimumTrackTintColor = .specialGreen
         slider.addTarget(self, action: #selector(timeSliderChanged), for: .valueChanged)
         slider.translatesAutoresizingMaskIntoConstraints = false
         return slider
    }()
    
    @objc private func setsSliderChanged(){
        countOfSetLabel.text = "\(Int(setsSlider.value))"
    }
    
    @objc private func repsSliderChanged(){
        countOfRepsLabel.text = "\(Int(repsSlider.value))"
        setActive(label: repsLabel, numberLabel: countOfRepsLabel, slider: repsSlider)
        setNegative(label: timerLabel, numberLabel: countOfTimeLabel, slider: timeSlider)
    }
    
    @objc private func timeSliderChanged(){
        let (min,sec) = {(secs: Int) -> (Int,Int) in
            return (secs  / 60, secs % 60) }(Int(timeSlider.value))
        countOfTimeLabel.text = (sec != 0 ? "\(min) min \(sec) sec" : "\(min) min")
        setNegative(label: repsLabel, numberLabel: countOfRepsLabel, slider: repsSlider)
        setActive(label: timerLabel, numberLabel: countOfTimeLabel, slider: timeSlider)
    }
    
    private func setActive(label: UILabel, numberLabel: UILabel , slider: UISlider){
        label.alpha = 1
        numberLabel.alpha = 1
        slider.alpha = 1
    }
    private func setNegative(label: UILabel, numberLabel: UILabel , slider: UISlider){
        label.alpha = 0.5
        numberLabel.alpha = 0.5
        slider.alpha = 0.5
        slider.value = 0
        numberLabel.text = "0"
    }
    
    var setsStackView = UIStackView()
    var repsStackView = UIStackView()
    var timerStackView = UIStackView()
    
    private func setupView(){
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        setsStackView = UIStackView(arrangedSubviews: [setLabel,countOfSetLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        repsStackView = UIStackView(arrangedSubviews: [repsLabel,countOfRepsLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        timerStackView = UIStackView(arrangedSubviews: [timerLabel,countOfTimeLabel], axis: .horizontal, spacing: 10)
        addSubview(setsStackView)
        addSubview(repsStackView)
        addSubview(timerStackView)
        addSubview(setsSlider)
        addSubview(timeSlider)
        addSubview(repsSlider)
        addSubview(chooseLabel)
    }
    
    private func setConstrains(){
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            setsStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            setsSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 5),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            setsSlider.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            chooseLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 10),
            chooseLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            chooseLabel.widthAnchor.constraint(equalToConstant: 150),
            chooseLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: chooseLabel.bottomAnchor, constant: 5),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            repsStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 5),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            repsSlider.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 5),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            timerStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            timeSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 5),
            timeSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            timeSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            timeSlider.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
}
