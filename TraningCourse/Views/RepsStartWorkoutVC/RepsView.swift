//
//  RepsView.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 25.01.2022.
//

import UIKit

class RepsView : UIView {
    
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
    }
    
    private let traningLabel: UILabel = {
       let label = UILabel()
        label.text = "Name of traning"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextSetButton: UIButton = {
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
    
    private let editingButton : UIButton = {
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
    
    @objc private func editingButtomTapped(){
        print("Editing Buttom Tapped")
        
    }
    
    @objc private func nextSetButtonTapped(){
        print("Next Set Button Tapped")
        
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
    }
    
    
}
