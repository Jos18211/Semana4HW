<?php

class CategoriaModel{
    public $enlace;

   
    public function __construct() {       
        $this->enlace=new MySqlConnect();       
    }
  
    public function getCategoriaBicicleta($idCategoria){
        try {
            //Consulta sql
			$vSql = "SELECT c.idCategoria,c.nombre FROM categoria c where c.idCategoria=$idCategoria;";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
			// Retornar el objeto
			return $vResultado;
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }

}
?>
