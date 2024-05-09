//
//  AddViewController.swift
//  WordList
//
//  Created by Honoka Nishiyama on 2024/05/08.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String,String>] = []
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        AddViewControllerにUserDeafaultsから配列を読み込む
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String,String>]
        }
    }
    
    @IBAction func saveWord(){
//        単語が入力されているときだけ保存できるようにする
        // TextFieldに入力されている文字がないとき””を代入
        let english = englishTextField.text ?? ""
        let japanese = japaneseTextField.text ?? ""
        
        if english.isEmpty || japanese.isEmpty {
            let alert = UIAlertController(title: "保存できません", message: "単語を入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            
            let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
            
            wordArray.append(wordDictionary)
            saveData.set(wordArray, forKey: "WORD")
            
            let alert = UIAlertController(title: "保存完了", message: "単語の登録が完了しました", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
            englishTextField.text = ""
            japaneseTextField.text = ""
            
        }
    }
}
