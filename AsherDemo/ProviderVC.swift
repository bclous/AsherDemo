//
//  ViewController.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/6/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class ProviderVC: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    var user : User?
    var chosenClient : Client?
    var clients : [Client] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatTableView()
        user = DataStore.shared.user
        if let user = user {
            clients = DataStore.shared.clientsInOrder(user: user)
            mainTableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! ClientVC
        if let client = chosenClient {
            destinationVC.client = client
        }
    }
    

}

extension ProviderVC: UITableViewDelegate, UITableViewDataSource {
    
    func formatTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clientGenericCell", for: indexPath) as! ClientGenericCell
        cell.formatCell(client: clients[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenClient = clients[indexPath.row]
        performSegue(withIdentifier: "individualClientSegue", sender: self)
    }
    
}

