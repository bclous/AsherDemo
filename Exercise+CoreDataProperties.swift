//
//  Exercise+CoreDataProperties.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/9/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var name: String?
    @NSManaged public var isLeftRight: Bool
    @NSManaged public var numberOfSets: Bool
    @NSManaged public var isTimed: Bool
    @NSManaged public var isReps: Bool
    @NSManaged public var suggestedTimePerSet: Int64
    @NSManaged public var suggestedRepsPersSet: Int64
    @NSManaged public var videoURL: String?
    @NSManaged public var tip1: String?
    @NSManaged public var tip2: String?
    @NSManaged public var tip3: String?
    @NSManaged public var tip4: String?
    @NSManaged public var workout: Workout?
    @NSManaged public var sets: NSSet?

}

// MARK: Generated accessors for sets
extension Exercise {

    @objc(addSetsObject:)
    @NSManaged public func addToSets(_ value: ExerciseSet)

    @objc(removeSetsObject:)
    @NSManaged public func removeFromSets(_ value: ExerciseSet)

    @objc(addSets:)
    @NSManaged public func addToSets(_ values: NSSet)

    @objc(removeSets:)
    @NSManaged public func removeFromSets(_ values: NSSet)

}
