//
//  ViewController.swift
//  Project1_HackingWithSwift
//
//  Created by macbook-estagio on 27/02/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm View"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        
        print("fileManager -> ",fileManager)
        print("path -> ",path,"\n\n")
        
        for item in items {
            if item.hasPrefix("nssl") {
                print(item)
                pictures.append(item)
            }
        }
        
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.accessoryType = .checkmark
        print(indexPath.row)
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            if let navigationController = navigationController {
                navigationController.pushViewController(vc, animated: true)
            }
        }
    }

}

