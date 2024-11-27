<?php
include 'db_conn.php';

$team1 = $_GET['team1'];
$team2 = $_GET['team2'];

$sql = "SELECT PlayerID, PlayerFName, PlayerLName, PlayerTeam, PlayerJersey
        FROM players
        WHERE PlayerTeam  = ? OR PlayerTeam = ?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $team1, $team2);
$stmt->execute();
$result = $stmt->get_result();

$players = [];
while ($row = $result->fetch_assoc()) {
    $players[] = $row;
}
echo json_encode($players);

$stmt->close();
$conn->close();
?>
