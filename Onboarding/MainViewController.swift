//
//  ViewController.swift
//  Onboarding
//
//  Created by Bo LeGrand on 4/23/21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let vc = OnboardingViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
        
    }


}
