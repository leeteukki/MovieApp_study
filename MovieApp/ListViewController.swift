//
//  ListViewController.swift
//  MovieApp
//
//  Created by Lena Lee on 2017. 6. 18..
//  Copyright © 2017년 Lena Lee. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    
    var list = [MovieVO]()
    
    override func viewDidLoad() {
        var mvo = MovieVO()
        
        mvo.title       = "다크나이트"
        mvo.description = "영웅물에 철학에 음악까지 더해져 예술이되다"
        mvo.openrate    = "2008-09-04"
        mvo.rating      = 8.95
        
        
        self.list.append(mvo)
        
        mvo = MovieVO()
        
        mvo.title       = "호우시절"
        mvo.description = "때를 알고 내리는 좋은 비"
        mvo.openrate    = "2009-10-08"
        mvo.rating      = 7.31
        
        self.list.append(mvo)
        
        mvo.title       = "말할 수 없는 비밀"
        mvo.description = "여기서 너까지 다섯 걸음"
        mvo.openrate    = "2015-05-07"
        mvo.rating      = 9.19
        
        self.list.append(mvo)
        
        
    }
    
    
    
}
