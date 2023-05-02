import {Request,Response,NextFunction} from 'express';
// verifica se os parâmetros da requisição são válidos
function ValidaTeste1 (req:Request,res:Response,next:NextFunction) {    
    const id = req.params.id;    
    const num = req.query.num;    
    if (Number(id)>1000 || num==null)    {        
        // Retorna código 400 indicando bad request        
        res.status(400).send("Parâmetros Inválidos");   
     }    
    // chama a próxima função na rota e retorna sua resposta    
    return next();
}
export default ValidaTeste1