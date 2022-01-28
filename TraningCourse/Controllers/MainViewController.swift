//
//  ViewController.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 13.01.2022.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {

    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vladislav Semenets"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
//    private func mainPresent(){
//        if tableView.visibleCells.isEmpty{
//            noTraningImage.isHidden = false
//            tableView.isHidden = true
//        }else {
//            noTraningImage.isHidden = true
//            tableView.isHidden = false
//        }
//    }
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delaysContentTouches = false
//        tableView.isHidden = true
        return tableView
    }()
    
    private let noTraningImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "NoTraning")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let addWorkoutButton : UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle("Add Workout", for: .normal)
        button.titleLabel?.font = .robotoMedium12()
        button.tintColor = .specialDarkGreen
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 15, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 50, left: -40, bottom: 0, right: 0 )
        button.addShadowOnView()
        button.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "AddTraining"), for: .normal)
        return button
    }()
    private let calendarView = CalendarView()
    private let weatherView = WeatherView()
    private let idWorkoutTableViewCell = "idWorkoutTableViewCell"
    
    private let localRealm = try! Realm()
    private var workoutArray: Results<WorkoutModel>! = nil
    
    override func viewDidLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
    
    private let workoutTodayLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Workout today"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        return label
    }()
    private func setDeligates() {
        tableView.delegate = self
        tableView.dataSource = self
        calendarView.cellCollectionViewDeligate = self
    }
    private func  setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
        view.addSubview(workoutTodayLabel)
        view.addSubview(tableView)
        view.addSubview(noTraningImage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
        setDeligates()
        getWorkouts(date: Date())
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: idWorkoutTableViewCell)
//        mainPresent()
    }

    @objc private func addWorkoutButtonTapped() {
        let newWorkoutViewController = NewWorkoutViewController()
        newWorkoutViewController.modalPresentationStyle = .fullScreen
        present(newWorkoutViewController, animated: true, completion: nil)
    }
    
    private func getWorkouts(date: Date){
        let calendar = Calendar.current
        let formatter = DateFormatter()
        let components = calendar.dateComponents([.weekday,.day,.month,.year], from: date)
        guard let weekday = components.weekday else {return}
        guard let day = components.day else {return}
        guard let month = components.month else {return}
        guard let year = components.year else {return}
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        guard let dateStart = formatter.date(from: "\(year)/\(month)/\(day) 00:00") else {return}
        
        let dateEnd: Date = {
            let components = DateComponents(day: 1, second: -1)
            return Calendar.current.date(byAdding: components, to: dateStart) ?? Date()
        }()
        
        let predicateRepeat = NSPredicate(format: "workoutNumberOfDay = \(weekday) AND workoutRepeat = true" )
        let predicateUnrepeat = NSPredicate(format:"workoutRepeat = false AND workoutDate BETWEEN %@", [dateStart,dateEnd])
        let compound = NSCompoundPredicate(type: .or, subpredicates: [predicateRepeat,predicateUnrepeat])
        
        workoutArray = localRealm.objects(WorkoutModel.self).filter(compound).sorted(byKeyPath: "workoutName")
        tableView.reloadData()
        
    }
}

//MARK: - StartWorkoutProtocol
extension MainViewController: StartWorkoutProtocol{
    func startButtonTapped(model: WorkoutModel) {
     
        if model.workoutTimer == 0 {
            let repsStartWorkoutViewController = RepsStartWorkoutViewController()
            repsStartWorkoutViewController.modalPresentationStyle = .fullScreen
            repsStartWorkoutViewController.workoutModel = model
            present(repsStartWorkoutViewController, animated: true)
        } else{
            let timeStartWorkoutViewController = TimeStartWorkoutViewController()
            timeStartWorkoutViewController.modalPresentationStyle = .fullScreen
            timeStartWorkoutViewController.workoutModel = model
            present(timeStartWorkoutViewController, animated: true)
        }
        
    }
    
    
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workoutArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idWorkoutTableViewCell, for: indexPath) as! WorkoutTableViewCell
        let model = workoutArray[indexPath.row]
        cell.cellConfigure(model: model)
        cell.cellStartWorkoutDeligate = self
        return cell
    }
    
    
}

//MARK: - SelectCollectionViewItemProtocol
extension MainViewController: SelectCollectionViewItemProtocol {
    func selectDate(date: Date) {
        getWorkouts(date: date)
    }
    
    
}
//MARK: -UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "") { _, _, _ in
            let deleteModel = self.workoutArray[indexPath.row]
            RealmManager.shared.deleteWorkoutModel(model: deleteModel)
            tableView.reloadData()
        }
        
        action.backgroundColor = .specialBackground
        action.image = UIImage(named: "delete")
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}


//MARK: - setConstrains
extension MainViewController {
    private func setConstrains(){
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 5),
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherView.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            workoutTodayLabel.topAnchor.constraint(equalTo: addWorkoutButton.bottomAnchor, constant: 10),
            workoutTodayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            workoutTodayLabel.heightAnchor.constraint(equalToConstant: 16),
            workoutTodayLabel.widthAnchor.constraint(equalToConstant: 85)
        ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            noTraningImage.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor, constant: 0),
            noTraningImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            noTraningImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            noTraningImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
        ])
    
        
    }
}
