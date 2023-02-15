//
//  ViewController.swift
//  SimplerTest
//
//  Created by John on 15/02/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func tapped() {
        ModalTestViewController.show()
    }
    
    init() {
        super.init(nibName: "ViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
}
