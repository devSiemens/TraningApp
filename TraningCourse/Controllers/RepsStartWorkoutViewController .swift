//
//  RepsStartWorkoutViewController .swift
//  TraningCourse
//
//  Created by Владислав Семенец on 25.01.2022.
//

import UIKit

class RepsStartWorkoutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        setRepsWorkoutParameters()
        setDeligate()
    }
    
    private func setupView(){
        view.backgroundColor = .specialBackground
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(sportsmanImage)
        view.addSubview(detailsLabel)
        view.addSubview(repsView)
        view.addSubview(finishButton)
    }
    
    private func setDeligate() {
        repsView.cellNextDeligate = self
    }
    
    private let startWorkoutLabel: UILabel = {
       let label = UILabel()
        label.text = "START WORKOUT"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton : UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(named: "CloseButton"), for: .normal)
        button.layer.cornerRadius = button.frame.height/2
        button.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let sportsmanImage : UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "sportsman")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let detailsLabel: UILabel = {
       let label = UILabel()
        label.text = "Details"
        label.textColor = #colorLiteral(red: 0.761189878, green: 0.7422975898, blue: 0.6815395951, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FINISH", for: .normal)
        button.tintColor = .specialBackground
        button.titleLabel?.font = .robotoBold16()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .specialGreen
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func finishButtonTapped() {
        if numberOfSet == workoutModel.workoutSet {
            dismiss(animated: true)
            RealmManager.shared.updateStatusWorkoutModel(model: workoutModel, bool: true)
        }else{
            canselOkAlert(title: "Warning", massage: "Your traning isn't finished") {
                self.dismiss(animated: true)
            }
        }
    }
    
    @objc private func closeButtonTap() {
        dismiss(animated: true, completion: nil)
    }
    
    private var numberOfSet = 0
    
    private func setRepsWorkoutParameters() {
        repsView.traningLabel.text = workoutModel.workoutName
        repsView.numberSetLabel.text = "\(numberOfSet) / \(workoutModel.workoutSet)"
        repsView.numberRepsLabel.text = "\(workoutModel.workoutReps)"
    }
    
    private let repsView = RepsView()
    
    var workoutModel = WorkoutModel()
    let customAlert = CustomAlert()
}
extension RepsStartWorkoutViewController:NextSetProtocol{
    func edditingTapped() {
        customAlert.alertCustom(viewController: self,repsOrTimer: "Reps") { [self] sets, reps in
            if sets != "" && reps != "" {
            repsView.numberSetLabel.text = "\(numberOfSet)/\(sets)"
            repsView.numberRepsLabel.text = reps
            guard let numberOfSets = Int(sets) else { return }
            guard let numberOfReps = Int(reps) else { return }
            RealmManager.shared.updateSetsRepsWorkoutModel(model: workoutModel, sets: numberOfSets, reps: numberOfReps)
            }
        }
    }
    
    func nextSetTapped() {
        if numberOfSet < workoutModel.workoutSet{
            numberOfSet += 1
            repsView.numberSetLabel.text = "\(numberOfSet) / \(workoutModel.workoutSet)"
        }else{
            okAlert(title: "Finish", massage: "Your traning is end")
        }
    }
}
    //MARK: -setConstraints
    extension RepsStartWorkoutViewController{
        private func setConstraints(){
            NSLayoutConstraint.activate([
                startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
                startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                startWorkoutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                startWorkoutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
            NSLayoutConstraint.activate([
                closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
                closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                closeButton.heightAnchor.constraint(equalToConstant: 30),
                closeButton.widthAnchor.constraint(equalToConstant: 30)
            ])
            NSLayoutConstraint.activate([
                sportsmanImage.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 30),
                sportsmanImage.heightAnchor.constraint(equalToConstant: 300),
                sportsmanImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 95),
                sportsmanImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -95)
            ])
            NSLayoutConstraint.activate([
                detailsLabel.topAnchor.constraint(equalTo: sportsmanImage.bottomAnchor, constant: 5),
                detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                detailsLabel.heightAnchor.constraint(equalToConstant: 30),
                detailsLabel.widthAnchor.constraint(equalToConstant: 60)
            ])
            NSLayoutConstraint.activate([
                repsView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 0),
                repsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                repsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                repsView.heightAnchor.constraint(equalToConstant: 300)
            ])
            NSLayoutConstraint.activate([
                finishButton.topAnchor.constraint(equalTo: repsView.bottomAnchor, constant: 15),
                finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                finishButton.heightAnchor.constraint(equalToConstant: 55),
            ])
        }
    }
    

