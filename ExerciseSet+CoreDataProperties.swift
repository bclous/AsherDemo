//
//  ExerciseSet+CoreDataProperties.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/9/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import Foundation
import CoreData


extension ExerciseSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseSet> {
        return NSFetchRequest<ExerciseSet>(entityName: "ExerciseSet")
    }

    @NSManaged public var isLeftSide: Bool
    @NSManaged public var isRightSide: Bool
    @NSManaged public var isFullBody: Bool
    @NSManaged public var isTimed: Bool
    @NSManaged public var isReps: Bool
    @NSManaged public var timeCompleted: Int64
    @NSManaged public var repsCompleted: Int64
    @NSManaged public var userTitleHint: String?
    @NSManaged public var exercise: Exercise?

}
