<?php
// Conexión a la base de datos (ajusta con tus datos reales)
$host = 'localhost';      // o 127.0.0.1
$db   = 'luceval_dbbb';   // nombre de tu base de datos
$user = 'root';           // usuario MySQL
$pass = '';               // contraseña, usualmente vacía en local
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Para manejar errores con excepciones
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    // Error al conectar
    echo json_encode(['status' => 'error', 'mensaje' => 'Error en la conexión: ' . $e->getMessage()]);
    exit;
}

// Leer JSON enviado desde JS
$data = json_decode(file_get_contents('php://input'), true);

if (!$data) {
    echo json_encode(['status' => 'error', 'mensaje' => 'No se recibieron datos válidos']);
    exit;
}

// Validar que todos los campos estén presentes
if (
    empty($data['matricula']) ||
    empty($data['nombre']) ||
    empty($data['grado']) ||
    empty($data['carrera']) ||
    empty($data['materia'])
) {
    echo json_encode(['status' => 'error', 'mensaje' => 'Faltan datos obligatorios']);
    exit;
}

$matricula = $data['matricula'];
$nombre = $data['nombre'];
$grado = $data['grado'];
$carrera = $data['carrera'];
$materia = $data['materia'];

// Preparar y ejecutar inserción segura
try {
    $stmt = $pdo->prepare("INSERT INTO registro_profesores (matricula, nombre_profesor, grado, carrera, materia) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([$matricula, $nombre, $grado, $carrera, $materia]);
    echo json_encode(['status' => 'ok']);
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'mensaje' => 'Error al guardar datos: ' . $e->getMessage()]);
}
?>
