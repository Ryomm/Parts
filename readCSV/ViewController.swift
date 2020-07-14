//
//  ViewController.swift
//  readCSV
//
//  Created by 松阪僚子 on 2020/06/25.
//  Copyright © 2020 Ryoko.M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var csvLines = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("始めるよ")
        
        guard let path = Bundle.main.path(forResource:"dataList",ofType: "csv") else {
            print("csvファイルがないよ")
            return
        }
        do {
            //文字列に変換
            let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            //改行で配列にする
            csvLines = csvString.components(separatedBy: .newlines)
            //最後の行で改行がないので消す
            csvLines.removeLast()
        } catch let error as NSError {
            print("エラー: \(error)")
            return
        }
        
        for accData in csvLines {
            //スペースで配列を区切る
            let accDetail = accData.components(separatedBy: "    ")
            print("時間： \(accDetail[0]) 、x軸： \(accDetail[1]) 、y軸： \(accDetail[2]) 、z軸： \(accDetail[3])")
            
        }
        
    }


}

