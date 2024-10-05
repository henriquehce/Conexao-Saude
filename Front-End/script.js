const medicoBt = document.querySelector('.login-botao--medico')
const pacienteBt = document.querySelector('.login-botao--paciente')
const botoes = document.querySelectorAll(
  '.login-botao--paciente, .login-botao--medico'
)
const instrucao = document.querySelector('.login-instrucao')
const login = document.querySelector('.login-usuario')
const senha = document.querySelector('.login-senha')
const imagemLogin = document.querySelector('.imagem-login')
const enviarBt = document.querySelector('.login-entrar')
 

// Evento para o botão do médico
medicoBt.addEventListener('click', () => {
  alterarContexto('medico') // Chama a função sem passar 'contexto'
  medicoBt.classList.add('active') // Adiciona a classe 'active' ao botão médico
})

// Evento para o botão do paciente
pacienteBt.addEventListener('click', () => {
  alterarContexto('paciente') // Chama a função sem passar 'contexto'
  pacienteBt.classList.add('active') // Adiciona a classe 'active' ao botão médico
})

// Função para remover a classe 'active' de todos os botões
function alterarContexto(contexto) {
  botoes.forEach(function (botao) {
    botao.classList.remove('active') // Remove a classe 'active' de cada botão
  })
  switch (contexto) {
    case 'medico':
      instrucao.innerHTML = `Realize o seu login como medico, colocando o seu login e senha cadastrados!!`
      login.setAttribute('placeholder', 'Digite o seu e-mail, CPF ou CRM')
      imagemLogin.setAttribute('alt', 'Imagem médico')
      break
    case 'paciente':
      instrucao.innerHTML = `Realize o seu login como paciente, colocando o seu login e senha cadastrados!!`
      login.setAttribute('placeholder', 'Digite o seu e-mail ou CPF')
      imagemLogin.setAttribute('alt', 'Imagem paciente')
      break
    default:
      break
  }
}

enviarBt.addEventListener('click', function () {
  window.location.href = './paciente.html'
})

