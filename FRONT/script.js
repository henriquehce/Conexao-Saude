const tipo_usuario = document.getElementById('tipo_usuario')

// Alternar entre "Paciente" e "Médico"
document.getElementById('paciente-btn').addEventListener('click', function () {
  document.getElementById('instruction').innerHTML =
    '<h2>Instrução para Paciente</h2>'
  this.classList.add('active')
  tipo_usuario.value = 'paciente'
  document.getElementById('medico-btn').classList.remove('active')
  document.getElementById('paciente-img').style.display = 'block'
  document.getElementById('medico-img').style.display = 'none'
})

document.getElementById('medico-btn').addEventListener('click', function () {
  document.getElementById('instruction').innerHTML =
    '<h2>Instrução para Médico</h2>'
  this.classList.add('active')
  tipo_usuario.value = 'medico'
  document.getElementById('paciente-btn').classList.remove('active')
  document.getElementById('medico-img').style.display = 'block'
  document.getElementById('paciente-img').style.display = 'none'
})

// Função para redirecionar ao clicar em "Entrar"
function handleLogin(event) {
  event.preventDefault() // Impede o envio do formulário
  const userType = document
    .querySelector('.login-type button.active')
    .textContent.trim()
  if (userType === 'Paciente') {
    window.open('historico-paciente.html', '_blank')
  } else {
    window.open('medico.html', '_blank')
  }
}

// Função para abrir o modal de recuperação de senha
function openForgotPassword() {
  document.getElementById('forgot-password-modal').style.display = 'flex'
}

// Função para fechar o modal de recuperação de senha
function closeForgotPasswordModal() {
  document.getElementById('forgot-password-modal').style.display = 'none'
}

// Função para manipular a recuperação de senha
function handlePasswordRecovery(event) {
  event.preventDefault() // Impede o envio do formulário
  const email = document.getElementById('recovery-email').value
  document.getElementById('recovery-message').style.display = 'block'
  alert(`E-mail de recuperação enviado para: ${email}`)
}
