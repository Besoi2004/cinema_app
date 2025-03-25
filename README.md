# BeSoi Cinema

Ứng dụng di động xem và đặt vé xem phim được phát triển bằng Flutter.

## Giới thiệu

BeSoi Cinema là ứng dụng di động giúp người dùng dễ dàng tìm kiếm, khám phá và đặt vé xem phim với trải nghiệm người dùng hiện đại và trực quan. Ứng dụng được thiết kế với giao diện tối, nhấn mạnh vào trải nghiệm người dùng và hiệu ứng chuyển động mượt mà.

## Tính năng chính

- **Màn hình trang chủ**: Hiển thị phim nổi bật, danh mục, tìm kiếm và phim mới
- **Duyệt phim**: Xem phim theo nhiều cách khác nhau (đang chiếu, sắp chiếu, đánh giá cao)
- **Chi tiết phim**: Thông tin chi tiết về phim (thể loại, thời lượng, đánh giá)
- **Đặt vé**: Chọn suất chiếu và chỗ ngồi
- **Hồ sơ người dùng**: Quản lý thông tin cá nhân và lịch sử đặt vé

## Công nghệ sử dụng

- **Framework**: Flutter
- **Ngôn ngữ**: Dart
- **Quản lý trạng thái**: StatefulWidget + setState
- **Điều hướng**: Navigator 2.0
- **Hỗ trợ nền tảng**: Android, iOS, Windows, macOS, Linux, Web

## Cấu trúc dự án

```
lib/
├── consts.dart
├── main.dart
├── models/
│   ├── category_model.dart
│   ├── movie_model.dart
│   └── ...
├── pages/
│   ├── all_movies_page.dart
│   ├── detail_page.dart
│   ├── home_page_cinema.dart
│   ├── profile_page.dart
│   ├── reservation_screen.dart
│   └── ...
└── Widget/
    ├── movie_info.dart
    └── ...
```

## Hướng dẫn cài đặt

1. Cài đặt Flutter (phiên bản 3.0.0 trở lên):
   ```
   https://docs.flutter.dev/get-started/install
   ```

2. Clone dự án:
   ```
   git clone <repository-url>
   ```

3. Cài đặt các dependencies:
   ```
   flutter pub get
   ```

4. Chạy ứng dụng:
   ```
   flutter run
   ```

## Kế hoạch phát triển

1. **Tích hợp Backend**
   - Kết nối API rạp chiếu phim thực tế
   - Xác thực người dùng và quản lý hồ sơ
   - Hiển thị ghế ngồi theo thời gian thực

2. **Tính năng nâng cao**
   - Tích hợp cổng thanh toán
   - Đề xuất phim cá nhân hóa sử dụng ML
   - Khả năng chia sẻ xã hội
   - Hệ thống đánh giá và nhận xét

3. **Cải tiến hiệu suất**
   - Quản lý trạng thái hiệu quả hơn (Provider/Bloc)
   - Chiến lược tối ưu hóa hình ảnh
   - Cơ chế lưu trữ đệm cho hỗ trợ ngoại tuyến

## Người đóng góp

- [Tên của bạn] - Phát triển chính

## Giấy phép

Dự án này được cấp phép theo giấy phép [loại giấy phép] - xem tệp LICENSE.md để biết chi tiết.
