//
//  StatisticTableViewCell.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 19.02.2022.
//

import UIKit

class StatisticTableViewCell: UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = .clear
        selectionStyle = .none 
        addSubview(traningLabel)
        beforeNowStack = UIStackView(arrangedSubviews: [beforeLabel,nowLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        addSubview(beforeNowStack)
        addSubview(resultLabel)
    }
    
    func cellConfigure(differenceWorkout: DifferenceWorkout) {
        traningLabel.text = differenceWorkout.name
        beforeLabel.text = "Before: \(differenceWorkout.firstReps)"
        nowLabel.text = "Now: \(differenceWorkout.lastReps)"
        
        let difference = differenceWorkout.lastReps - differenceWorkout.firstReps
        resultLabel.text = "\(difference)"
        
        switch difference {
        case ..<0: resultLabel.textColor = .specialGreen
        case 1...: resultLabel.textColor = .specialYellow
        default:
            resultLabel.textColor = .specialGray
        }
    }
    
    var beforeNowStack = UIStackView()
    
    private var traningLabel: UILabel = {
       let label = UILabel()
        label.text = "Biceps"
        label.font = .robotoMedium24()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var beforeLabel: UILabel = {
       let label = UILabel()
        label.text = "Before: 18"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nowLabel: UILabel = {
       let label = UILabel()
        label.text = "Now: 22"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private  let resultLabel: UILabel = {
       let label = UILabel()
        label.text = "+3"
        label.textColor = .specialGreen
        label.font = .robotoMedium24()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            traningLabel.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            traningLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            traningLabel.heightAnchor.constraint(equalToConstant: 30),
            traningLabel.widthAnchor.constraint(equalToConstant: 75)
        ])
        NSLayoutConstraint.activate([
            beforeNowStack.topAnchor.constraint(equalTo: traningLabel.bottomAnchor, constant: 1),
            beforeNowStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            resultLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            resultLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
