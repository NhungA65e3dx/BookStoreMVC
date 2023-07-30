CREATE DATABASE IF NOT EXISTS bookstore;

USE bookstore;

CREATE TABLE IF NOT EXISTS books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    author VARCHAR(255),
    introduce TEXT,
    price VARCHAR(255)
);

INSERT INTO books (name, author, introduce, price) VALUES
('Chúa tể của những chiếc nhẫn', 'J.R.R. Tolkien', 'Cuộc phiêu lưu đầy mạo hiểm trong thế giới Trung Địa.', '150000'),
('Harry Potter và Hòn đá phù thủy', 'J.K. Rowling', 'Harry Potter bắt đầu cuộc hành trình kỳ diệu của mình.', '180000'),
('Sherlock Holmes: Cuộc phiêu lưu của những kẻ trinh thám', 'Arthur Conan Doyle', 'Các vụ án ly kỳ được giải quyết bởi Sherlock Holmes và ông bạn thân Watson.', '120000'),
('Nghệ thuật đối thoại', 'Peter Hain', 'Một cuốn sách về cách giao tiếp hiệu quả và xây dựng mối quan hệ tốt hơn.', '90000'),
('Đắc nhân tâm', 'Dale Carnegie', 'Cuốn sách hướng dẫn về cách thành công trong cuộc sống và giao tiếp với người khác.', '99000'),
('Những kẻ độc tài', 'George Orwell', 'Một tác phẩm văn học nổi tiếng về chính trị và xã hội.', '135000'),
('Sức mạnh của thói quen', 'Charles Duhigg', 'Khám phá sức mạnh của thói quen và cách thay đổi chúng để đạt được thành công.', '115000'),
('Dấu chân trên cát', 'Erich Maria Remarque', 'Một tiểu thuyết về cuộc sống và tình yêu trong thời kỳ chiến tranh.', '155000');PRIMARYPRIMARY