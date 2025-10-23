<?php
$host = "localhost";
$usuario = "root";       // Cambia si tu usuario es diferente
$contrasena = "";        // Cambia si tu MySQL tiene contraseña
$basededatos = "luceval_dbbb";

$conn = new mysqli($host, $usuario, $contrasena, $basededatos);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
