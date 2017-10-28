//
//  RobotsTableViewController.swift
//  AppBundleReader
//
//  Created by Matthew Harrilal on 10/27/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import Foundation
import UIKit

class RobotsTableViewController: UITableViewController {
    var robots = [DecodingRobots]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let fileManager = FileManager.default
        let path = Bundle.main.url(forResource: "robo-profiles", withExtension: ".json")
        
        let dataObject = try! Data(contentsOf: path!)
        let robot = try? JSONDecoder().decode([DecodingRobots].self, from: dataObject)
        self.robots = robot!
        print(self.robots)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return robots.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let robot = robots[indexPath.row]
        cell.textLabel?.text = robot.name
        cell.detailTextLabel?.text = robot.phrase
        
        if let robotImageUrl = robot.image {
            let imageUrl = URL(string: robotImageUrl)
            let dataObject = try! Data(contentsOf: imageUrl!)
            cell.imageView?.image = UIImage(data: dataObject)
        }
        return cell
    }
}
