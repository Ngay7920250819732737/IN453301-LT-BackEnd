Bài 1: Vì sao cần cô lập (Isolation)?[cite: 2, 3]

- Nguyên nhân: Khi hai giao dịch thực hiện đồng thời mà không có cơ chế khoá/cô lập, hiện tượng tranh chấp dữ liệu (Race Condition) sẽ xảy ra[cite: 3].
- Hậu quả: Cả hai phiên (An và Bình) đều SELECT ra kết quả "còn 1 chỗ", sau đó cả hai cùng INSERT và COMMIT, làm số lượng đăng ký vượt quá giới hạn tối đa (41/40 người)[cite: 3].
- Giải pháp: Sử dụng khoá hàng bằng SELECT ... FOR UPDATE trong một transaction[cite: 3]. Cơ chế này buộc giao dịch sau phải đợi giao dịch trước COMMIT xong mới được thực hiện, giúp bảo đảm tính chính xác của dữ liệu[cite: 3].	