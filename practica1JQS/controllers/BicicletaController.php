<?php

class bicicleta
{

    public function index()
    {

        $movie = new BicicletaModel();
        $response = $movie->all();
        if (isset($response) && !empty($response)) {
            $json = array(
                'status' => 200,
                'results' => $response
            );
        } else {
            $json = array(
                'status' => 400,
                'results' => "No hay registros"
            );
        }
        echo json_encode(
            $json,
            http_response_code($json["status"])
        );
    }




    public function get($id)
    {
        //Obtener elemento
        $bici = new BicicletaModel();
        //Obtener una pelicula
        $response = $bici->get($id);
        //Si hay respuesta
        if (isset($response) && !empty($response)) {
            //Armar el json
            $json = array(
                'status' => 200,
                'results' => $response
            );
        } else {
            $json = array(
                'status' => 400,
                'results' => "No existe el recurso solicitado"
            );
        }
        echo json_encode(
            $json,
            http_response_code($json["status"])
        );
    }
}
