//
//  ViewController.swift
//  AppLocalization
//
//  Created by Aung Kyaw Phyo on 7/23/22.
//

import UIKit

class DashboardVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    @IBOutlet weak var btnSelectLanguage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Testing".localized()
        lblTitle.text = "Hello There".localized()
        lblBody.text = "My name is cho phoo paing".localized()
        btnSelectLanguage.setTitle("Select Language".localized(), for: .normal)
    }

    @IBAction func onTouchSelectLanguage(_ sender: Any) {
        let localizationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LocalizationVC") as! LocalizationVC
        self.navigationController?.pushViewController(localizationVC, animated: true)
    }
}
