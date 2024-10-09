<?php
    session_start();
    if((!isset($_SESSION['login']) == true ) and (!isset($_SESSION['senha']) == true)) {
        unset($_SESSION['login']);
        unset($_SESSION['senha']);
        header('Location: index.php');
    }
    include_once('config.php');
    $id = $_SESSION['user_id'];

    $sql = "SELECT nome FROM paciente WHERE id =  '$id'";

    $result = $conexao->query($sql);
    $row = $result->fetch_assoc();  
    $logado = $row['nome'];
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Histórico de Laudos</title>
    <!-- FontAwesome para ícones -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="historico-paciente.css" />
</head>
<body>
    <!-- Mini menu com foto/ícone e nome do paciente -->
    <header class="header-paciente">
        <div class="menu-paciente" onclick="abrirMenuPaciente()">
            <!-- Ícone de usuário para o perfil -->
            <i class="fas fa-user-circle perfil-icone"></i>
            <?php
                echo $logado;
            ?>
            <i class="fas fa-caret-down"></i>
        </div>
        <!-- Menu dropdown oculto inicialmente -->
        <ul class="dropdown-menu" id="menu-dropdown">
            <li onclick="voltarPaginaInicial()">Voltar à Página Inicial</li>
        </ul>
    </header>
    <main>
        <h1 class="historico">Histórico</h1>
        <section class="laudos-medicos">
            <ul class="lista-atendimentos">
                <!-- Lista de atendimentos com exemplos de dados -->
                <li class="item-atendimento" data-laudo="1" onclick="mostrarDetalhes(1)">
                    <div class="container">
                        <div class="info">
                            <div>
                                <span class="titulo-atendimento">Atendimento:</span> 12345678901234578
                                <br />
                                <span class="titulo-atendimento">Clínica:</span> Clínica de Exames Lab <br />
                                <span class="titulo-atendimento">Médico:</span> João Kleber <br />
                            </div>
                            <div class="atendimento">
                                <span>16/09/2024</span>
                                <span class="titulo-atendimento">Data de atendimento</span>
                            </div>
                        </div>
                    </div> 
                    <p class="status">Pronto</p> 
                </li>
                <!-- Outros exemplos de atendimentos -->
                <li class="item-atendimento" data-laudo="2" onclick="mostrarDetalhes(2)">
                    <div class="container">
                        <div class="info">
                            <div>
                                <span class="titulo-atendimento">Atendimento:</span> 98765432109876543
                                <br />
                                <span class="titulo-atendimento">Clínica:</span> Hospital Central <br />
                                <span class="titulo-atendimento">Médico:</span> Ana Silva <br />
                            </div>
                            <div class="atendimento">
                                <span>14/08/2024</span>
                                <span class="titulo-atendimento">Data de atendimento</span>
                            </div>
                        </div>
                    </div> 
                    <p class="status">Pronto</p> 
                </li>
                <!-- Adicione outros itens conforme necessário... -->
            </ul>
        </section>

        <!-- Detalhes dos laudos (oculto por padrão) -->
        <div class="laudo-detalhes" id="laudo-detalhes">
            <!-- Detalhes do laudo 1 -->
            <div class="laudo-conteudo" data-laudo="1" style="display: none;">
                <h2>Detalhes do Laudo</h2>
                <span class="titulo-atendimento">Atendimento:</span> 12345678901234578 <br />
                <span class="titulo-atendimento">Clínica:</span> Clínica de Exames Lab <br />
                <span class="titulo-atendimento">Médico:</span> João Kleber <br />
                <div class="atendimento-aberto">
                    <span>16/09/2024</span>
                    <span class="titulo-atendimento">Data de atendimento</span>
                </div>
                <ul class="lista-exames">
                    <li class="exames">Exame de Sangue - Hemograma Completo</li>
                </ul>
            </div>
            <!-- Detalhes do laudo 2 -->
            <div class="laudo-conteudo" data-laudo="2" style="display: none;">
                <h2>Detalhes do Laudo</h2>
                <span class="titulo-atendimento">Atendimento:</span> 98765432109876543 <br />
                <span class="titulo-atendimento">Clínica:</span> Hospital Central <br />
                <span class="titulo-atendimento">Médico:</span> Ana Silva <br />
                <div class="atendimento-aberto">
                    <span>14/08/2024</span>
                    <span class="titulo-atendimento">Data de atendimento</span>
                </div>
                <ul class="lista-exames">
                    <li class="exames">Raio-X - Tórax</li>
                </ul>
            </div>
        </div>
    </main>
    <footer></footer>
    <script src="historico-paciente.js"></script>
</body>
</html>
