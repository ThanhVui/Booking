package servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/CheckTransactionStatusServlet")
public class CheckTransactionStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String transactionId = request.getParameter("transactionId");
        if (transactionId != null) {
            String status = TransactionStatus.getStatus(transactionId);
            if ("COMPLETED".equals(status)) {
                response.getWriter().write("COMPLETED");
                return;
            }
        }
        response.getWriter().write("PENDING");
    }
}
