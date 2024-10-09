<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConexãoSaúde - Portal de Laudos</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <!-- Seção de Login -->
        <div class="login-section">
            <!-- Logo e Título -->
            <div class="header">
                <img src="./imagens/logo.jpg" alt="Logo ConexãoSaúde" class="logo-img">
                <h1>ConexãoSaúde - Portal de Laudos</h1>
            </div>

            <!-- Botões de escolha de login -->
            <div class="login-type">
                <button id="paciente-btn" class="active">Paciente</button>
                <button id="medico-btn">Médico</button>
            </div>

            <!-- Instruções e Formulário -->
            <div id="instruction">
                <h2>Instrução para Paciente</h2>
            </div>
            <form class="login-form" action="testeLogin.php" method="POST">
                <input type="text" name=login id="login" placeholder="Digite seu E-mail ou CPF" required>
                <input type="password" name="senha" id="senha" placeholder="Digite sua senha" required>
                <input type="hidden" name="tipo_usuario" id="tipo_usuario" value="paciente">
                <button type="submit" name="submit" id="submit">Entrar</button>
                <a href="#" class="forgot-password" onclick="openForgotPassword()">Esqueceu a sua senha?</a>
            </form>            
        </div>

        <!-- Seção da Imagem -->
        <div class="image-section">
            <img id="paciente-img" src="./imagens/paciente.jpg" alt="Imagem Paciente" style="width: 100%; height: 100%; object-fit: cover;" />
            <img id="medico-img" src="./imagens/medico.jpg" alt="Imagem Médico" style="display: none; width: 100%; height: 100%; object-fit: cover;" />
        </div>
    </div>

    <!-- Modal de Recuperação de Senha -->
    <div id="forgot-password-modal" class="modal" style="display: none;">
        <div class="modal-content">
            <h2>Recuperar Senha</h2>
            <form id="recover-form" onsubmit="handlePasswordRecovery(event)">
                <label for="recovery-email">Digite seu E-mail:</label>
                <input type="email" id="recovery-email" placeholder="E-mail de login" required>
                <button type="submit">Enviar</button>
                <button type="button" onclick="closeForgotPasswordModal()">Cancelar</button>
            </form>
            <p id="recovery-message" style="display: none;">Um e-mail de recuperação foi enviado para o seu e-mail.</p>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>
