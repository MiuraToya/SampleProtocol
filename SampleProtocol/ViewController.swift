//
//  ViewController.swift
//  SampleProtocol
//
//  Created by 三浦　登哉 on 2021/02/16.
//

import UIKit

final class ViewController: UIViewController {
    
    private var array = ["プ","ロ","ト","コ","ル"]
    
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func toSearchBtn(_ sender: Any) {
       // ストーリーボードのControllerでインスタンスを作成
        guard let searchVC = UIStoryboard(name: "SearchArray", bundle: nil).instantiateInitialViewController() as? SearchArrayViewController else {return}
        searchVC.delegate = self
        self.present(searchVC, animated: true, completion: nil)
    }
    @IBAction func ClearBtn(_ sender: Any) {
        array = ["プ","ロ","ト","コ","ル"]
        tableView.reloadData()
    }
    
}


extension ViewController: UITableViewDelegate {}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
}


extension ViewController: SearchVCDelegate {
    func search(searchResult: [String]) {
        // 引数に代入された検索結果をtableViewに表示されるarrayに代入
        array = searchResult
        // 更新
        tableView.reloadData()
        }
}
