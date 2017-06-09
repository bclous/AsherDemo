//
//  Client+CoreDataProperties.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/9/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import Foundation
import CoreData


extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client")
    }

    @NSManaged public var name: String?
    @NSManaged public var careTaker: User?
    @NSManaged public var workouts: NSSet?

}

// MARK: Generated accessors for workouts
extension Client {

    @objc(addWorkoutsObject:)
    @NSManaged public func addToWorkouts(_ value: Workout)

    @objc(removeWorkoutsObject:)
    @NSManaged public func removeFromWorkouts(_ value: Workout)

    @objc(addWorkouts:)
    @NSManaged public func addToWorkouts(_ values: NSSet)

    @objc(removeWorkouts:)
    @NSManaged public func removeFromWorkouts(_ values: NSSet)

}
