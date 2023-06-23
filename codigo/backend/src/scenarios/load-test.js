import http from 'k6/http';
import { sleep } from 'k6';

const BASE_URL = 'http://localhost:3000';


// export default function get() {
//     const endpoint = '/posts';
//     const url = `${BASE_URL}${endpoint}`;
//     const response = http.get(url);
//     console.log(response.body);   
//     sleep(1); // aguarda 1 segundo antes de enviar a próxima solicitação
// }

export default function post() {
    const endpoint = '/post';
    const url = `${BASE_URL}${endpoint}`;

    const payload = JSON.stringify({
        title: "Testes de carga com K6",
        description: "Testando a ferramenta K6 para testes de carga",
        category: "Teste",
        createdAt: "2021-08-31T00:00:00.000Z",
        creator: "John Doe"
    });
    
    const params = {
    headers: {
        'Content-Type': 'application/json',
    },};

    const response = http.post(url, payload, params);
    console.log(response.body);
    sleep(1); // aguarda 1 segundo antes de enviar a próxima solicitação
}
