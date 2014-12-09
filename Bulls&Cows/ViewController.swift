//
//  ViewController.swift
//  Bulls&Cows
//
//  Created by apple on 2014/12/6.
//  Copyright (c) 2014年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var DataStore:NSMutableArray = NSMutableArray()
    var Answer:[String] = []
    var InputNum:[String] = []
    var InputAB:[Int] = []
    var guessNum:[String] = []
    //var Interface = InterFace()
    //var AB:[Integer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //println("A=\(InputAB[0]),B=\(InputAB[1])")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func datastore(){
        for i in 0...9999 {
            if (legalNumber(IntToStringArray(i))){
                //DataStore.append(i)
                DataStore.addObject(i)
            }
        }
        println(DataStore.count)
    }
    
    //splite number to string bit
    func IntToStringArray(num: NSInteger) -> Array<String> {
        var StrArr:[String]=[String((num/1000)%10),String((num/100)%10),String((num/10)%10),String((num/1)%10)]
        return StrArr
    }
    //make sure is a legal number
    func legalNumber(StrArr: Array<String>)->Bool {
        for i in 0...2 {
            for j in i+1...3 {
                if (StrArr[i]==StrArr[j]){return false}
            }
        }
        return true
    }
    
    func AB(Input:Array<String>,Comp:Array<String>,A:Int,B:Int)->Bool{
        
        var a:Int = 0
        var b:Int = 0
        
        for i in 0...Input.count-1 {
            for j in 0...Comp.count-1 {
                if ((Input[i] == Comp[j]) && (i == j)){
                    a++
                    break
                }else if(Input[i] == Comp[j]){
                    b++
                    break
                }
            }
        }
        // if a,b is equel,return fasle else ture beacause delete
        if(!((a == A)&&(b == B))){
            return true
        }
        return false
    }
    func DeletData(){
        //remove colect item
        var discardedItems = NSMutableArray()
        for data in DataStore {
            if (AB(InputNum,Comp: IntToStringArray(data as NSInteger),A: InputAB[0],B: InputAB[1])){
                discardedItems.addObject(data)
            }
        }
        DataStore.removeObjectsInArray(discardedItems)
        //var Interface = InterFace()
        //Interface.DataStore = DataStore
        let count = UIAlertView()
        count.title = "Item"
        count.message = "\(DataStore.count)"
        count.addButtonWithTitle("OK")
        count.show()
        if DataStore.count == 1 {
            let alert = UIAlertView()
            alert.title = "Answer"
            alert.message = "\(DataStore[0])"
            alert.addButtonWithTitle("OK")
            alert.show()
        }

        println("count=\(DataStore.count)")
    }
    
    func Setting(){
        Answer = ["9","5","2","7"]
    }
}

