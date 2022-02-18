//
//  RealmManager.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 24.01.2022.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() {}
    
    let localRealm = try! Realm()
    
    func saveWorkoutModel(model:WorkoutModel){
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func updateStatusWorkoutModel(model:WorkoutModel,bool: Bool){
        try! localRealm.write {
            model.statusButton = bool
        }
    }
    
    func updateSetsRepsWorkoutModel(model: WorkoutModel, sets : Int, reps: Int){
        try! localRealm.write{
            model.workoutSet = sets
            model.workoutReps = reps
        }
    }
    
    func updateSetsTimerWorkoutModel(model: WorkoutModel, sets : Int, time: Int){
        try! localRealm.write{
            model.workoutSet = sets
            model.workoutTimer = time
        }
    }

    func deleteWorkoutModel(model:WorkoutModel){
        try! localRealm.write {
            localRealm.delete(model)
        }
    }

}
