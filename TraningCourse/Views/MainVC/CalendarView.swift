//
//  CalendarView.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 13.01.2022.
//

import UIKit

protocol SelectCollectionViewItemProtocol: AnyObject{
    func selectItem(date: Date)
}

class CalendarView: UIView {
        
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        return collectionView
    }()
    private let idCalendarCell = "idCalendarCell"
    
    weak var cellCollectionViewDeligate: SelectCollectionViewItemProtocol?
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
        setConstrains()
        setDeligates()
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        
        addSubview(collectionView)
    }
    private func setDeligates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//MARK: - UICollectionViewDataSource
extension CalendarView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as! CalendarCollectionViewCell
        let dateTimeZone = Date().localDate()
        let weekArray = dateTimeZone.getWeekArray()
        cell.cellConfigure(numberOfDay: weekArray[1][indexPath.item], dayOfWeek: weekArray[0][indexPath.item])
            
        
            if indexPath.item == 6 {
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
            }
            return cell
        }
}

//MARK: - UICollectionViewDelegate
extension CalendarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dateTimeZone = Date().localDate()
        
        switch indexPath.item {
        case 0:
            cellCollectionViewDeligate?.selectItem(date: dateTimeZone.offsetDays(days: 6))
        case 1:
            cellCollectionViewDeligate?.selectItem(date: dateTimeZone.offsetDays(days: 5))
        case 2:
            cellCollectionViewDeligate?.selectItem(date: dateTimeZone.offsetDays(days: 4))
        case 3:
            cellCollectionViewDeligate?.selectItem(date: dateTimeZone.offsetDays(days: 3))
        case 4:
            cellCollectionViewDeligate?.selectItem(date: dateTimeZone.offsetDays(days: 2))
        case 5:
            cellCollectionViewDeligate?.selectItem(date: dateTimeZone.offsetDays(days: 1))
        default:
            cellCollectionViewDeligate?.selectItem(date: dateTimeZone.offsetDays(days: 0))
        }
        
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension CalendarView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 34, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
}
//MARK: - setConstrains
extension CalendarView {
    private func setConstrains(){
        NSLayoutConstraint.activate([
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
