//
//  SearchArrayViewController.swift
//  SampleProtocol
//
//  Created by 三浦　登哉 on 2021/02/16.
//

import UIKit

protocol SearchVCDelegate: AnyObject {
    func search(searchResult: [String])
}


class SearchArrayViewController: UIViewController {
    // 処理を任せる相手を保持
    weak var delegate: SearchVCDelegate?
    // 本来は、firestoreからドキュメントを取り、LessonData型に変換した配列
   private var array = ["プ","ロ","ト","コ","ル"]

    @IBOutlet weak var textField: UITextField!

    // 検索ボタンタップ
    @IBAction private func searchBtn(_ sender: Any) {
        guard let searchText = textField.text else { return }
        
        // 検索条件に合致した配列
        let searchResult = array.filter{ $0 == searchText }

        // 検索結果を渡す
        delegate?.search(searchResult: searchResult)
        self.dismiss(animated: true, completion: nil)
    }
}


