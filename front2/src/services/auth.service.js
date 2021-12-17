import axios from 'axios';
const API_URL = 'http://localhost:9988/api/';

class AuthService {
  login(user) {
    return axios
      .post(API_URL + 'login_check', {
        username: user.username,
        password: user.password,
      })
      .then(response => {
        if (response.data.accessToken) {
          localStorage.setItem('user', JSON.stringify(response.data));
        }
        return response.data;
      });
  }

  logout() {
    localStorage.removeItem('user');
  }
  register(user) {
    return axios.post(API_URL + 'register', {
      email: user.email,
      password: user.password
    });
  }
}
