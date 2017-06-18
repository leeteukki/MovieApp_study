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
        
        //주어진 행에 맞는 데이터 소스를 읽어본다.
        let row = self.list[indexPath.row]
        
        //테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        let title    = cell.viewWithTag(101) as? UILabel
        let desc     = cell.viewWithTag(102) as? UILabel
        let opendate = cell.viewWithTag(103) as? UILabel
        let rating   = cell.viewWithTag(104) as? UILabel
        
        title?.text    = row.title
        desc?.text     = row.description
        opendate?.text = row.openrate
        rating?.text   = "\(row.rating!)"
        
        
        return cell
        
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
    
        }
    
    }
