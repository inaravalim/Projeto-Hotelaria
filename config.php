<?php
//declaração dos namespaces dos controladores e instanciação dos objetos

//declaração de inicio da sessão para que não seja criada mais de uma vez
session_start();

use Project\Controller\dadosController;
$dadosController = new dadosController();

use Project\Controller\LoginController;
$loginController = new LoginController();


//configuração do banco de dados. Neste projeto, não foram utilizadas
$_ENV['config'] = [
    'host' => 'localhost',
    'dbname' => 'hotel',
    'user' => 'root',
    'password' => '',
];
