//
//  TimerView.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 25.01.2022.
//

import UIKit

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
    }
    
    private func setConstraints(){
        
    }
}
