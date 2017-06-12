//
//  DataStore.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/9/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    static let shared = DataStore()
    var user : User?
    
    override init() {
        super.init()
        fetchUser()
    }
    
    func fetchUser() {
        if userExists() {
            user = CoreDataClient.shared.fetchUser()
        } else {
            createUser()
            user = CoreDataClient.shared.fetchUser()
        }
    }
    
    private func userExists() -> Bool {
        return UserDefaults.standard.value(forKey: "userExists") != nil
    }
    
    private func createUser() {
        UserDefaults.standard.set(true, forKey: "userExists")
        CoreDataClient.shared.createOriginalSampleData()
    }
    
    public func clientsInOrder(user: User) -> [Client] {
        
        let clients = user.clients?.allObjects as! [Client]
        let sortedclients = clients.sorted(by: {$0.name! < $1.name!})
        return sortedclients
    }
    
    public func completedWorkoutsInOrder(client: Client) -> [Workout] {
        let workouts = client.workouts?.allObjects as! [Workout]
        var completedWorkouts : [Workout] = []
        for workout in workouts {
            if workout.isComplete {
                completedWorkouts.append(workout)
            }
        }
        let sortedWorkouts = completedWorkouts.sorted(by: {$0.date < $1.date})
        return sortedWorkouts
    }
    
    public func newWorkout(client: Client) -> Workout? {
        let workouts = client.workouts?.allObjects as! [Workout]
        for workout in workouts {
            if !workout.isComplete {
                return workout
            }
        }
        
        return nil
    }
    
    public func exercisesInOrder(workout: Workout) -> [Exercise] {
        let exercises = workout.exercises?.allObjects as! [Exercise]
        let sortedExercises = exercises.sorted(by: {$0.orderInWorkout < $1.orderInWorkout})
        return sortedExercises
    }
    
    public func setsInOrder(exercise: Exercise) -> [ExerciseSet] {
        let sets = exercise.sets?.allObjects as! [ExerciseSet]
        let sortedSets = sets.sorted(by: {$0.orderInExercise < $1.orderInExercise})
        return sortedSets
        
    }
}


