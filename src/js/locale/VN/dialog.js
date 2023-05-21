const Dialog = {
  Duplicate: {
    Type: "primary",
    Title: "MISA CeGov",
    Button: "Đóng",
    ContentBefore: "Mã danh hiệu thi đua ",
    ContentAfter: " đã tồn tại trong danh sách. Xin vui lòng kiểm tra lại.",
  },
  NotAllowDelete: {
    Type: "secondary",
    Title: "Thông báo",
    Button: "Đóng",
    ContentBefore: "Danh hiệu ",
    ContentAfter: " là dữ liệu hệ thống, bạn không thể xóa.",
  },
  AllowDelete: {
    Type: "primary",
    Title: "Xóa sản phẩm",
    ButtonCancel: "Hủy",
    ButtonDelete: "Xóa",
    ContentBefore: "Xóa ",
    ContentMid: " sản phẩm",
    ContentAfter: " đã chọn?",
  },
  DataChangeConfirm: {
    Type: "primary",
    Title: "Thông báo",
    ButtonNegate: "Không lưu",
    ButtonConfirm: "Lưu thay đổi",
    ContentBefore: "Dữ liệu đã bị thay đổi",
    ContentAfter: ", bạn có muốn lưu lại?",
  },
};
export default Dialog;
