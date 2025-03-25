# Sử dụng hình ảnh Python chính thức làm cơ sở
FROM python:3.9-slim

# Thiết lập biến môi trường
ENV PYTHONUNBUFFERED=1

# Đặt thư mục làm việc trong container
WORKDIR /app

# Sao chép tệp requirements.txt vào container
COPY requirements.txt .

# Cài đặt các phụ thuộc từ requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Sao chép toàn bộ mã nguồn của ứng dụng vào container
COPY . .

# Mở cổng mà ứng dụng sẽ chạy
EXPOSE 8000

# Lệnh mặc định để chạy ứng dụng khi container khởi động
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
