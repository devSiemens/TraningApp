//
//  WorkoutModel.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 20.01.2022.
//

import Foundation
import RealmSwift

class WorkoutModel: Object {
    @Persisted var workoutDate : Date
    @Persisted var workoutNumberOfDay: Int = 0
    @Persisted var workoutName: String = "Unknow"
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSet: Int = 0
    @Persisted var workoutReps: Int = 0
    @Persisted var workoutTimer: Int = 0
    @Persisted var workoutImage: Data?
    @Persisted var statusButton: Bool = false
    
}
