//
//  CoreDataClient.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/9/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

enum SampleExercise {
    case seatedHipLifts
    case curlUps
    case hipMarches
    case shoulderCircles
}

class CoreDataClient: NSObject {
    
    static let shared = CoreDataClient()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchUser() -> User? {
        do {
            let users = try context.fetch(User.fetchRequest()) as! [User]
            return users[0]
            
        } catch {
            return nil
        }
    }

    func createOriginalSampleData() {
        let user = User(context: context)
        user.name = "Test user"
        
        let client1 = sampleClient(name: "Betty Morgan")
        let client2 = sampleClient(name: "Janet Berry")
        let client3 = sampleClient(name: "Marvin Donaldson")
        
        user.addToClients(client1)
        user.addToClients(client2)
        user.addToClients(client3)
        
        saveContext()
        
    }
    
    func sampleClient(name: String) -> Client {
        let sampleClient = Client(context: context)
        sampleClient.name = name
        sampleClient.addToWorkouts(newWorkout())
        return sampleClient
    }
    
    func newWorkout() -> Workout {
        let workout = Workout(context: context)
        workout.date = NSTimeIntervalSince1970
        workout.isComplete = false
        
        let exercise1 = exerciseFromType(.seatedHipLifts)
        let exercise2 = exerciseFromType(.curlUps)
        let exercise3 = exerciseFromType(.hipMarches)
        let exercise4 = exerciseFromType(.shoulderCircles)
        
        workout.addToExercises(exercise1)
        workout.addToExercises(exercise2)
        workout.addToExercises(exercise3)
        workout.addToExercises(exercise4)
        
        return workout
    }
    
