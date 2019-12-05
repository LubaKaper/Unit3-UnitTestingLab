//
//  StarWarsViewController.swift
//  Unit3-UnitTestingLab
//
//  Created by Liubov Kaper  on 12/4/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var allEpisodesData = [EpisodeData] () {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        tableView.delegate = self 
        
    }
    func loadData() {
        
        let filename = "starWars"
        let ext  = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        allEpisodesData = Episode.getEpisode(for: data)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailStarWarsVC = segue.destination as? DetailStarWarsViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("error")
        }
        let episodeInfo = allEpisodesData[indexPath.row]
        detailStarWarsVC.episodeWhole = episodeInfo
    }
    
    
}

extension StarWarsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allEpisodesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath)
        let allEpisodes = allEpisodesData[indexPath.row]
        cell.textLabel?.text = allEpisodes.title
        cell.backgroundColor = .darkGray
        cell.textLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
