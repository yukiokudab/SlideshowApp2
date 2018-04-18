//
//  ResulrViewController.swift
//  SlideshowApp
//
//  Created by 奥田涼也 on 2018/04/11.
//  Copyright © 2018年 yuki.okuda. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
 
    @IBOutlet weak var expansion: UIImageView!
    
    var imageName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        expansion.image = UIImage(named: imageName)
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */




