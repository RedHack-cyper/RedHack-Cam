<?php
$img = $_POST['cat'];
if (!empty($img)) {
    $img = str_replace('data:image/png;base64,', '', $img);
    $img = str_replace(' ', '+', $img);
    $data = base64_decode($img);
    $file = "cam_" . date('Ymd_His') . ".png";
    file_put_contents($file, $data);
}
?>
