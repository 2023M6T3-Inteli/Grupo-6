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
        title: "Teste de carga K6",
        description: "É uma ferramenta muito interessante para testar a performance de uma API ou mais APIs",
        category: "Teste",
        createdAt: "2021-08-31T00:00:00.000Z",
        creator: "0050c9d7-9afc-4a78-b22f-3c691062de72"
    });
    
    const params = {
    headers: {
        'Content-Type': 'application/json',
    },};

    const response = http.post(url, payload, params);
    console.log(response.body);
    sleep(1); // aguarda 1 segundo antes de enviar a próxima solicitação
}
