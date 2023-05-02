// Importa componentes do express
import {Router} from 'express';
// Importa TesteController
import TesteController from './src/controllers/TesteController'
import ProdutoController from './src/controllers/ProdutoController'
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
             Roteador.get('/produtos', new ProdutoController().index);
             Roteador.get('/produtos/:id', new ProdutoController().show);
             Roteador.post('/produtos', new ProdutoController().store);
             Roteador.put('/produtos/:id', new ProdutoController().update);
             Roteador.delete('/produtos/:id', new ProdutoController().delete);
             export default Roteador;