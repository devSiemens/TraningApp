//
//  CalendarCollectionViewCell.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 13.01.2022.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    let dayOfWeekLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "we"
        label.font = .robotoBold16()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    let numberOfDayLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "22"
        label.font = .robotoBold20()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialYellow
                layer.cornerRadius = 10
                dayOfWeekLabel.textColor = .specialBlack
                numberOfDayLabel.textColor = .specialDarkGreen
            } else {
                backgroundColor = .specialGreen
                dayOfWeekLabel.textColor = .white
                numberOfDayLabel.textColor = .white
            }
        }
    }
    
   
    
    override init(frame:CGRect){
        super .init(frame: frame)
        setupViews()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
      addSubview(numberOfDayLabel)
        addSubview(dayOfWeekLabel)
    }
    func cellConfigure(weekArray: [[String]], indexPath: IndexPath) {
        numberOfDayLabel.text = weekArray[1][indexPath.item]
        dayOfWeekLabel.text = weekArray[0][indexPath.item]
    }
    private func setConstraints(){
        NSLayoutConstraint.activate([
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7)
        ])
        NSLayoutConstraint.activate([
            numberOfDayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberOfDayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
    }
}
