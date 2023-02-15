//
//  ModalTestViewController.swift
//  SimplerTest
//
//  Created by John on 15/02/2023.
//

import UIKit

open class ModalTestViewController: TransitioningModalViewController {
    init() {
        super.init(nibName: "ModalTestViewController", bundle: .main)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        transitioningDelegate = self
    }

    @IBAction func tapped() {
        dismiss(animated: true)
    }
    
    static func show() {
        let modal = ModalTestViewController()
        modal.modalPresentationStyle = .overCurrentContext
        DispatchQueue.main.async {
            UIApplication.shared.delegate?.window??.rootViewController?.present(modal, animated: true)
        }
    }
}
