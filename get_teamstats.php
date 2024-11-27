<?php
include "db_conn.php";

$sql = "SELECT * FROM teamstats";
$result = $conn->query($sql);

$teams = [];

if ($result->num_rows > 0) {
    // Fetch data
    while ($row = $result->fetch_assoc()) {
        $teams[] = [
            'TeamID' => $row['TeamID'],
            'TeamName' => $row['TeamName'],
            'TeamLogo' => $row['TeamLogo'],
            'TeamColor' => $row['TeamColor'],
            'TeamWins' => $row['TeamWins'],
            'TeamDraws' => $row['TeamDraws'],
            'TeamLosses' => $row['TeamLosses']
        ];
    }
}

$conn->close();

// Convert to JSON format
header('Content-Type: application/json');
echo json_encode($teams);
?>