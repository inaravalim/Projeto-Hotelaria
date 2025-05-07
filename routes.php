<?php
//rotas da aplicação
//a variável $uri já contém os dados da rota solicitada

switch ($uri) {
    
    case '/';
        
        $dadosController->index();
       
        break;

    case '/register';

        $loginController->register();
        break;


    case '/post-register';

         $loginController->postRegister();
        break;

    case '/login';

        $loginController->login();
        break;

    case '/usuario';

        $dadosController->index();
        break;
    
    case '/start';

        $dadosController->start();
        break;


   
        case '/logout';

        $loginController->logout();
        break;
        
        case '/alterar';

        $dadosController->pagAlterar();
        break;

        case '/alterado';
        $dadosController->alterar();
        break;

         case '/deletar';
        $dadosController->deletar();
        break;

         case '/reservar';
        $dadosController->reservar();
        break;

         case '/cadastroReserva';
        $dadosController->cadastroReserva();
        break;
    default:
        die('Essa rota não é valida');
        break;
}
