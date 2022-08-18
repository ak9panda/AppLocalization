//
//  LocalizationVC.swift
//  AppLocalization
//
//  Created by Aung Kyaw Phyo on 7/23/22.
//

import UIKit

class LocalizationVC: UIViewController {

    @IBOutlet weak var swtEnglish: UISwitch!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var swtMyanmar: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLanguage()
        guard let language = UserDefaults.standard.string(forKey: "language") else {
            swtEnglish.isOn = true
            swtMyanmar.isOn = false
            return
        }
        if language == "en" {
            swtEnglish.isOn = true
            swtMyanmar.isOn = false
        }else if language == "my-MM"{
            swtEnglish.isOn = false
            swtMyanmar.isOn = true
        }
    }

    @IBAction func onSwtChangeEnglish(_ sender: Any) {
        let engSwt = sender as! UISwitch
        swtMyanmar.isOn = !engSwt.isOn
        UserDefaults.standard.set("en", forKey: "language")
        Bundle.setLanguage(lang: "en")
        setLanguage()
    }
    
    @IBAction func onSwtChangeMyanmar(_ sender: Any) {
        let myaSwt = sender as! UISwitch
        swtEnglish.isOn = !myaSwt.isOn
        UserDefaults.standard.set("my-MM", forKey: "language")
        Bundle.setLanguage(lang: "my-MM")
        setLanguage()
    }
    
    fileprivate func setLanguage() {
        navigationItem.title = "Testing".localized()
        lblTitle.text = "Please select language".localized()
    }
}

extension Bundle {
    private static var bundle: Bundle!

    public static func localizedBundle() -> Bundle! {
        if bundle == nil {
            let appLang = UserDefaults.standard.string(forKey: "language") ?? "en"
            let path = Bundle.main.path(forResource: appLang, ofType: "lproj")
            bundle = Bundle(path: path!)
        }

        return bundle;
    }

    public static func setLanguage(lang: String) {
        UserDefaults.standard.set(lang, forKey: "language")
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        bundle = Bundle(path: path!)
    }
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.localizedBundle(), value: "", comment: "")
    }

    func localizeWithFormat(arguments: CVarArg...) -> String{
        return String(format: self.localized(), arguments: arguments)
    }
}
