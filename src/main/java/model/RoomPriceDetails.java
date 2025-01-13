package model;

public class RoomPriceDetails {

    private float roomPrice; // Giá phòng
    private boolean discounted = false; // Cờ để xác định có giảm giá hay không
    private String discountName; // Tên giảm giá
    private float discountValue; // Phần trăm giảm giá

    // Getters và Setters
    public float getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(float roomPrice) {
        this.roomPrice = roomPrice;
    }

    public boolean isDiscounted() {
        return discounted;
    }

    public void setDiscounted(boolean discounted) {
        this.discounted = discounted;
    }

    public String getDiscountName() {
        return discountName;
    }

    public void setDiscountName(String discountName) {
        this.discountName = discountName;
    }

    public float getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(float discountValue) {
        this.discountValue = discountValue;
    }
}
