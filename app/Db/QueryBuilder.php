<?php

namespace Project\Db;

use Project\Db\Connection;

class QueryBuilder
{
    
    private $pdo;

    public function __construct()
    {
        $this->pdo = Connection::getConnection();
    }

    public function select($table, $parameters = [], $first = false, $condition = 'and',  $fetch = \PDO::FETCH_ASSOC)
    {

        $params = array_map(function($p){
            return "$p = :$p";
        }, array_keys($parameters));

        $where = !empty($parameters) ? 'where ' . implode(" {$condition} ", $params) : '';
 
        $s = $this->pdo->prepare("select * from {$table} {$where}");
        try{
            $s->execute($parameters);

            return $first ? $s->fetch($fetch) : $s->fetchAll($fetch);

        }  catch(\PDOException $e){
            return false;
        }
        
    }
    
    public function insert($table, $data)
    {

        $columns = implode(',', array_keys($data));
        $values = ':' . implode(', :', array_keys($data));

        $sql = "INSERT INTO {$table} ({$columns}) VALUES ({$values})";
        $stmt = $this->pdo->prepare($sql);

        try {
            return $stmt->execute($data);
        } catch (\PDOException $ex) {
           // die($ex->getMessage());
            return false;
        }
    }

//2 exemplo insert.
public function inserir($tabela, $dados)
{
$campos = implode(', ', array_keys($dados));
$values = implode(', ', array_values($dados));

$totalInterrogacoes=count($dados);

$interrogacoes=str_repeat('?,', $totalInterrogacoes);
$interrogacoes=substr($interrogacoes,0, -1);//remove a ultima virgula

 $sql = "INSERT INTO {$tabela} ({$campos}) VALUES ({$interrogacoes})";
 $stmt = $this->pdo->prepare($sql);

    try {
            return $stmt->execute($dados);
        } catch (\PDOException $ex) {
            die($ex->getMessage());
            return false;
        }

}






    public function delete($table, $data)
    {   
        $where = key($data) . ' = :' . key($data);
        //die($where);
        $sql = "DELETE FROM {$table} WHERE {$where}";
        $stmt = $this->pdo->prepare($sql);

        try {
           return $stmt->execute($data);
        } catch (\PDOException $ex) {
            die($ex->getMessage());
        }
    }

    public function update($table, $data, $condition)
    {   
        $columns = implode(' =?, ', array_keys($data)) . ' =? ';
        $where = key($condition) . ' = ?';

        $sql = "UPDATE {$table} SET {$columns} WHERE {$where}";
        $stmt = $this->pdo->prepare($sql);

        $dados = array_values($data);
        $dados[] = $condition[key($condition)];
        
        try {
            return $stmt->execute($dados);
        } catch (\PDOException $ex) {
            die($ex->getMessage());
        }
    }

    public function selectItensQuarto($id)
    {
        $sql = "SELECT * from itens inner join tipo_itens on itens.iditens = tipo_itens.iditens where idquarto= :id";

        $query = $this->pdo->prepare($sql);

        $query->bindParam(':id', $id);

        try{
            $query->execute();

            return $query->fetchAll(\PDO::FETCH_ASSOC);
        }catch(\PDOException $e){
            die($e->getMessage());
        }
    }
}
