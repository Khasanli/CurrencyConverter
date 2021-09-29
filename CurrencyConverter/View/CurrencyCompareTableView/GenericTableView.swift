//
//  GenericTableView.swift
//  CurrencyConverter
//
//  Created by Samir Hasanli on 25.09.21.
//

import UIKit

class GenericCompareTableView<T: GenericCompareCell<U>, U>: UITableView, UITableViewDelegate, UITableViewDataSource {
    var cellHeight: CGFloat!
    var items_1 = [U]()
    var items_2 = [U]()
    init(items_1: [U], items_2: [U], cellHeight: CGFloat) {
        self.items_1 = items_1
        self.items_2 = items_2
        super.init(frame: .zero, style: .plain)
        self.delegate = self
        self.dataSource = self
        self.register(T.self, forCellReuseIdentifier: "Cell")
        self.tableFooterView = UIView()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight ?? 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items_1.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GenericCompareCell<U>
        cell.item1 = items_1[indexPath.row]
        cell.item2 = items_2[indexPath.row]
        return cell
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GenericCompareCell<T>: UITableViewCell {
    var item1: T!
    var item2: T!

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
