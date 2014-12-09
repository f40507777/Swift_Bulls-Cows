//
//  InterFace.swift
//  Bulls&Cows
//
//  Created by apple on 2014/12/6.
//  Copyright (c) 2014年 apple. All rights reserved.
//

import UIKit
import Foundation

class InterFace: UIViewController {
    
    let ScreenSize:CGRect = UIScreen.mainScreen().bounds
    let ScreenWidth = UIScreen.mainScreen().bounds.width
    let ScreenHeight = UIScreen.mainScreen().bounds.height
    var Bit0 = UILabel(),Bit1 = UILabel(),Bit2 = UILabel(),Bit3 = UILabel(),ALabel = UILabel(),BLabel = UILabel()
    var BitArr:Array<UILabel> = []
    var flag = 0
    var Datasetting = ViewController()
    //var DataStore = NSMutableArray()
    var TextView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Datasetting.datastore()
        Datasetting.Setting()
        Setting()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Setting(){
        
        //var Background = UIView()
        //Background.backgroundColor = UIColor(red: 0, green: 170, blue: 270, alpha: 1.0)
        //self.view.addSubview(Background)
        self.view.backgroundColor = UIColor(red: 0, green: 120, blue: 150, alpha: 0.5)
        var A_Lab = UILabel(frame: CGRectMake(0, 0, 20, 20))
        A_Lab.center = CGPointMake(ScreenWidth*(CGFloat(11)/22), ScreenHeight*(CGFloat(2)/11))
        A_Lab.textColor = UIColor.redColor()
        A_Lab.text = "A"
        self.view.addSubview(A_Lab)
        //LabelA
        ALabel.frame = CGRectMake(0, 0, 20, 20)
        ALabel.center = CGPointMake(ScreenWidth*(CGFloat(10)/22), ScreenHeight*(CGFloat(2)/11))
        ALabel.textColor = UIColor.redColor()
        ALabel.text = "_"
        self.view.addSubview(ALabel)
        
        
        var B_Lab = UILabel(frame: CGRectMake(0, 0, 20, 20))
        B_Lab.center = CGPointMake(ScreenWidth*(CGFloat(13)/22), ScreenHeight*(CGFloat(2)/11))
        B_Lab.textColor = UIColor.redColor()
        B_Lab.text = "B"
        self.view.addSubview(B_Lab)
        
        //LabelB
        BLabel.frame = CGRectMake(0, 0, 20, 20)
        BLabel.center = CGPointMake(ScreenWidth*(CGFloat(12)/22), ScreenHeight*(CGFloat(2)/11))
        BLabel.textColor = UIColor.redColor()
        BLabel.text = "_"
        self.view.addSubview(BLabel)
        
        //BitLabel
        BitArr = [Bit0,Bit1,Bit2,Bit3,ALabel,BLabel]
        for i in 0...3 {
            var line = UIView(frame: CGRectMake(0, 0, 15, 3))
            line.center = CGPointMake(ScreenWidth*(CGFloat((i+1)+3)/11),ScreenHeight*(1/11)+15)
            line.backgroundColor = UIColor.blackColor()
            BitArr[i].frame = CGRectMake(0, 0, 15, 20)
            BitArr[i].center = CGPointMake(ScreenWidth*(CGFloat((i+1)+3)/11), ScreenHeight*(1/11))
            BitArr[i].text = " "
            self.view.addSubview(BitArr[i])
            self.view.addSubview(line)
        }
        //NumBtn
        var Btn0 = UIButton(),Btn1 = UIButton(),Btn2 = UIButton(),Btn3 = UIButton(),Btn4 = UIButton(),Btn5 = UIButton(),Btn6 = UIButton(),Btn7 = UIButton(),Btn8 = UIButton(),Btn9 = UIButton()
        var BtnArr = [Btn0,Btn1,Btn2,Btn3,Btn4,Btn5,Btn6,Btn7,Btn8,Btn9]
        //var BtnSectArr:[Selector] = ["BtnAct0:","BtnAct1:","BtnAct2:","BtnAct3:","BtnAct4:","BtnAct5:","BtnAct6:","BtnAct7:","BtnAct:8","BtnAct9:"]
        
        for i in 0...9 {
            BtnArr[i].frame = CGRectMake(0, 0, 30, 30)
            var height = ScreenHeight*(CGFloat(((i+1)/6)+9)/11)
            var width = ScreenWidth * (CGFloat(((i)%5)+1)/11)
            BtnArr[i].center = CGPointMake(width,height)
            BtnArr[i].setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            BtnArr[i].setTitle("\(i)", forState: UIControlState.Normal)
            BtnArr[i].addTarget(self, action:"BtnActs:", forControlEvents: UIControlEvents.TouchDown)
            /*if (i==0){
                BtnArr[i].addTarget(self, action: "BtnAct0:", forControlEvents: UIControlEvents.TouchDown)
            }*/
            self.view.addSubview(BtnArr[i])
        }
        //clear
        var ClearBtn = UIButton()
        ClearBtn.frame = CGRectMake(0, 0, 70, 30)
        ClearBtn.center = CGPointMake(ScreenWidth*(CGFloat(9)/11),ScreenHeight*(CGFloat(10)/11))
        ClearBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        ClearBtn.setTitle("Clear", forState: UIControlState.Normal)
        ClearBtn.addTarget(self, action:"ClearBtnActs:", forControlEvents: UIControlEvents.TouchDown)
        //ClearBtn.backgroundColor = UIColor(red: 100, green: 50, blue: 0, alpha: 1)
        ClearBtn.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(ClearBtn)
        
        //Enter
        var EnterBtn = UIButton()
        EnterBtn.frame = CGRectMake(0, 0, 70, 30)
        EnterBtn.center = CGPointMake(ScreenWidth*(CGFloat(9)/11),ScreenHeight*(CGFloat(9)/11))
        EnterBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        EnterBtn.setTitle("Enter", forState: UIControlState.Normal)
        EnterBtn.addTarget(self, action: "EnterBtnActs:", forControlEvents: UIControlEvents.TouchDown)
        //EnterBtn.backgroundColor = UIColor(red: 230, green: 145, blue: 0, alpha: 1)
        EnterBtn.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(EnterBtn)
        
        //text view
        
        TextView.frame = CGRectMake(0, 0, ScreenWidth*(CGFloat(4)/5), ScreenHeight/2)
        TextView.center = CGPointMake(ScreenWidth*(CGFloat(1)/2), ScreenHeight*(CGFloat(1)/2))
        TextView.text = DatastoreStr(Datasetting.DataStore)
        TextView.backgroundColor = UIColor(red: 220, green: 230, blue: 150, alpha: 0.5)
        self.view.addSubview(TextView)
    }
    
    
    func BtnActs(sender:UIButton!){
        let num = sender.titleLabel!.text!
        if flag < 6{
            BitArr[flag].text = num
            flag++
        }
    }
    func ClearBtnActs(sender:UIButton!){
        flag = 0
        for Bitlab in BitArr {
            Bitlab.text = " "
        }
    }
    func EnterBtnActs(sender:UIButton!){
        if flag >= 5 {
            Datasetting.InputNum = [String(Bit0.text!),String(Bit1.text!),String(Bit2.text!),String(Bit3.text!)]
            Datasetting.InputAB = [ALabel.text!.toInt()!,BLabel.text!.toInt()!]
            Datasetting.DeletData()
            TextView.text = DatastoreStr(Datasetting.DataStore)
            
            
        }else{
            let alert = UIAlertView()
            alert.title = "錯誤"
            alert.message = "請輸入完整"
            alert.addButtonWithTitle("確定")
            alert.show()
        }
    }
    
    func DatastoreStr(Datas:NSMutableArray) -> String {
        var datastr = String()
        for data in Datas {
            
            if Int(data as NSNumber)<1000{
                datastr = datastr + "0\(data),"
            }else{
                datastr = datastr + "\(data),"
            }

        }
        return datastr
    }


}