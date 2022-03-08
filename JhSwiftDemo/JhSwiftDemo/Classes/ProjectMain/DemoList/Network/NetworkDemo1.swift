//
//  NetworkDemo1.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit
import SwiftyJSON

class NetworkDemo1: JhTextListTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.mTextView)
        
        // Alamofire + Moya + SwiftyJSON
        JhHttpTool.request(API.getPageList(1)) {[weak self] json in
            self?.mTextView.text = String(describing: JSON(json))
            JhAllLog(JSON(json))
        } failure: {code, msg in
            JhLog("code : \(code!)")
            JhLog("message : \(msg)")
        }
        
        // 链式网络请求：Alamofire + SwiftyJSON
        let url = kBaseURL + "/mock/simpleArrDict"
        JhRequest.url(url).params(nil).requestType(.get).success { res in
            JhLog(" ========链式网络请求======== ")
            JhAllLog(res)
            JhAllLog(res["code"])
            //            let decoder = JSONDecoder()
            //            let model = try? decoder.decode(DMModel.self, from: jsonData)
            //            self.model = model
            //            self.tableView.reloadData()
        }.failure { code, msg in
            JhLog("code : \(String(describing: code))")
            JhLog("message : \(msg)")
        }.request()
        
        //        NetworkManager.NetWorkRequest(.getPhotoList) { json in
        //            print(json)
        //        } failed: { error in
        //            print(error)
        //        }
        //
        //        NetworkManager.NetWorkRequest(.getPhotoList) { json in
        //            print(json)
        //        } failed: { error in
        //            print(error)
        //        } errorResult: {
        //        }
        
    }
    
    lazy var mTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.frame = CGRect(x: 0, y: kNavHeight, width: kScreenWidth, height: kScreenHeight-kNavHeight)
        textView.text = "这是UITextView"
        textView.font = JhFont(15)
        //        textView.textColor = JhRandomColor()
        //        textView.backgroundColor = JhRandomColor();
        //        textView.textAlignment = .left
        //        textView.isEditable = true
        //        textView.delegate = self
        return textView
    }()
    
}
