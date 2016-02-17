//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        
    }
    
    @IBAction func returnButton(sender: UIButton) {
        textDocumentProxy.insertText("\n")
    }
    
    @IBAction func deleteButton(sender: UIButton) {
        textDocumentProxy.deleteBackward()
    }
    
    @IBAction func test3Button(sender: UIButton) {
        textDocumentProxy.insertText("(-‿‿-)")
    }

    @IBAction func test1Button(sender: UIButton) {
        textDocumentProxy.insertText("(´∀｀*)")
    }
    
    @IBAction func test2Button(sender: UIButton) {
        textDocumentProxy.insertText("(*^ω^)")
    }
    
    @IBAction func test4Button(sender: UIButton) {
        textDocumentProxy.insertText("☆*:.｡.o(≧▽≦)o.｡.:*☆")
    }
    
    @IBAction func test5Button(sender: UIButton) {
        textDocumentProxy.insertText("(*≧ω≦*)")
    }
    
    @IBAction func test6Button(sender: UIButton) {
        var c = String(UnicodeScalar(0x1F64F))
        for i in 0x1F601...0x1F64F {
            c = String(UnicodeScalar(i))
            let diceRoll = Int(arc4random_uniform(6) + 1)
            if (diceRoll % 2 == 0){
                textDocumentProxy.insertText(c)
                return
            }
        }
        textDocumentProxy.insertText(c)
    }
}
