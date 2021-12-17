import axios from "axios"
const instancia = axios.create({
    baseURL:'http://localhost:9988/api',
    timeout:1000
})
export default instancia
