package servlet;

import java.util.concurrent.ConcurrentHashMap;

public class TransactionStatus {
    private static ConcurrentHashMap<String, String> transactionStatusMap = new ConcurrentHashMap<>();

    public static void setStatus(String transactionId, String status) {
        transactionStatusMap.put(transactionId, status);
    }

    public static String getStatus(String transactionId) {
        return transactionStatusMap.get(transactionId);
    }

    public static void remove(String transactionId) {
        transactionStatusMap.remove(transactionId);
    }
}
