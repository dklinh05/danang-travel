<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="css/confirmBooking.css">
<script>
    function calculateTotal() {
        var priceAdult = parseInt(document.getElementById("priceAdult").value);
        var priceChild = parseInt(document.getElementById("priceChild").value);
        var priceInfant = parseInt(document.getElementById("priceInfant").value);

        var adultCount = parseInt(document.getElementById("adultCount").value);
        var childCount = parseInt(document.getElementById("childCount").value);
        var infantCount = parseInt(document.getElementById("infantCount").value);

        var total = (adultCount * priceAdult) + (childCount * priceChild) + (infantCount * priceInfant);
        document.getElementById("totalPrice").value = total;
    }
</script>

<h2>Xác Nhận Thông Tin Đặt Tour</h2>

<form action="ConfirmBookingServlet" method="post">
    <input type="hidden" name="tourId" value="<%= request.getAttribute("tourId") %>">

    <label>Họ và Tên:</label>
    <input type="text" name="fullName" required>

    <label>Email:</label>
    <input type="email" name="email" required>

    <label>Số điện thoại:</label>
    <input type="tel" name="phone" required>

    <label>Giới tính:</label>
    <select name="gender" required>
        <option value="Nam">Nam</option>
        <option value="Nữ">Nữ</option>
        <option value="Khác">Khác</option>
    </select>

    <label>Ngày sinh:</label>
    <input type="date" name="dob" required>

    <label>Địa chỉ:</label>
    <input type="text" name="address" required>

    <h3>Thông tin giá vé:</h3>
    <label>Giá vé Người lớn:</label>
    <input type="text" id="priceAdult" name="priceAdult" value="<%= request.getAttribute("priceAdult") %>" readonly>

    <label>Giá vé Trẻ em (6-11 tuổi):</label>
    <input type="text" id="priceChild" name="priceChild" value="<%= request.getAttribute("priceChild") %>" readonly>

    <label>Giá vé Em bé (<6 tuổi):</label>
    <input type="text" id="priceInfant" name="priceInfant" value="<%= request.getAttribute("priceInfant") %>" readonly>

    <h3>Chọn số lượng vé:</h3>
    <label>Người lớn:</label>
    <input type="number" name="adultCount" id="adultCount" min="0" value="0" onchange="calculateTotal()">

    <label>Trẻ em:</label>
    <input type="number" name="childCount" id="childCount" min="0" value="0" onchange="calculateTotal()">

    <label>Em bé:</label>
    <input type="number" name="infantCount" id="infantCount" min="0" value="0" onchange="calculateTotal()">

    <label><b>Tổng tiền:</b></label>
    <input type="text" name="totalPrice" id="totalPrice" readonly>

    <button type="submit">Xác nhận đặt tour</button>
</form>

