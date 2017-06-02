# Pen Dulum Clock
## Giới thiệu
 Trong bài sẽ mô tả từng bước cụ thể để có thể vẽ lên một đồng hồ và quả lắc(Pen-dulum-clock)
 <img src="http://imgur.com/a/i9DHA">
 
## Tạo một chiếc đồng hồ và quả lắc
	Phần này sẽ hướng dẫn tạo một đồng hồ với đầy đủ các kim . Source code ở phần ViewController.swift
![demo](http://imgur.com/a/i9DHA) 

### Khởi tạo vẽ các kim giây và con lắc
	Vẽ các kim với một câu kệnh khá giống nhau nên ở đây chỉ đưa ra vẽ kim giờ:
![codeVe](http://imgur.com/a/2pSHX)
	* Về mặt logic thì chúng ta đang cấp toạ độ cho kim giờ ở các vị trí X:191 và Y: 276 với kích thước được được định sẵn.
	* Với hình trên chúng ta sẽ phải thay đổi vị trí điểm neo cho hình ảnh, sử dụng anchorPoint để đưa điểm neo của hình ảnh về đầu ảnh.
	* Tiếp theo sẽ xác định chiều quay và vị trí quay của kim giờ. sử dụng hàm Rotated với góc quay và vị trí quay do mình xác định.
	* Hiển thị hình ảnh lên màn hình với view.addSubview
### Chạy con lắc theo  quỹ đạo được xác định
![chayLac](http://imgur.com/a/Z19M1)
	* Về logic con lắc sẽ chạy từ trái qua phải với chu kỳ và biên độ đều nhau, trong thời gian 1 giây sẽ đi được 1 vòng
	* Để chạy con lắc sử dụng animations. Hàm animations xác định vị trị ban đầu của con lắc và trong 1 thời gian cô định sẽ đưa con lắc đến vị trị cần đến và trong thời gian tiếp theo sẽ trả về vị trí ban đầu của hình ảnh.
### Chạy kim giây và các kim còn lại
	Kim giây và các kim còn lại được viết tương tự như nhau nên ở đây chỉ đưa ra chạy kim giây:
![chayGiay](http://imgur.com/a/LpGnP)
	* Về logic kim giây sẽ chạy một vòng thì gkim phút sẽ nhích 1 khoảng tương đương với pi/30.
	* Xác định vị trí ban đầu của kim giây, sau đó cứ mỗi một giây thì kim giây sẽ đi được quãng đường là pi / 30. Sau khi chạy một vòng thì kim phút sẽ tiến 1 khoảng pi/30 và kim giay tiếp tục chạy vòng tiếp theo.
### Chạy chim và tạo nhạc
![chayChim](http://imgur.com/a/awNZ8)
	* Về logic ta sẽ cho con chim nằm bên ngoài màn hình và cứ đều đặn 1 giây thì con chim lại chạy ra vị trí xác định rồi trở lại vị trí ban đầu
	* Sử dụng animations giống như với con lắc để đưa ra vị trí của con chim và vị trí sau 1 giây thực hiện.
	* Sử dụng hàm scale để phóng to hình ảnh chú chim và thu nhỏ lại như hình ảnh ban đầu.
