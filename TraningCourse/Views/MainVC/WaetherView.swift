//
//  WaetherView.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 14.01.2022.
//

import UIKit

class WeatherView:UIView {
    
    private let weatherImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.textColor = .specialDarkGreen
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let workoutLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelOfAdvice: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        label.font = .robotoMedium12()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupViews() {
        addSubview(weatherImageView)
        addSubview(label)
        addSubview(labelOfAdvice)
       
        backgroundColor = .specialBackground
        addShadowOnView()
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstrains(){
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor, constant: -5),
            label.bottomAnchor.constraint(equalTo: labelOfAdvice.topAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            labelOfAdvice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelOfAdvice.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            labelOfAdvice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90)
        ])
        NSLayoutConstraint.activate([
            weatherImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            weatherImageView.widthAnchor.constraint(equalToConstant: 60),
            weatherImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
