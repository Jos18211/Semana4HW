<?php

class TallaModel{
    public $enlace;
   
    public function __construct($name=null,$id=null) {
        $this->enlace=new MySqlConnect();       
    }
    
    public function getTalla($idBicicleta)
    {
        try {
            //Consulta SQL
            $vSQL = "SELECT t.idTalla , t.nombre , t.descripcion  ".
            " FROM  talla t , bicicleta_talla bt".
            " where t.idTalla=bt.idtalla  and bt.idBicicleta=$idBicicleta  ;";
            //Establecer conexión
            $this->enlace->connect();
            //Ejecutar la consulta
            $vResultado = $this->enlace->executeSQL($vSQL);
            //Retornar el resultado
            return $vResultado;
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    
}
?>