    func exerciseFromType(_ type: SampleExercise) -> Exercise {
        
        let sampleExercise = Exercise(context: context)
        
        switch type {
        case .seatedHipLifts:
            sampleExercise.orderInWorkout = 1
            sampleExercise.suggestedRepsPersSet = 5
            sampleExercise.suggestedTimePerSet = 60
            sampleExercise.name = "Seated Hip Lifts"
            sampleExercise.tip1 = "Back comfortably against the chair"
            sampleExercise.tip2 = "Place your hands on the sides of the chair for support"
            sampleExercise.tip3 = "Breathe in through the nose and out through the mouth"
            sampleExercise.tip4 = "It's ok to hold your knee up with your hands"
            sampleExercise.videoURL = "www.google.com"
            sampleExercise.isLeftRight = true
            sampleExercise.isReps = false
            sampleExercise.isTimed = true
            sampleExercise.numberOfSets = 2
            sampleExercise.videoURL = "puXOYj6sm7Q"
            sampleExercise.repsLabel = "REPS: L + R x 2"
            
            let set1 = seatedHipLiftsSet(isLeft: true, orderInExercise: 1)
            let set2 = seatedHipLiftsSet(isLeft: false, orderInExercise: 2)
            let set3 = seatedHipLiftsSet(isLeft: true, orderInExercise: 3)
            let set4 = seatedHipLiftsSet(isLeft: false, orderInExercise: 4)
            sampleExercise.addToSets(set1)
            sampleExercise.addToSets(set2)
            sampleExercise.addToSets(set3)
            sampleExercise.addToSets(set4)
            
        case .curlUps:
            sampleExercise.orderInWorkout = 2
            sampleExercise.suggestedRepsPersSet = 10
            sampleExercise.suggestedTimePerSet = 60
            sampleExercise.name = "Curl Ups"
            sampleExercise.tip1 = "Lie on your back with knees bent and arms on chest"
            sampleExercise.tip2 = "Lift your shoulders off the ground"
            sampleExercise.tip3 = "Exhale during upward movements"
            sampleExercise.tip4 = "Breath in through nose and out through mouth"
            sampleExercise.videoURL = "www.google.com"
            sampleExercise.isLeftRight = true
            sampleExercise.isReps = false
            sampleExercise.isTimed = true
            sampleExercise.numberOfSets = 2
            sampleExercise.videoURL = "WMvyrrqolJw"
            sampleExercise.repsLabel = "REPS: 10 x 2"
            
            let set1 = curlUpsSet(orderInExercise: 1)
            let set2 = curlUpsSet(orderInExercise: 2)
            sampleExercise.addToSets(set1)
            sampleExercise.addToSets(set2)
        
        case .hipMarches:
            sampleExercise.orderInWorkout = 3
            sampleExercise.suggestedRepsPersSet = 5
            sampleExercise.suggestedTimePerSet = 60
            sampleExercise.name = "Hip Marches"
            sampleExercise.tip1 = "Sit with feet flat on the floor"
            sampleExercise.tip2 = "Place your hands on side of the chair for support"
            sampleExercise.tip3 = "Alternate between left and right leg"
            sampleExercise.tip4 = "Move at a slow to moderate speed"
            sampleExercise.videoURL = "www.google.com"
            sampleExercise.isLeftRight = true
            sampleExercise.isReps = false
            sampleExercise.isTimed = true
            sampleExercise.numberOfSets = 2
            sampleExercise.videoURL = "H5fzXVCTuJM"
            sampleExercise.repsLabel = "REPS: Alternating L+R 10 X 2"
            
            let set = hipMarchingSet(orderinExercise: 1)
            let set2 = hipMarchingSet(orderinExercise: 2)
            sampleExercise.addToSets(set)
            sampleExercise.addToSets(set2)
            
        case .shoulderCircles:
            sampleExercise.orderInWorkout = 4
            sampleExercise.suggestedRepsPersSet = 5
            sampleExercise.suggestedTimePerSet = 60
            sampleExercise.name = "Shoulder Circles"
            sampleExercise.tip1 = "Sit comfortably in a chair"
            sampleExercise.tip2 = "Slowly raise shoulders up and then back down"
            sampleExercise.tip3 = "Breath in on way up, and out way down"
            sampleExercise.tip4 = "Remember to breath"
            sampleExercise.videoURL = "www.google.com"
            sampleExercise.isLeftRight = true
            sampleExercise.isReps = false
            sampleExercise.isTimed = true
            sampleExercise.numberOfSets = 2
            sampleExercise.videoURL = "aefN_VNV3b4"
            sampleExercise.repsLabel = "REPS: 10 X 2"
            
            let set1 = shoulderRollsSet(orderInExercise: 1)
            let set2 = shoulderRollsSet(orderInExercise: 2)
            sampleExercise.addToSets(set1)
            sampleExercise.addToSets(set2)
        }
        
        return sampleExercise
    }
    
    func seatedHipLiftsSet(isLeft: Bool, orderInExercise: Int) -> ExerciseSet {
        let set = ExerciseSet(context: context)
        set.isLeftSide = isLeft
        set.isRightSide = !isLeft
        set.isFullBody = false
        set.isTimed = true
        set.isReps = false
        set.orderInExercise = Int64(orderInExercise)
        set.userTitleHint = "Let's go!"
        return set
    }
    
    func curlUpsSet(orderInExercise: Int) -> ExerciseSet {
        let set = ExerciseSet(context: context)
        set.isFullBody = true
        set.isLeftSide = false
        set.isRightSide = false
        set.isTimed = false
        set.isReps = true
        set.orderInExercise = Int64(orderInExercise)
        set.userTitleHint = "Let's go!"
        return set
    }
    
    func hipMarchingSet(orderinExercise: Int) -> ExerciseSet {
        let set = ExerciseSet(context: context)
        set.isFullBody = true
        set.isLeftSide = false
        set.isRightSide = false
        set.isTimed = false
        set.isReps = true
        set.orderInExercise = Int64(orderinExercise)
        set.userTitleHint = "Let's go!"
        return set
    }
    
    func shoulderRollsSet(orderInExercise: Int) -> ExerciseSet {
        let set = ExerciseSet(context: context)
        set.isFullBody = true
        set.isLeftSide = false
        set.isRightSide = false
        set.isTimed = false
        set.isReps = true
        set.orderInExercise = Int64(orderInExercise)
        set.userTitleHint = "Let's go!"
        return set
    }
    
    func saveContext() {
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
}
