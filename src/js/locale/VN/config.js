import Cookies from "js-cookie";
const Config = {
  config: {
    headers: {
      Authorization: "Bearer " + Cookies.get("myCookie"),
    },
  },
};
export default Config;
