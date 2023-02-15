<?php

class BicicletaModel{
    public $enlace;

   
    public function __construct() {
        
        $this->enlace=new MySqlConnect();
       
    }
    /*Listar */
    public function all()
    {
        try {
            //Consulta sql
			$vSql = "SELECT * FROM bicicleta   order by nombre asc;";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
				
			// Retornar el objeto
			return $vResultado;
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }

    
    public function get($id)
    {
        try {
            $tallaM=new TallaModel();
            $categoriaM=new CategoriaModel();
            //Consulta sql
			$vSql = "SELECT * FROM bicicleta where idBicicleta=$id";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
         
            $vResultado = $vResultado[0];
           
            $categoria=$categoriaM->getCategoriaBicicleta($vResultado->idCategoria);
            $vResultado->categoria=$categoria;
            //Lista de generos de la pelicula
            $tallas=$tallaM->getTalla($id);
            //Propiedad que se va a agregar al objeto
            $vResultado->tallas=$tallas;
            //Lista de actores de la pelicula
           
			// Retornar el objeto
			return $vResultado;
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }


    public function create($objeto) {
        try {
            //Consulta sql
            //Identificador autoincrementable
            $this->enlace->connect();
			$sql = "Insert into Bici (nombre, descripcion, precioDia, idcategoria)". 
                     "Values ('$objeto->nombre','$objeto->descripcion','$objeto->precioDia','$objeto->idcategoria')";
			
            //Ejecutar la consulta
            //Obtener ultimo insert
			$idbicicleta = $this->enlace->executeSQL_DML_last( $sql);
            //--- Generos ---
            //Crear elementos a insertar en tallas
            foreach( $objeto->tallas as $tallas){
                $dataTallas[]=array($idbicicleta,$tallas);
            }
            /* $dataGenres=array(
                array(1,7),
                array(1,8)
                ); */
                
                foreach($dataTallas as $row){
                    $this->enlace->connect();
                    $valores=implode(',', $row);
                    $sql = "INSERT INTO bicicleta_talla(idBicicleta,idTalla) VALUES(".$valores.");";
                    $vResultado = $this->enlace->executeSQL_DML($sql);
                }
            //--- Actores ---
            //Crear elementos a insertar en categoria
            foreach( $objeto->categoria as $row){
                $dataCategoria[]=array($idbicicleta,$row[0],"$row[1]");
            }
                
            foreach($dataCategoria as $row){
                $this->enlace->connect();
                $sql = "INSERT INTO movie_cast(movie_id,actor_id,role) VALUES($row[0],$row[1],'$row[2]');";
                $vResultado = $this->enlace->executeSQL_DML($sql);
            }
            //Retornar pelicula
            return $this->get($idbicicleta);
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }



    
}
?>