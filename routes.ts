// Importa componentes do express
import {Router} from 'express';
// Importa TesteController
import TesteController from './src/controllers/TesteController'
import ValidaTeste1 from './src/middlewares/ValidaTeste1';

// Instancia roteador
const Roteador = Router();
// Define rota tipo get que, para funcionar, deve ser requisitada conforme exemplo.
// Exemplo de requisição: localhost:4000/teste/123?num=456// Onde 123 e 456 podem ser substituídos por quaisquer valores
Roteador.get(    // URL com parêmetro :id  
             '/teste/:id',    
             // Aciona função do TesteController   
             ValidaTeste1, 
             new TesteController().teste1);
             export default Roteador;