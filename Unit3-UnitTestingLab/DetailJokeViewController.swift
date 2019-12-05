//
//  DetailJokeViewController.swift
//  Unit3-UnitTestingLab
//
//  Created by Liubov Kaper  on 12/4/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class DetailJokeViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    var jokeWhole: JokeComponents?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatUI()
    }
    
    func updatUI() {
        guard let joke = jokeWhole else {
            fatalError("jokeWhole is nil, verify prepare for seque")
        }
        navigationItem.title = joke.setup
        textView.text = joke.punchline
    }
    
    
}
