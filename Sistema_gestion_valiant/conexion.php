<?php
$host = "localhost";
$usuario = "root";
$clave = "";
$base_datos = "bd_seguros_valiant";

$conexion = new mysqli($host, $usuario, $clave, $base_datos);

if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}
?>
