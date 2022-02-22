//
//  UserModel.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 22.02.2022.
//

import Foundation
import RealmSwift

class UserModel: Object {
    
    @Persisted var userFirstName: String = "User"
    @Persisted var userSecondName: String = "Name"
    @Persisted var userHeight: Int = 0
    @Persisted var userWeight: Int = 0
    @Persisted var userTarget: Int = 0
    @Persisted var userImage: Data?
}
