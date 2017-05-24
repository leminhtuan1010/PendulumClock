//
//  ViewController.swift
//  Pendulum
//
//  Created by Minh Tuan on 5/23/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var chim: UIImageView!
    var lac: UIImageView!
    var dongHo: UIImageView!
    var kimGiay: UIImageView!
    var kimGio: UIImageView!
    var kimPhut: UIImageView!
    var timer = Timer()
    var gocgiay: CGFloat!
    var gocGio: CGFloat!
    var gocPhut: CGFloat!
    var audio = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        gocgiay = CGFloat.pi
        gocGio = CGFloat.pi/2
        gocPhut = CGFloat.pi/2
        anhconlac()
        chaylac()
        matDongHo()
        kimHour()
        veChim()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(chayGiay), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(chayphut), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 720, target: self, selector: #selector(chaygio), userInfo: nil, repeats: true)
    }
    // vẽ hình con chim
    func veChim(){
        chim = UIImageView(frame: CGRect(x: 180, y: -50,width: 50,height: 50))
        chim.image = UIImage(named: "chim")
        view.addSubview(chim)
        chayChim()
    }
    // cho chim chạy ra vào và kèm theo tiếng
    func chayChim(){
        UIView.animate(withDuration: 1, animations: {
            self.chim.center = CGPoint(x: self.chim!.center.x, y: 100)
            self.chim.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.tiengChim()
        }){ _ in
            UIView.animate(withDuration: 1, animations: {
                self.chim.center = CGPoint(x: self.chim!.center.x, y: -50)
                self.chim.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }){ _ in
                self.chayChim()
                
                
            }
        }
    }
    // tạo tiếng chim hót
    func tiengChim(){
        let file = Bundle.main.path(forResource: "hot", ofType: ".mp3")!
        let url = URL(fileURLWithPath: file)
        audio = try!AVAudioPlayer(contentsOf: url)
        audio.prepareToPlay()
        audio.play()
    }
    // Vẽ con lắc
    func anhconlac() {
        lac = UIImageView(frame: CGRect(x: 180, y: 300, width: 50, height: 250))
        lac.image = UIImage(named: "conlac")
        lac.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        lac.transform = self.lac.transform.rotated(by: CGFloat (-M_PI_4))
        view.addSubview(lac)
    }
    // vẽ kim giờ
    func kimHour(){
        kimGio = UIImageView(frame: CGRect(x: 191, y: 276, width: 25, height: 50 ))
        kimGio.image = UIImage(named: "gio")
        kimGio.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        kimGio.transform = self.kimGio.transform.rotated(by: CGFloat (M_PI_2))
        view.addSubview(kimGio)
        kimMinnutes()
    }
    // vẽ kim phút
    func kimMinnutes(){
        kimPhut = UIImageView(frame: CGRect(x: 188, y: 265, width: 25, height: 70))
        kimPhut.image = UIImage(named: "phut")
        kimPhut.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        kimPhut.transform = self.kimPhut.transform.rotated(by: CGFloat (M_PI_2))
        view.addSubview(kimPhut)
        kimSecond()
    }
    // vẽ kim giây
    func kimSecond() {
        kimGiay = UIImageView(frame: CGRect(x: 194, y: 260,width: 17, height: 80))
        kimGiay.image = UIImage(named: "giay")
        kimGiay.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        kimGiay.transform = self.kimGiay.transform.rotated(by: CGFloat (M_PI))
        view.addSubview(kimGiay)
    }
    // vẽ mặt đồng hồ
    func matDongHo(){
        dongHo = UIImageView(frame: CGRect(x: 100, y: 200,width: 200, height: 200))
        dongHo.image = UIImage(named: "clock")
        view.addSubview(dongHo)
    }
    // cho con lắc chạy
    func chaylac(){
        UIView.animate(withDuration: 1, animations: {
            self.lac.transform = self.lac.transform.rotated(by: CGFloat(M_PI_2))
        }){_ in
            UIView.animate(withDuration: 1, animations: {
                self.lac.transform = self.lac.transform.rotated(by: CGFloat (-M_PI_2))
            }) { _ in
                self.chaylac()
            }
        }
    }
    // cho giây chạy
    func chayGiay(){
        gocgiay = gocgiay + CGFloat.pi/30
        self.kimGiay.transform = CGAffineTransform(rotationAngle: gocgiay)
    }
    // tính thời gian để phút chạy
    func chayphut(){
        gocPhut = gocPhut + CGFloat.pi/30
        self.kimPhut.transform = CGAffineTransform(rotationAngle: gocPhut)
    }
    // tính thời gian giờ chạy
    func chaygio(){
        gocGio = gocGio + CGFloat.pi/30
        self.kimGio.transform = CGAffineTransform(rotationAngle: gocGio)
    }
    

}

