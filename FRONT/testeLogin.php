<?php
  session_start();
  
  if(isset($_POST['submit'])) 
  {
    // Acessa o banco de dados
    include_once('config.php');
    $login = $_POST['login'];
    $senha = $_POST['senha'];
    $tipo_usuario = $_POST['tipo_usuario'];

    // Consulta para verificar o login tanto por email quanto por CPF
    if($tipo_usuario == 'medico') {
      $login_query = "SELECT * FROM $tipo_usuario WHERE (email = '$login' OR cpf = '$login' OR crm = '$login') AND senha = '$senha'";
    } else {
      $login_query = "SELECT * FROM $tipo_usuario WHERE (email = '$login' OR cpf = '$login') AND senha = '$senha'";
    }
    
    // Executa as consultas
    $result = $conexao->query($login_query);

    // Verifica se encontrou o usuário por email ou CPF
    if(mysqli_num_rows($result) > 0) {
      // Login encontrado
      $user_data = $result->fetch_assoc();
    } else {
      // Se nenhum login for encontrado, redireciona para a página de login
      header('Location: index.php');
      unset($_SESSION['login']);
      unset($_SESSION['senha']);
      exit();
    } 
    
    // Armazena as informações do usuário na sessão
    $_SESSION['login'] = $login;
    $_SESSION['senha'] = $senha;
    $_SESSION['user_id'] = $user_data['id'];  // Armazena o ID do paciente

    // Redireciona para a página de histórico do paciente
    if($tipo_usuario == 'medico') {
      header('Location: medico.html');    
    } else if ($tipo_usuario == 'paciente') {
      header('Location: historico-paciente.php');
    } else {
      header('Locatiom: index.php');    
    }
  } else {
    header('Locatiom: index.php');
  }
?>