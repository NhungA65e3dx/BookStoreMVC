package Controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Book;

@SuppressWarnings({ "serial", "unused" })
@WebServlet(urlPatterns = {"Controller"})
public class CartController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get Session
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<Book> cart = (List<Book>) session.getAttribute("cart");

		//Check
		if (cart != null) {
			String[] quantities = request.getParameterValues("quantity");

			for (int i = 0; i < cart.size(); i++) {
				Book book = cart.get(i);

				// Lấy số lượng từ người dùng
				int quantity = Integer.parseInt(quantities[i]);

				// Kiểm tra và cập nhật số lượng và total price
				Iterator<Book> iterator = cart.iterator();
				while (iterator.hasNext()) {
				    Book book1 = iterator.next();
				    int quantity1 = Integer.parseInt(quantities[i]);

				    if (quantity1 <= 0) {
				        iterator.remove(); // Xóa phần tử một cách an toàn
				    } else {
				        book1.setQuantity(quantity1);
				        double totalPrice = quantity1 * book1.getPrice();
				        book1.setTotalPrice(totalPrice);
				    }
				    i++;
				}
			}
		}

		// Chuyển hướng người dùng đến trang CartPage.jsp
		response.sendRedirect(request.getContextPath() + "/View/CartPage.jsp");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    // Lấy thông tin sách từ request
    String bookId = request.getParameter("bookId");
    String bookName = request.getParameter("bookName");
    String bookAuthor = request.getParameter("bookAuthor");
    String bookIntroduce = request.getParameter("bookIntroduce");
    String bookPrice = request.getParameter("bookPrice");

    // Chuyển đổi bookId sang kiểu int
    int id = Integer.parseInt(bookId);

    // Chuyển đổi bookPrice sang kiểu double
    double price = Double.parseDouble(bookPrice);

    // Lấy hoặc tạo một đối tượng HttpSession từ request
    HttpSession session = request.getSession();

    // Lấy danh sách sách đã được lưu trong Session
    @SuppressWarnings("unchecked")
    List<Book> cart = (List<Book>) session.getAttribute("cart");

    // Nếu danh sách chưa tồn tại, tạo mới và lưu vào Session
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

    // Kiểm tra nếu đã tồn tại id trong giỏ hàng, tăng quantity
    boolean exists = false;
    for (Book existingBook : cart) {
        if (existingBook.getId() == id) {
            exists = true;
            existingBook.setQuantity(existingBook.getQuantity() + 1);
            break;
        }
    }

    // Nếu id chưa tồn tại trong giỏ hàng, thêm sách vào giỏ hàng
    if (!exists) {
        // Tạo một đối tượng Book để lưu thông tin sách
        Book book = new Book(id, bookName, bookAuthor, bookIntroduce, price);
        book.setQuantity(1);
        cart.add(book);
    }

    // Chuyển hướng người dùng đến trang CartPage.jsp
    response.sendRedirect(request.getContextPath() + "/View/CartPage.jsp");
}

}