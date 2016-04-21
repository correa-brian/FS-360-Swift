//
//  WAQuestionsViewController.swift
//  WhereAmI
//
//  Created by Brian Correa on 4/21/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import Alamofire

class WAQuestionsViewController: WAViewController {

    //Data Goes in init functions
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "Questions"
        self.tabBarItem.image = UIImage(named: "question.png")
    }
    
    //Views goes in here
    
    override func loadView() {
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(red: 148/255, green: 158/255, blue: 194/255, alpha: 1)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(WAQuestionsViewController.createQuestion(_:)))
        
        let url = "http://localhost:3000/api/question"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, AnyObject>{
                print("\(JSON)")
            }
        }
    }
    
    func createQuestion(btn: UIBarButtonItem){
        print("createQuestion")
        
        presentViewController(WACreateQuestionViewController(), animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
