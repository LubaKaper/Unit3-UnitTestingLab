//
//  DetailStarWarsViewController.swift
//  Unit3-UnitTestingLab
//
//  Created by Liubov Kaper  on 12/4/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class DetailStarWarsViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    var episodeWhole: EpisodeData?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

       
    }
    
    func updateUI() {
        guard let episode = episodeWhole else {
            fatalError("episodeWhole is nil, verify prepare for seque")
        }
        navigationItem.title = episode.title
        
        textView.text = episode.openingCrawl
        textView.backgroundColor = .blue
        textView.textColor = .black
    }

}
