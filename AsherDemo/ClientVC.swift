//
//  ClientVC.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/6/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class ClientVC: UIViewController {
    
    var client : Client?
    @IBOutlet weak var mainTableView: UITableView!
    var clientWorkouts : [Workout] = []
    var todayWorkout : Workout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let client = client {
            clientWorkouts = DataStore.shared.completedWorkoutsInOrder(client: client)
            todayWorkout = DataStore.shared.newWorkout(client: client)
        }
        mainTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "workoutSegue" {
            let destinationVC = segue.destination as! WorkoutVC
            destinationVC.workout = todayWorkout
    
        }
    }
    @IBAction func tempButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "workoutSegue", sender: nil)
    }
  
}

extension ClientVC: UITableViewDataSource, UITableViewDelegate {
    
    func formatTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: "ClientDetailCell", bundle: nil), forCellReuseIdentifier: "clientCell")
        mainTableView.register(UINib(nibName: "WorkoutCell", bundle: nil), forCellReuseIdentifier: "todayWorkoutCell")
        mainTableView.register(UINib(nibName: "PastWorkoutCell", bundle: nil), forCellReuseIdentifier: "pastWorkoutCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : clientWorkouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "clientCell") as! ClientDetailCell
                // format cell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "todayWorkoutCell") as! WorkoutCell
                // format cell
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "pastWorkoutCell") as! PastWorkoutCell
            // cell.workout = clientWorkouts.count
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section != 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return indexPath.row == 0 ? 120 : 250
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    
}
