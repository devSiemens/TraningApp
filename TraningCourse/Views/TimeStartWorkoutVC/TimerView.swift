//
//  TimerView.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 25.01.2022.
//

import UIKit

protocol NextTimeSetProtocol : AnyObject {
    func nextTimeSetTapped()
    func edditingTimerTapped()
}

class TimerView : UIView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = .specialBrown
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        addSubview(traningLabel)
        addSubview(nextSetButton)
        addSubview(editingButton)
        addSubview(subRepsLineView)
        addSubview(subSetsLineView)
        
        repsStackView = UIStackView(arrangedSubviews: [repsLabel,numberTimeLabel],
                    axis: .horizontal,
                    spacing: 10)
        setStackView = UIStackView(arrangedSubviews: [setLabel,numberSetLabel],
                    axis: .horizontal,
                    spacing: 10)
        addSubview(setStackView)
        addSubview(repsStackView)
        
    }
    var setStackView = UIStackView()
    var repsStackView = UIStackView()
    
     let traningLabel: UILabel = {
       let label = UILabel()
        label.text = "Name of traning"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let nextSetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT SET", for: .normal)
        button.tintColor = .specialGray
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.9409481883, green: 0.7504605055, blue: 0, alpha: 1)
        button.titleLabel?.font = .robotoMedium14()
        button.addTarget(self, action: #selector(nextSetButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
     let editingButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "editing")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("Editing", for: .normal)
        button.imageView?.tintColor = #colorLiteral(red: 0.7746770978, green: 0.7559854388, blue: 0.6989727616, alpha: 1)
        button.tintColor = #colorLiteral(red: 0.7746770978, green: 0.7559854388, blue: 0.6989727616, alpha: 1)
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(editingButtomTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let subRepsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7746770978, green: 0.7559854388, blue: 0.6989727616, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let subSetsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7746770978, green: 0.7559854388, blue: 0.6989727616, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let setLabel: UILabel = {
       let label = UILabel()
        label.text = "Sets"
        label.font = .robotoMedium18()
        label.textColor = #colorLiteral(red: 0.3913812339, green: 0.3912524879, blue: 0.3872336149, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsLabel: UILabel = {
       let label = UILabel()
        label.text = "Time of set"
        label.font = .robotoMedium18()
        label.textColor = #colorLiteral(red: 0.3913812339, green: 0.3912524879, blue: 0.3872336149, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberSetLabel: UILabel = {
       let label = UILabel()
        label.text = "1/4"
        label.font = .robotoMedium24()
        label.textColor = #colorLiteral(red: 0.3913812339, green: 0.3912524879, blue: 0.3872336149, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberTimeLabel: UILabel = {
       let label = UILabel()
        label.text = "1 min 30 sec"
        label.font = .robotoMedium24()
        label.textColor = #colorLiteral(red: 0.3913812339, green: 0.3912524879, blue: 0.3872336149, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    weak var cellNextTimeDeligate: NextTimeSetProtocol?
    let customAlert = CustomAlert()
    
    @objc private func editingButtomTapped(){
        cellNextTimeDeligate?.edditingTimerTapped()
    }
    
    @objc private func nextSetButtonTapped(){
        cellNextTimeDeligate?.nextTimeSetTapped()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            traningLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            traningLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            traningLabel.heightAnchor.constraint(equalToConstant: 40),
            traningLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            nextSetButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            nextSetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nextSetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nextSetButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        NSLayoutConstraint.activate([
            editingButton.bottomAnchor.constraint(equalTo: nextSetButton.topAnchor, constant: -15),
            editingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            editingButton.widthAnchor.constraint(equalToConstant: 80),
            editingButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            subRepsLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            subRepsLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            subRepsLineView.heightAnchor.constraint(equalToConstant: 1),
            subRepsLineView.bottomAnchor.constraint(equalTo: editingButton.topAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            subSetsLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            subSetsLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            subSetsLineView.heightAnchor.constraint(equalToConstant: 1),
            subSetsLineView.bottomAnchor.constraint(equalTo: subRepsLineView.topAnchor, constant: -60)
        ])
        NSLayoutConstraint.activate([
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            repsStackView.bottomAnchor.constraint(equalTo: subRepsLineView.topAnchor, constant: 0),
            repsStackView.heightAnchor.constraint(equalToConstant: 30),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            setStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setStackView.bottomAnchor.constraint(equalTo: subSetsLineView.topAnchor, constant: 0),
            setStackView.heightAnchor.constraint(equalToConstant: 30),
            setStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
