//
//  TimeStartWorkoutViewController.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 25.01.2022.
//

import UIKit

class TimeStartWorkoutViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        setTimerWorkoutParameters()
        setDeligate()
        addTaps()
    }
    override func viewDidLayoutSubviews() {
        animationCircular()
    }
    private func setupView(){
        view.backgroundColor = .specialBackground
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(ellipseImage)
        view.addSubview(detailsLabel)
        view.addSubview(timerView)
        view.addSubview(finishButton)
        view.addSubview(timerLabel)
    }
    
    private func setDeligate() {
        timerView.cellNextTimeDeligate = self 
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
    
    private let ellipseImage : UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "Ellipse")
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
    private let timerLabel : UILabel = {
       let label = UILabel()
        label.text = "01:30"
        label.textColor = .specialGray
        label.font = .robotoBold36()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
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
        timer.invalidate()
    }
    
    @objc private func closeButtonTap() {
        dismiss(animated: true, completion: nil)
        timer.invalidate()
    }
    
    private let timerView = TimerView()
    
    private var numberOfSet = 0
    
    private func setTimerWorkoutParameters() {
        timerView.traningLabel.text = workoutModel.workoutName
        timerView.numberSetLabel.text = "\(numberOfSet) / \(workoutModel.workoutSet)"

        let (min,sec) = {(secs: Int) -> (Int,Int) in
            return (secs  / 60, secs % 60) }(workoutModel.workoutTimer)
        if sec / 10 < 1 {
            timerLabel.text = "\(min):0\(sec)"
        }else{
            timerLabel.text = "\(min):\(sec)"
        }
        timerView.numberTimeLabel.text = "\(min) min \(sec) sec"
        durationTimer = workoutModel.workoutTimer
    }
    var timer = Timer()
    var durationTimer = 5
    let shapeLayer = CAShapeLayer()
    
    private func addTaps() {
        let tapLabel = UITapGestureRecognizer(target: self, action: #selector(tapLabel))
        timerLabel.isUserInteractionEnabled = true
        timerLabel.addGestureRecognizer(tapLabel)
    }
    
    @objc private func tapLabel() {
            timerView.editingButton.isEnabled = false
            timerView.nextSetButton.isEnabled = false
            if numberOfSet == workoutModel.workoutSet {
                okAlert(title: "Finish", massage: "Your traning is end")
            }else {
                basicAnimation()
                timer = Timer.scheduledTimer(timeInterval: 1,
                                             target: self,
                                             selector: #selector(timerAction),
                                             userInfo: nil,
                                             repeats: true)
        }
    }
    
    
    @objc private func timerAction() {
            if durationTimer != 0 {
                        durationTimer -= 1
            }
            print(durationTimer)
        
            if durationTimer == 0 {
                timer.invalidate()
                durationTimer = workoutModel.workoutTimer
                numberOfSet += 1
                timerView.numberSetLabel.text = "\(numberOfSet)/\(workoutModel.workoutSet)"
                timerView.editingButton.isEnabled = true
                timerView.nextSetButton.isEnabled = true
            }
            let (min,sec) = {(secs: Int) -> (Int,Int) in
                return (secs  / 60, secs % 60) }(durationTimer)
        if sec / 10 < 1 {
                timerLabel.text = "\(min):0\(sec)"
            }else{
                timerLabel.text = "\(min):\(sec)"
        }
    }
    
    var workoutModel = WorkoutModel()
    let customAlert = CustomAlert()
}
//MARK: - Animation
extension TimeStartWorkoutViewController{
    private func animationCircular(){
        
        let center = CGPoint(x: ellipseImage.frame.width / 2, y: ellipseImage.frame.height / 2)
        let endAngle = (-CGFloat.pi / 2)
        let startAngle = 2 * CGFloat.pi + endAngle
        
        let circularPath = UIBezierPath(arcCenter: center,
                                        radius: 115,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: false)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 21
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = .round
        shapeLayer.strokeColor = UIColor.specialGreen.cgColor
        ellipseImage.layer.addSublayer(shapeLayer)
        
    }
    
    private func basicAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(durationTimer)
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = true
        shapeLayer.add(basicAnimation, forKey: "basic animation")
    }
}
    //MARK: -NextTimeSetProtocol
extension TimeStartWorkoutViewController: NextTimeSetProtocol{
    func edditingTimerTapped() {
        customAlert.alertCustom(viewController: self,repsOrTimer: "Timer of set (in sec)") { [self] sets, timer in
            if sets != "" && timer != "" {
            timerView.numberSetLabel.text = "\(numberOfSet)/\(sets)"
            let (min,sec) = {(secs: Int) -> (Int,Int) in
                return (secs  / 60, secs % 60) }(workoutModel.workoutTimer)
            timerView.numberTimeLabel.text = "\(min) min \(sec) sec"
                if sec / 10 < 1 {
                    timerLabel.text = "\(min):0\(sec)"
                }else{
                    timerLabel.text = "\(min):\(sec)"
            }
            guard let numberOfSets = Int(sets) else { return }
            guard let timeOfSet = Int(timer) else { return }
            
            RealmManager.shared.updateSetsTimerWorkoutModel(model: workoutModel, sets: numberOfSets, time: timeOfSet)
            }
        }
    }
    
    func nextTimeSetTapped() {
        if numberOfSet < workoutModel.workoutSet{
            numberOfSet += 1
            timerView.numberSetLabel.text = "\(numberOfSet) / \(workoutModel.workoutSet)"
        }else{
            okAlert(title: "Finish", massage: "Your traning is end")
        }
      }
    }


//MARK: -setConstraints
extension TimeStartWorkoutViewController{
    
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
            ellipseImage.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 30),
            ellipseImage.heightAnchor.constraint(equalToConstant: 250),
            ellipseImage.widthAnchor.constraint(equalToConstant: 250),
            ellipseImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: ellipseImage.bottomAnchor, constant: 5),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsLabel.heightAnchor.constraint(equalToConstant: 30),
            detailsLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 0),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 15),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55),
        ])
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: ellipseImage.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: ellipseImage.centerYAnchor),
            timerLabel.heightAnchor.constraint(equalToConstant: 50),
            timerLabel.widthAnchor.constraint(equalToConstant: 245)
        ])
    }
}

