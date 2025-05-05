//
//  ViewController.swift
//  WarCardGame
//
//  Created by terry on 28/4/2021.
//  Copyright © 2021 Marvin. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
                super.viewDidLoad()
             // Do any additional setup after loading the view.
    }

    @IBAction func onclick(_ sender: UIButton) {
            
            let nonEmbeddedViewController = UIHostingController(rootView: ContentView())
            self.navigationController?.pushViewController(nonEmbeddedViewController, animated: true)    }


}
