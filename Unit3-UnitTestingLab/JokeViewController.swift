//
//  ViewController.swift
//  Unit3-UnitTestingLab
//
//  Created by Liubov Kaper  on 12/4/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var allJokesInfo = [JokeComponents]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        
    }
    func loadData() {
        let filename = "jokes"
        let ext  = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        allJokesInfo = JokeComponents.getJoke(from: data)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailJokeVC = segue.destination as? DetailJokeViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("error")
        }
        let jokeInfo = allJokesInfo[indexPath.row]
        detailJokeVC.jokeWhole = jokeInfo
    }

}

extension JokeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allJokesInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        let allJokes = allJokesInfo[indexPath.row]
        cell.textLabel?.text = allJokes.setup
        cell.textLabel?.numberOfLines = 0
        return cell
        
    }
    
    
}

