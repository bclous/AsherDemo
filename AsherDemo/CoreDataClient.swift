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
    
    let shared = CoreDataClient()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createOriginalData() {
        let user = User(context: context)
        
    }
    
    func userFromFetch() -> User? {
        
    }
    
    func sampleClient(name: String) -> Client {
        let sampleClient = Client(context: context)
        sampleClient.name = name
        return sampleClient
    }
    
    func exerciseFromType(_ type: SampleExercise) {
        
        let sampleExercise = Exercise(context: context)
        
        switch type {
        case .seatedHipLifts:
            sampleExercise.orderInWorkout = 1
            sampleExercise.suggestedRepsPersSet = 5
            sampleExercise.suggestedTimePerSet = 60
            sampleExercise.name = "Seated Hip Lifts"
            sampleExercise.tip1 = "This is tip 1"
            sampleExercise.tip2 = "This is tip 2"
            sampleExercise.tip3 = "This is tip 3"
            sampleExercise.tip4 = "This is tip 4"
            sampleExercise.videoURL = "www.google.com"
            sampleExercise.isLeftRight = true
            sampleExercise.isReps = false
            sampleExercise.isTimed = true
            sampleExercise.numberOfSets = 2
        case .curlUps:
            sampleExercise.orderInWorkout = 1
            sampleExercise.suggestedRepsPersSet = 5
            sampleExercise.suggestedTimePerSet = 60
            sampleExercise.name = "Seated Hip Lifts"
            sampleExercise.tip1 = "This is tip 1"
            sampleExercise.tip2 = "This is tip 2"
            sampleExercise.tip3 = "This is tip 3"
            sampleExercise.tip4 = "This is tip 4"
            sampleExercise.videoURL = "www.google.com"
            sampleExercise.isLeftRight = true
            sampleExercise.isReps = false
            sampleExercise.isTimed = true
            sampleExercise.numberOfSets = 2
        case .hipMarches:
            sampleExercise.orderInWorkout = 1
            sampleExercise.suggestedRepsPersSet = 5
            sampleExercise.suggestedTimePerSet = 60
            sampleExercise.name = "Seated Hip Lifts"
            sampleExercise.tip1 = "This is tip 1"
            sampleExercise.tip2 = "This is tip 2"
            sampleExercise.tip3 = "This is tip 3"
            sampleExercise.tip4 = "This is tip 4"
            sampleExercise.videoURL = "www.google.com"
            sampleExercise.isLeftRight = true
            sampleExercise.isReps = false
            sampleExercise.isTimed = true
            sampleExercise.numberOfSets = 2
        case .shoulderCircles:
            sampleExercise.orderInWorkout = 1
            sampleExercise.suggestedRepsPersSet = 5
            sampleExercise.suggestedTimePerSet = 60
            sampleExercise.name = "Seated Hip Lifts"
            sampleExercise.tip1 = "This is tip 1"
            sampleExercise.tip2 = "This is tip 2"
            sampleExercise.tip3 = "This is tip 3"
            sampleExercise.tip4 = "This is tip 4"
            sampleExercise.videoURL = "www.google.com"
            sampleExercise.isLeftRight = true
            sampleExercise.isReps = false
            sampleExercise.isTimed = true
            sampleExercise.numberOfSets = 2
        }
        
        
    }
    
    

}
