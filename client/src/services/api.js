import axios from 'axios'

export default () => {
    return axios.create({
        baseURL: `http://204.44.81.17/`
    })
}