//
//  ViewController.swift
//  PaulTheTutor
//
//  Created by Aryan Khadiri on 4/14/20.
//  Copyright © 2020 AryanKhadiri@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    
    
    override func viewDidAppear(_ animated: Bool) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addButton.layer.cornerRadius = CGFloat(exactly: 8) ?? 0
        subButton.layer.cornerRadius = CGFloat(exactly: 8) ?? 0
        
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let button = sender as? UIButton
        let questionType = button?.titleLabel?.text
        let quizViewController = segue.destination as! QuizViewController
        quizViewController.questionType = questionType ?? ""
        
    }


}

