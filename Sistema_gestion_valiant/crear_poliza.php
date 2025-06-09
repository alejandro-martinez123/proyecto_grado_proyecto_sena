<?php include("conexion.php"); ?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Crear Póliza</title>
</head>
<body>
    <h2>Crear Nueva Póliza</h2>
    <form action="crear_poliza.php" method="post">
        Cliente ID: <input type="number" name="cliente_id" required><br>
        Vendedor ID: <input type="number" name="vendedor_id" required><br>
        Tipo de Seguro: <input type="text" name="tipo_seguro" required><br>
        Fecha de Vencimiento: <input type="date" name="fecha_vencimiento" required><br>
        <input type="submit" value="Guardar Póliza">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $cliente_id = $_POST["cliente_id"];
        $vendedor_id = $_POST["vendedor_id"];
        $tipo = $_POST["tipo_seguro"];
        $vencimiento = $_POST["fecha_vencimiento"];

        $stmt = $conexion->prepare("INSERT INTO seguros (cliente_id, vendedor_id, tipo_seguro, fecha_vencimiento) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("iiss", $cliente_id, $vendedor_id, $tipo, $vencimiento);

        if ($stmt->execute()) {
            echo "<p>Póliza guardada correctamente.</p>";
        } else {
            echo "<p>Error: " . $stmt->error . "</p>";
        }
        $stmt->close();
    }
    ?>
</body>
</html>
