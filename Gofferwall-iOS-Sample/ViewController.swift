//
//  ViewController.swift
//  Gofferwall-iOS-Sample
//
//  Created by 심경보 on 1/12/24.
//

import UIKit
import Gofferwall

fileprivate let mediaID = "0"
fileprivate let mediaSecretKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
fileprivate let unitID = "xxxxxxxxxx"

class ViewController: UIViewController {

    @IBOutlet private weak var mediaIDTextField: UITextField!
    @IBOutlet private weak var secretKeyTextField: UITextField!
    private let gofferwall = GofferwallInterface.sharedInstance()! // not recommend: force unwraping
    private let textFont = UIFont.systemFont(ofSize: 12)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        mediaIDTextField.font = textFont
        mediaIDTextField.text   = mediaID
        
        secretKeyTextField.font = textFont
        secretKeyTextField.text = mediaSecretKey
        
        gofferwall.setUserId("test")
        gofferwall.initialize(self)
//        gofferwall.initialize(mediaID, mediaSecret: mediaSecretKey, delegate: self)
//        gofferwall.setUserId("test")
    }

    // MARK: - Events
    @IBAction func showButtonTapped(_ sender: Any) {
        gofferwall.showOfferwall(unitID, delegate: self)
    }
}

extension ViewController: GofferwallDelegate {
    func onInitialized(_ isSuccess: Bool) {
        print("initialized: \(isSuccess)")
    }

    func onOfferwallAdOpened(_ unitID: String!) {
        print("onOfferwallAdOpened: \(unitID!)")
    }
    
    func onOfferwallAdFailed(toShow unitID: String!, error: GofferwallError!) {
        print("onOfferwallAdFailedToShow: \(unitID!), \(error!)")
    }
}
