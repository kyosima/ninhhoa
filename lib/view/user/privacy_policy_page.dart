import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chính sách bảo mật'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.04 * kWidth),
          child: const Text('''CHÍNH SÁCH BẢO MẬT THÔNG TIN
Áp dụng từ ngày: 22/10/2021

wjn’s cam kết sẽ bảo mật những thông tin mang tính riêng tư của bạn. Bạn vui lòng đọc bản "Chính sách bảo mật" dưới đây để hiểu hơn những cam kết mà chúng tôi thực hiện, nhằm tôn trọng và bảo vệ quyền lợi của người truy cập:

1. Mục đích và phạm vi thu thập

- Để truy cập và sử dụng một số dịch vụ tại wjn’s, bạn có thể sẽ được yêu cầu đăng ký với chúng tôi thông tin cá nhân (Email, Họ tên, Số ĐT liên lạc…). Mọi thông tin khai báo phải đảm bảo tính chính xác và hợp pháp. wjn’s không chịu mọi trách nhiệm liên quan đến pháp luật của thông tin khai báo. 

- Chúng tôi cũng có thể thu thập thông tin về số lần viếng thăm, bao gồm số trang bạn xem, số links (liên kết) bạn click và những thông tin khác liên quan đến việc kết nối đến site wjn’s. Chúng tôi cũng thu thập các thông tin mà trình duyệt Web (Browser) bạn sử dụng mỗi khi truy cập vào wjn’s, bao gồm: địa chỉ IP, loại Browser, ngôn ngữ sử dụng, thời gian và những địa chỉ mà Browser truy xuất đến.

2. Phạm vi sử dụng thông tin

wjn’s thu thập và sử dụng thông tin cá nhân bạn với mục đích phù hợp và hoàn toàn tuân thủ nội dung của “Chính sách bảo mật” này.

Cụ thể:

Khi cần thiết, chúng tôi có thể sử dụng những thông tin này vào các mục đích:

- Xử lý đơn hàng: gọi điện/tin nhắn xác nhận việc đặt hàng, thông báo về trạng thái đơn hàng & thời gian giao hàng, xác nhận việc huỷ đơn hàng (nếu có).

- Gởi thư ngỏ/thư cảm ơn, giới thiệu sản phẩm mới, dịch vụ mới hoặc các chương trình khuyến mãi của wjn’s.

- Gởi thông tin về bảo hành sản phẩm.

- Giải quyết khiếu nại của khách hàng.

- Thông tin trao thưởng (của wjn’s hoặc của hãng).

- Gởi thông tin cho công ty tài chính để tiếp nhận, thẩm định & duyệt hồ sơ trả góp.

- Các khảo sát để chăm sóc khách hàng tốt hơn.

- Xác nhận các thông tin về kỹ thuật & bảo mật thông tin khách hàng.

- Các trường hợp có sự yêu cầu của cơ quan nhà nước có thẩm quyền, theo đúng quy định của pháp luật.

3. Thời gian lưu trữ thông tin
Dữ liệu cá nhân của Thành viên sẽ được lưu trữ cho đến khi có yêu cầu hủy bỏ hoặc tự thành viên đăng nhập và thực hiện hủy bỏ. Còn lại trong mọi trường hợp thông tin cá nhân thành viên sẽ được bảo mật trên máy chủ của wjn’s.

4. Địa chỉ của đơn vị thu thập và quản lý thông tin cá nhân

- Địa chỉ đăng ký kinh doanh: 경상북도 구미시 인동32길 35-4(2층)

- Điện thoại văn phòng: 010.4857.5797.

5. Phương tiện và công cụ để người dùng tiếp cận và chỉnh sửa dữ liệu cá nhân

Hiện website chưa triển khai trang quản lý thông tin cá nhân của thành viên, vì thế việc tiếp cận và chỉnh sửa dữ liệu cá nhân dựa vào yêu cầu của khách hàng bằng hình thức sau: Gọi điện thoại đến tổng đài chăm sóc khách hàng 010.4857.5797, bằng nghiệp vụ chuyên môn xác định thông tin cá nhân và nhân viên tổng đài sẽ hỗ trợ chỉnh sửa thay người dùng.

6. Cam kết bảo mật thông tin cá nhân khách hàng

- Khách hàng có quyền yêu cầu thay đổi hoặc huỷ bỏ thông tin cá nhân của mình.

- Thông tin cá nhân của thành viên trên wjn’s được wjn’s cam kết bảo mật tuyệt đối theo chính sách bảo vệ thông tin cá nhân của wjn’s. Việc thu thập và sử dụng thông tin của mỗi thành viên chỉ được thực hiện khi có sự đồng ý của khách hàng đó trừ những trường hợp pháp luật có quy định khác.

- Chỉ sử dụng thông tin khách hàng vào các nội dung ở mục 2. Không phát tán, cung cấp thông tin khách hàng cho bên thứ 3 trừ trường hợp:

+ Cung cấp cho công ty tài chính khi khách hàng mua trả góp, cung cấp hãng để trao thưởng hoặc trường hợp khác khi cơ quan nhà nước có thẩm quyền yêu cầu.

+ Cung cấp cho bên thứ 3 sau khi khách hàng mua hàng để gửi tin nhắn cho khách hàng các thông tin về sản phẩm, bảo hành, chính sách dịch vụ, khuyến mãi, khảo sát hoặc xác nhận các thông tin về kỹ thuật & bảo mật thông tin khách hàng.

- Chúng tôi cam kết  sử dụng các biện pháp quản lý, kỹ thuật phù hợp để bảo vệ thông tin  do mình thu thập, lưu trữ; tuân thủ các tiêu chuẩn, quy chuẩn kỹ thuật về bảo đảm an toàn thông tin mạng. Trong trường hợp máy chủ lưu trữ thông tin bị hacker tấn công dẫn đến mất mát dữ liệu cá nhân thành viên, wjn’s sẽ có trách nhiệm thông báo vụ việc cho cơ quan chức năng điều tra xử lý kịp thời và thông báo cho thành viên được biết.

- Bảo mật tuyệt đối mọi thông tin giao dịch trực tuyến của Thành viên bao gồm thông tin hóa đơn kế toán chứng từ số hóa tại khu vực dữ liệu trung tâm an toàn cấp 1 của wjn’s.

- Ban quản lý wjn’s yêu cầu các cá nhân khi đăng ký/mua hàng là thành viên, phải cung cấp đầy đủ thông tin cá nhân có liên quan như: Họ và tên, địa chỉ liên lạc, email, số chứng minh nhân dân, điện thoại, số tài khoản, số thẻ thanh toán,… và chịu trách nhiệm về tính pháp lý của những thông tin trên. Ban quản lý wjn’s không chịu trách nhiệm cũng như không giải quyết mọi khiếu nại có liên quan đến quyền lợi của Thành viên đó nếu xét thấy tất cả thông tin cá nhân của thành viên đó cung cấp khi đăng ký ban đầu là không chính xác. '''),
        ),
      ),
    );
  }
}
