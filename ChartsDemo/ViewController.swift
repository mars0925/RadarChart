//
//  ViewController.swift
//  ChartsDemo
//
//  Created by Mars on 2020/6/2.
//  Copyright © 2020 drs24. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    @IBOutlet weak var radarChart: RadarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRadarChartView()
        
        //數據
        let redDataSet = RadarChartDataSet(
            entries: [
                RadarChartDataEntry(value: 100.0),
                RadarChartDataEntry(value: 80.0),
                RadarChartDataEntry(value: 60.0),
                RadarChartDataEntry(value: 40.0),
                RadarChartDataEntry(value: 25.0)
            ]
        )
        
        let data = RadarChartData(dataSets: [redDataSet])//產生數據的物件 RadarChartDat
        
        radarChart.data = data//數據設定給雷達圖
        
        let redColor = UIColor(red: 247/255, green: 67/255, blue: 115/255, alpha: 1)
        let redFillColor = UIColor(red: 247/255, green: 67/255, blue: 115/255, alpha: 0.6)
        
        redDataSet.lineWidth = 2 //這組資料的線條寬度
        redDataSet.colors = [redColor]//這組資料的線條顏色
        redDataSet.drawFilledEnabled = true //是否使用顏色填滿
        redDataSet.fillColor = redFillColor //這組資料的填充顏色
        redDataSet.valueFont = .systemFont(ofSize: 12, weight: .bold)//這組資料的字型
        redDataSet.setDrawHighlightIndicators(false) //不顯示十字線
    }
    
    //設定雷達圖屬性
    func setRadarChartView() {
        radarChart.webLineWidth = 1.5 //雷達圖線寬
        radarChart.innerWebLineWidth = 1.5 //雷達圖線寬
        radarChart.webColor = .lightGray //雷達圖顏色
        radarChart.innerWebColor = .lightGray //雷達圖顏色
        radarChart.rotationEnabled = false //是否能轉動
        radarChart.legend.enabled = false   //隱藏說明圖例
        
        //設定Ｘ軸
        let xAxis = radarChart.xAxis // X軸 外框
        xAxis.labelFont = .systemFont(ofSize: 12, weight: .bold) //字型
        xAxis.labelTextColor = .black // 字顏色
        xAxis.valueFormatter = XAxisFormatter()//客製化標籤
        
        //設定Ｙ軸
        let yAxis = radarChart.yAxis //Y軸 雷達圖向外的直線
        
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 80
        yAxis.drawLabelsEnabled = false  //不顯示標籤
        yAxis.labelCount = 4 //標籤數量
        yAxis.zeroLineColor = UIColor.lightGray
    }
    
    //設定X軸文字
    class XAxisFormatter: IAxisValueFormatter {
        
        let titles = ["平衡指標", "壓力指標","疲勞指標", "情緒指標", "憂鬱指標"]//x軸的內容
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            titles[Int(value) % titles.count]
        }
    }
}

