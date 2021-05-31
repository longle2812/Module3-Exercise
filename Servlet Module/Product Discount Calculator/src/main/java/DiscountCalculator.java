import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountCalculator", value = "/calculate")
public class DiscountCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    double price = Double.parseDouble(request.getParameter("price"));
    double percentage = Double.parseDouble(request.getParameter("discountPercent"));

    double discountAmount = price * percentage * 0.01;
    double discountPrice = price - discountAmount;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<p>Discount Amount: "+ discountAmount+" <p>");
        writer.println("<p> Discount Price: " +discountPrice+" <p>");
        writer.println("</html>");


    }
}
