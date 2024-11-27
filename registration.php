<html>
<head>
    <title>Ball Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-image: url('imgs/court.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            padding-top: 60px;
        }
        .overlay {
            background: linear-gradient(to bottom, rgba(0, 0, 0, .8), #802500);
            backdrop-filter: blur(5px);
            border-radius: 5px;
            padding-top: 20px;
            margin: auto;
            width: 300px;
            text-align: center;
            color: white;
        }
        .overlay2 {
            background: rgba(0, 0, 0, .1);
            backdrop-filter: blur(10px);
            padding: 20px;
            width: 100%;
            text-align: center;
            color: white;
        }
        .overlay h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .overlay p {
            font-size: 14px;
        }
        .overlay a {
            display: block;
            margin: 10px 0;
            font-size: 24px;
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<div id="header"></div>
<script>
    fetch('header.html')
        .then(response => response.text())
        .then(data => {
            document.getElementById('header').innerHTML = data;
        })
        .catch(error => console.error('Error loading the HTML file:', error));

        function previewImage(event) {
            const file = event.target.files[0];
            const imagePreview = document.getElementById('image-preview');
            const uploadLabel = document.getElementById('upload-label'); // Get the label element
            
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    imagePreview.src = e.target.result;
                    imagePreview.classList.remove('hidden'); // Show the image
                    uploadLabel.classList.add('hidden'); // Hide the label
                }
                reader.readAsDataURL(file);
            }
        }


</script>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Check if the file was uploaded without errors
    if (isset($_FILES['profile-image']) && $_FILES['profile-image']['error'] == 0) {
        $fileTmpPath = $_FILES['profile-image']['tmp_name'];
        $fileName = $_FILES['profile-image']['name'];
        $fileSize = $_FILES['profile-image']['size'];
        $fileType = $_FILES['profile-image']['type'];
        
        // Define a new path for the file
        $uploadFileDir = 'imgs/';
        $dest_path = $uploadFileDir . $fileName;

        // Move the file to the destination directory
        if (move_uploaded_file($fileTmpPath, $dest_path)) {
            // Store the path to the file in the database or return a success message
            $response = [
                'status' => 'success',
                'message' => 'File is successfully uploaded.',
                'filePath' => $dest_path // You can return the path here if needed
            ];
        } else {
            $response = [
                'status' => 'error',
                'message' => 'There was an error moving the uploaded file.'
            ];
        }
    } else {
        $response = [
            'status' => 'error',
            'message' => 'No file uploaded or there was an upload error.'
        ];
    }

    // Return response as JSON
    header('Content-Type: application/json');
    echo json_encode($response);
}
?>

