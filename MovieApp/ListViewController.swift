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
        ("다크나이트", "영웅물에 철학에 음악까지 더해서 예술이 되다", "2008-09-04", 8.95, "darknight.jpg"),
        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31, "rain.jpg"),
        ("말할 수 없는 비밀", "여기서 너까지 다섯걸음", "2015-05-07", 9.19, "secret.jpg")
    ]
    
    lazy var list : [MovieVO] = {
        
        var datalist = [MovieVO]()
        
        for (title, desc, opendate, rating, thumbnail) in self.dataset {
            let mvo = MovieVO()
            
            mvo.title       = title
            mvo.description = desc
            mvo.openrate    = opendate
            mvo.rating      = rating
            mvo.thumbnail   = thumbnail
            
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        cell.title?.text     = row.title
        cell.desc?.text      = row.description
        cell.opendate?.text  = row.openrate
        cell.rating?.text    = "\(row.rating!)"
        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
        return cell
        
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
    
        }
    
    }
