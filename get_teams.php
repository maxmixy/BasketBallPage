<?php
include "db_conn.php";

// Query to fetch all players, ordered by team and jersey number
$sql = "SELECT * FROM players ORDER BY PlayerTeam ASC, PlayerJersey ASC;";
$result = $conn->query($sql);

$teams = [];

if ($result->num_rows > 0) {
    // Fetch data
    while ($row = $result->fetch_assoc()) {
        // Use PlayerTeam as the team identifier (or ensure team_id is properly defined in your database)
        $teamName = $row['PlayerTeam'];

        // Initialize team array if it doesn't exist
        if (!isset($teams[$teamName])) {
            $teams[$teamName] = [
                'name' => $teamName,
                'players' => []
            ];
        }

        // Append player data to the corresponding team
        $teams[$teamName]['players'][] = [
            'PlayerID' => $row['PlayerID'],
            'PlayerImage' => $row['PlayerImage'],
            'PlayerLName' => $row['PlayerLName'],
            'PlayerFName' => $row['PlayerFName'],
            'PlayerBDate' => $row['PlayerBDate'],
            'PlayerPosition' => $row['PlayerPosition'],
            'PlayerWeight' => $row['PlayerWeight'],
            'PlayerHeight' => $row['PlayerHeight'],
            'PlayerJersey' => $row['PlayerJersey'],
            'PlayerPNumber' => $row['PlayerPNumber'],
            'PlayerEmail' => $row['PlayerEmail']
        ];
    }
}

$conn->close();

// Convert the associative array to a numerically indexed array for JSON encoding
header('Content-Type: application/json');
echo json_encode(array_values($teams));
?>
