<?php
include "db_conn.php"; // Include your database connection file

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get form inputs
    $lastName = $_POST['last-name'] ?? '';
    $firstName = $_POST['first-name'] ?? '';
    $birthDate = $_POST['birth-date'] ?? '';
    $position = $_POST['position'] ?? '';
    $weight = $_POST['weight'] ?? 0;
    $jersey = $_POST['jersey'] ?? 0;
    $height = $_POST['height'] ?? 0;
    $team = $_POST['team'] ?? '';
    $phoneNumber = $_POST['phone-number'] ?? '';
    $email = $_POST['email'] ?? '';
    $image = $_FILES['profile-image'] ?? null;

    // Handle file upload
    $imagePath = '';
    if ($image && $image['error'] === 0) {
        $uploadDir = 'imgs/'; // Ensure this directory is writable
        $imagePath = $uploadDir . basename($image['name']);
        if (!move_uploaded_file($image['tmp_name'], $imagePath)) {
            echo json_encode(["status" => "error", "message" => "Image upload failed."]);
            exit;
        }
    }

    // Insert into database
    $sql = "INSERT INTO players 
            (PlayerLName, PlayerFName, PlayerBDate, PlayerPosition, PlayerWeight, PlayerJersey, PlayerHeight, PlayerTeam, PlayerPNumber, PlayerEmail, PlayerImage)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param(
        "sssssddssss",
        $lastName,
        $firstName,
        $birthDate,
        $position,
        $weight,
        $jersey,
        $height,
        $team,
        $phoneNumber,
        $email,
        $imagePath
    );
    $stmt->execute();
    $playerid = $conn->insert_id;
    $stmt->close();


    // Fetch TeamID based on the team name
    $teamQuery = "SELECT TeamID FROM teams WHERE TeamName = ?";
    $teamStmt = $conn->prepare($teamQuery);
    $teamStmt->bind_param("s", $team);
    $teamStmt->execute();
    $teamResult = $teamStmt->get_result();
    $teamRow = $teamResult->fetch_assoc();
    $teamid = $teamRow['TeamID'];
    
    error_log("Firstname: " . var_export($firstName, true));
    error_log("Lastname: " . var_export($lastName, true));
    error_log("Team: " . var_export($team, true));
    error_log("TeamID: " . var_export($teamid, true));
    error_log("PlayerID: " . var_export($playerid, true));
    
    $sql = "INSERT INTO playerstats 
            (TeamID, TeamName, PlayerID, PlayerFName, PlayerLName, GameID)
            VALUES (?, ?, ?, ?, ?, 0)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param(
        "isiss",
        $teamid,
        $team,
        $playerid,
        $firstName,
        $lastName
    );

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Player registered successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Database insertion failed."]);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request method."]);
}
?>
