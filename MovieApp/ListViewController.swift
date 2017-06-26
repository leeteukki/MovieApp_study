//
//  ListViewController.swift
//  MovieApp
//
//  Created by Lena Lee on 2017. 6. 18..
//  Copyright © 2017년 Lena Lee. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    
    lazy var list : [MovieVO] = {
        
        var datalist = [MovieVO]()
        

        
        return datalist
    }()
    
    override func viewDidLoad( ) {
        
        
        let url = "http://115.68.183.178:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
        let apiURI : URL! = URL(string: url)
        
        let apidata = try! Data(contentsOf: apiURI)
        
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        
        NSLog("API Result=\(log)")
        
        do {
            let apiDictionary = try! JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie  = movies["movie"] as! NSArray
            
            for row in movie {
                
                let r = row as! NSDictionary
                
                let mvo = MovieVO()
                
                mvo.title       = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail   = r["thumbnailImage"] as? String
                mvo.detail      = r["linkUrl"] as? String
                mvo.rating      = ((r["ratingAverage"] as! NSString).doubleValue)
                
                self.list.append(mvo)

            }
        } catch {
        
            
            
        }
        
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
        
        let url: URL! = URL(string: row.thumbnail!)
        let imageData = try! Data(contentsOf: url)
        cell.thumbnail.image = UIImage(data: imageData)
        
        
        
        
        
        return cell
        
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
    
        }
    
    }
