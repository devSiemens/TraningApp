//
//  StatisticViewController.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 18.01.2022.
//

import UIKit

class StatisticViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        setDeligate()
        staticTableView.register(StatisticTableViewCell.self, forCellReuseIdentifier: idStaticTableView)
    }
    
    private func setupView(){
        view.backgroundColor = .specialBackground
        view.addSubview(statisticsLabel)
        view.addSubview(segment)
        view.addSubview(staticTableView)
        view.addSubview(exercisesLabel)
    }
    
    private let idStaticTableView = "idStaticTableView"
   
    private let segment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Week","Month"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.backgroundColor = .specialGreen
        segment.selectedSegmentTintColor = .specialYellow
        segment.selectedSegmentIndex = 0
        segment.addShadowOnView()
        let font = UIFont(name: "Roboto-Medium", size: 16)
        segment.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                                 NSAttributedString.Key.foregroundColor: UIColor.white],
                                                for: .normal)
        segment.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                                 NSAttributedString.Key.foregroundColor: UIColor.specialGray],
                                                for: .selected)
        segment.addTarget(self, action: #selector(segmentTapped(_:)), for: .valueChanged)
        return segment
    }()
    
    
    @objc private func segmentTapped(_ segmentedControl: UISegmentedControl){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("week segment tapped")
        case 1:
            print("month segment tapped")
        default:
            print("none segment")
        }
    }
    private let exercisesLabel: UILabel = {
       let label = UILabel()
        label.text = "Exercises"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let staticTableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delaysContentTouches = false
        return tableView
    }()
    
    private func setDeligate(){
        staticTableView.delegate = self
        staticTableView.dataSource = self
    }
    
    private let statisticsLabel: UILabel = {
       let label = UILabel()
        label.text = "STATISTICS"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func setConstraints(){
        NSLayoutConstraint.activate([
            statisticsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            statisticsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            statisticsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            statisticsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            segment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            segment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            segment.heightAnchor.constraint(equalToConstant: 35),
            segment.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 35)
        ])
        NSLayoutConstraint.activate([
            exercisesLabel.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 10),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            exercisesLabel.widthAnchor.constraint(equalToConstant: 120),
            exercisesLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            staticTableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 3),
            staticTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            staticTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            staticTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

//MARK: - UITableViewDataSource
extension StatisticViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idStaticTableView, for: indexPath) as! StatisticTableViewCell
        return cell
    }
}
//MARK: - UITableViewDelegate
extension StatisticViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}
