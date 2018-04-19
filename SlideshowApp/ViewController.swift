//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 奥田涼也 on 2018/04/10.
//  Copyright © 2018年 yuki.okuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var playpause: UIButton!
    @IBOutlet weak var forword: UIButton!
    @IBOutlet weak var rewind: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    

    // 一定の間隔で処理を行うためのタイマー
    var timer: Timer!
    var timer_sec: Float = 0
    
    // 表示している画像の番号
    var dispImageNo = 0
    
    // 画像の名前の配列
    let imageNameArray = [
        "IMG_4154.jpg",
        "IMG_4155.jpg",
        "IMG_4156.jpg",
        "IMG_4157.jpg",
        "IMG_4159.jpg",
        "IMG_4160.jpg",
        "IMG_4161.jpg"]
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
       
    // 画像の番号が正常な範囲を指しているかチェック
        
    // 範囲より下を指している場合、最後の画像を表示
    if dispImageNo < 0 {
       dispImageNo = 6
    }
        
    // 範囲より上を指している場合、最初の画像を表示
    if dispImageNo > 6 {
       dispImageNo = 0
    }
        
    // 表示している画像の番号から名前を取り出し
    let name = imageNameArray[dispImageNo]
        
    // 画像を読み込み
    let image = UIImage(named: name)
        
    // Image Viewに読み込んだ画像をセット
    imageView.image = image
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: imageNameArray[dispImageNo])
        imageView.image = image
    }
    
    // Timerによって、一定の間隔で呼び出される関数
    @objc func onTimer(timer: Timer) {
    
    // 関数が呼ばれていることを確認
        print("onTimer")
    // 表示している画像の番号を1増やす
        dispImageNo += 1
        
    // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func rewind(_ sender: Any) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func playpause(_ sender: Any) {
        // ボタンを押すと画像を再生
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        // 進む・戻るボタン無効化
        rewind.isEnabled = false
        forword.isEnabled = false
        //再生 -> 停止　ボタン名変更
        playpause.setTitle("停止", for: .normal)
         } else {
        // 再度ボタンを押すと一時停止
       self.timer.invalidate()
        // 現在のタイマーを破棄する
        self.timer = nil

       //進む・戻るボタン有効化
       rewind.isEnabled = true
       forword.isEnabled = true
       //停止 -> 再生　ボタン名変更
     playpause.setTitle("再生", for: .normal)
    }
}
    
    @IBAction func forward(_ sender: Any) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.imageName = imageNameArray[dispImageNo]
        
        if timer != nil {
            self.timer.invalidate()
            // 現在のタイマーを破棄する
            self.timer = nil
            //進む・戻るボタン有効化
            rewind.isEnabled = true
            forword.isEnabled = true
            //停止 -> 再生　ボタン名変更
            playpause.setTitle("再生", for: .normal)
        }

    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}


