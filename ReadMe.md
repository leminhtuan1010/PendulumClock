# Pen Dulum Clock
## Giới thiệu
 Trong bài sẽ mô tả từng bước cụ thể để có thể vẽ lên một đồng hồ và quả lắc(Pen-dulum-clock)
 <img src="http://imgur.com/a/i9DHA">
 
## Tạo một chiếc đồng hồ và quả lắc
	Phần này sẽ hướng dẫn tạo một đồng hồ với đầy đủ các kim . Source code ở phần ViewController.swift
![demo](http://imgur.com/a/i9DHA) 

### Khởi tạo vẽ các kim giây và con lắc
	Vẽ các kim với một câu kệnh khá giống nhau nên ở đây chỉ đưa ra vẽ kim giờ:
	
	func kimSecond() {
        kimGiay = UIImageView(frame: CGRect(x: 194, y: 260,width: 17, height: 80))
        kimGiay.image = UIImage(named: "giay")
        kimGiay.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        kimGiay.transform = self.kimGiay.transform.rotated(by: CGFloat (M_PI))
        view.addSubview(kimGiay)
    }

	* Về mặt logic thì chúng ta đang cấp toạ độ cho kim giờ ở các vị trí X:191 và Y: 276 với kích thước được được định sẵn.
	* Với hình trên chúng ta sẽ phải thay đổi vị trí điểm neo cho hình ảnh, sử dụng anchorPoint để đưa điểm neo của hình ảnh về đầu ảnh.
	* Tiếp theo sẽ xác định chiều quay và vị trí quay của kim giờ. sử dụng hàm Rotated với góc quay và vị trí quay do mình xác định.
	* Hiển thị hình ảnh lên màn hình với view.addSubview
### Chạy con lắc theo  quỹ đạo được xác định
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

	
	* Về logic con lắc sẽ chạy từ trái qua phải với chu kỳ và biên độ đều nhau, trong thời gian 1 giây sẽ đi được 1 vòng
	* Để chạy con lắc sử dụng animations. Hàm animations xác định vị trị ban đầu của con lắc và trong 1 thời gian cô định sẽ đưa con lắc đến vị trị cần đến và trong thời gian tiếp theo sẽ trả về vị trí ban đầu của hình ảnh.
### Chạy kim giây và các kim còn lại
	Kim giây và các kim còn lại được viết tương tự như nhau nên ở đây chỉ đưa ra chạy kim giây:
	
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

	* Về logic kim giây sẽ chạy một vòng thì gkim phút sẽ nhích 1 khoảng tương đương với pi/30.
	* Xác định vị trí ban đầu của kim giây, sau đó cứ mỗi một giây thì kim giây sẽ đi được quãng đường là pi / 30. Sau khi chạy một vòng thì kim phút sẽ tiến 1 khoảng pi/30 và kim giay tiếp tục chạy vòng tiếp theo.
### Chạy chim và tạo nhạc

	 func tiengChim(){
       	      let file = Bundle.main.path(forResource: "hot", ofType: ".mp3")!
              let url = URL(fileURLWithPath: file)
              audio = try!AVAudioPlayer(contentsOf: url)
              audio.prepareToPlay()
              audio.play()
     }

	* Về logic ta sẽ cho con chim nằm bên ngoài màn hình và cứ đều đặn 1 giây thì con chim lại chạy ra vị trí xác định rồi trở lại vị trí ban đầu
	* Sử dụng animations giống như với con lắc để đưa ra vị trí của con chim và vị trí sau 1 giây thực hiện.
	* Sử dụng hàm scale để phóng to hình ảnh chú chim và thu nhỏ lại như hình ảnh ban đầu.
