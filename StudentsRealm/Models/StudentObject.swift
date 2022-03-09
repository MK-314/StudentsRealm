//
// Created by Mikhail Kashkov on 2022-03-08.
//

import Foundation
import RealmSwift

class StudentObject: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var firstName: String
    @Persisted var secondName: String
}
