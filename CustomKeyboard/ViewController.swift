//
//  ViewController.swift
//
//  Created by Ethan Sarif-Kattan on 09/07/2019.
//  Copyright © 2019 Ethan Sarif-Kattan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
	@IBOutlet weak var instructions: UITextView!
	@IBOutlet weak var dismissKeyboardButton: UIButton!
    
    @IBOutlet weak var tutorialBtn: UIButton!
    
    @IBOutlet weak var settingBtn: UIButton!
    override func viewDidLoad() {
		super.viewDidLoad()
        addSpellIgnoreData()
        
//		instructions.becomeFirstResponder()
	}
	
    @IBAction func settingBtnTapped(_ sender: Any) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "settingVC") as! settingVC
        navigationController?.pushViewController(VC, animated: true)
    }
    @IBAction func tutorialBtnTapped(_ sender: Any) {
        
        print("Hey! Tutorial button is tapped!")
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "tutorialVC") as! tutorialVC
        navigationController?.pushViewController(VC, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
         navigationController?.setNavigationBarHidden(true, animated: animated)
		setupUI()
	}
	
//	@IBAction func dismissKeyboardPressed(_ sender: Any) {
//	instructions.resignFirstResponder()
//	}
    
    func addSpellIgnoreData(){
        if let stringPath = Bundle.main.path(forResource: "data", ofType: "txt")
               {
                 do {
                    let data = try String(contentsOfFile: stringPath, encoding: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
                        let myStrings = data.components(separatedBy: .newlines)
                        for word in myStrings {
                            print(word)
                            UITextChecker.learnWord(word)
                        }
                       
                   } catch {
                       print(error)
                   }

                }
    }
    
	func setupUI(){
        
        tutorialBtn.layer.cornerRadius = 80
        tutorialBtn.layer.borderWidth = 1
        tutorialBtn.layer.borderColor = UIColor.clear.cgColor
        
        settingBtn.layer.cornerRadius = 80
        settingBtn.layer.borderWidth = 1
        settingBtn.layer.borderColor = UIColor.clear.cgColor
        
        
//		instructions.text = """
//		⚫ Open the settings app
//
//		⚫ Go General -> Keyboard -> Keyboards -> Add New Keyboard
//
//		⚫ Add CustomKeyboard
//
//		⚫ Start typing in any app
//
//		⚫ Press 🌐 to switch to the CustomKeyboard keyboard
//
//		⚫ Tap this text to start typing!
//		"""
        
        
	}



}

