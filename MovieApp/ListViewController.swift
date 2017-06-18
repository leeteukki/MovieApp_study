//
//  ListViewController.swift
//  MovieApp
//
//  Created by Lena Lee on 2017. 6. 18..
//  Copyright © 2017년 Lena Lee. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    
    var dataset = [
        ("다크나이트", "영웅물에 철학에 음악까지 더해서 예술이 되다", "2008-09-04", 8.95),
        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31),
        ("말할 수 없는 비밀", "여기서 너까지 다섯걸음", "2015-05-07", 9.19)
    ]
    
    lazy var list : [MovieVO] = {
        
        var datalist = [MovieVO]()
        
        for (title, desc, opendate, rating) in self.dataset {
            let mvo = MovieVO()
            
            mvo.title       = title
            mvo.description = desc
            mvo.openrate    = opendate
            mvo.rating      = rating
            
            datalist.append(mvo)
        }
        
        return datalist
    }()
    
    override func viewDidLoad() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.list.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = row.title
        
        return cell
        
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
    
        }
    
    }