<div class="overlay p-8 text-white w-1/2 grid place-items-center" style="padding-bottom: 15px;">
    <form id="register-form" enctype="multipart/form-data" method="POST" action="register_player.php">
    <h1 class="text-3xl font-bold mb-6">REGISTER PLAYER</h1>
    <div class="flex" style="margin-left: auto;">
        <div class="w-100 pr-4">
            <div class="bg-black h-64 w-80 flex items-center justify-center mb-4" style="overflow: hidden; border-radius: 10px;">
                <input type="file" id="profile-image" name="profile-image" class="hidden" accept="image/*" onchange="previewImage(event)">
                <label id="upload-label" for="profile-image" class="cursor-pointer text-white">Upload player profile</label>
                <img id="image-preview" class="mt-2 hidden" style="max-height: 100%; " />
            </div>
            <div class="mb-4">
                <label for="last-name" class="block mb-2">Player Last name:</label>
                <input type="text" id="last-name" name="last-name" class="w-full p-2 text-black">
            </div>
            <div class="mb-4">
                <label for="first-name" class="block mb-2">Player First name:</label>
                <input type="text" id="first-name" name="first-name" class="w-full p-2 text-black">
            </div>
        </div>
        <div class="w-1/2 pl-4">
            <div class="grid grid-cols-2 gap-4 mb-4">
                <div>
                    <label for="birth-date" class="block mb-2">Birth date:</label>
                    <input type="date" id="birth-date" name="birth-date" class="w-full p-2 text-black">
                </div>
                <div>
                    <label for="position" class="block mb-2">Position:</label>
                    <select id="position" name="position" class="w-full p-2 text-black">
                        <option value="">Select Position</option>
                        <option value="Point guard">Point guard (PG)</option>
                        <option value="Shooting guard">Shooting guard (SG)</option>
                        <option value="Small forward">Small forward (SF)</option>
                        <option value="Power forward">Power forward (PF)</option>
                        <option value="Center">Center (C)</option>
                    </select>
                </div>
                <div>
                    <label for="jersey" class="block mb-2">Jersey Number:</label>
                    <input type="number" step="1" id="jersey" name="jersey" class="w-full p-2 text-black" placeholder="Enter weight in kg">
                </div>
                <div>
                    <label for="weight" class="block mb-2">Weight:</label>
                    <input type="number" step="0.01" id="weight" name="weight" class="w-full p-2 text-black" placeholder="Enter weight in kg">
                </div>
                <div>
                    <label for="height" class="block mb-2">Height:</label>
                    <input type="number" step="0.01" id="height" name="height" class="w-full p-2 text-black" placeholder="Enter height in cm">
                </div>
               
                <div>
                    <label for="team" class="block mb-2">Team:</label>
                    <select id="team" name="team" class="w-full p-2 text-black">
                        <option value="">Loading teams...</option>
                    </select>
                </div>
            </div>
            <div class="mb-4">
                <label for="phone-number" class="block mb-2">Phone Number:</label>
                <input type="tel" id="phone-number" name="phone-number" class="w-full p-2 text-black" pattern="[0-9]{4}-[0-9]{3}-[0-9]{4}">
            </div>
            <div class="mb-4">
                <label for="email" class="block mb-2">Email:</label>
                <input type="email" id="email" name="email" class="w-full p-2 text-black">
            </div>
        </div>
    </div>
    <button type="submit" class="bg-blue-700 w-4/5 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
        Register New Player
    </button>
    </form>
    <div class="text-center mt-6">
        <p class="font-bold">TOGETHER, WE BALL.<br>IN BALL, WE ARE TOGETHER</p>
    </div>
</div>

<script>
    
    document.addEventListener("DOMContentLoaded", function () {
        // Fetch the team data from the existing PHP function
        fetch('get_teamstats.php') // Replace with the actual path
            .then(response => response.json())
            .then(data => {
                console.log('Fetched Team Data:', data); // Debug: Log data to confirm structure
                const teamDropdown = document.getElementById('team');
                teamDropdown.innerHTML = ''; // Clear existing options

                if (Array.isArray(data) && data.length > 0) {
                    // Add a default "Select Team" option
                    const defaultOption = document.createElement('option');
                    defaultOption.value = '';
                    defaultOption.textContent = 'Select Team';
                    teamDropdown.appendChild(defaultOption);

                    // Loop through the teams and populate dropdown
                    data.forEach(team => {
                        if (team.TeamName) { // Ensure the TeamName property exists
                            const option = document.createElement('option');
                            option.value = team.TeamName; // Use TeamID as the value
                            option.textContent = team.TeamName; // Display TeamName
                            teamDropdown.appendChild(option);
                        } else {
                            console.error('Team object is missing the "TeamName" property:', team);
                        }
                    });
                } else {
                    // Handle cases where no data is available
                    const errorOption = document.createElement('option');
                    errorOption.value = '';
                    errorOption.textContent = 'No teams available';
                    teamDropdown.appendChild(errorOption);
                }
            })
            .catch(error => {
                console.error('Error fetching teams:', error);

                // Fallback in case of an error
                const teamDropdown = document.getElementById('team');
                teamDropdown.innerHTML = '<option value="">Error loading teams</option>';
            });
    });
    
    form.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent form submission from refreshing the page
    
        const formData = new FormData(form);
    
        // Debug: Log all form entries to console
        for (let [key, value] of formData.entries()) {
            console.log(`${key}: ${value}`);
        }
    
        fetch('register_player.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                alert(data.message);
                form.reset(); // Reset the form
            } else {
                alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred.');
        });
    });
</script>

</head>
</html>