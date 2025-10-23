<?php
header('Content-Type: application/json; charset=utf-8');

$host = "localhost";     // o "localhost:3307" si usas Laragon
$user = "root";          // tu usuario MySQL
$pass = "";              // tu contraseña (si tienes)
$dbname = "luceval_dbbb";

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    echo json_encode([
        "success" => false,
        "message" => "❌ Error de conexión a MySQL: " . $conn->connect_error
    ]);
    exit;
}

$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
    echo json_encode(["success" => false, "message" => "Datos no válidos o vacíos."]);
    exit;
}

$materia = $conn->real_escape_string($data['materia']);
$grupo   = $conn->real_escape_string($data['grupo']);
$carrera = $conn->real_escape_string($data['carrera']);
$fechas  = json_encode($data['fechas']);

$insertados = 0;
foreach ($data['alumnos'] as $alumno) {
    $nombre = $conn->real_escape_string($alumno['nombre']);
    $asistencia = $conn->real_escape_string(json_encode($alumno['asistencia']));

    $sql = "INSERT INTO asistencia (materia, grupo, alumno, asistencia)
            VALUES ('$materia', '$grupo', '$nombre', '$asistencia')
            ON DUPLICATE KEY UPDATE asistencia = VALUES(asistencia)";

    if ($conn->query($sql)) {
        $insertados++;
    }
}

echo json_encode([
    "success" => true,
    "message" => "✅ Se guardaron $insertados registros correctamente."
]);

$conn->close();
?>

