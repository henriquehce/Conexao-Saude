// Função para lidar com o envio do formulário de cadastro de laudo
document.getElementById('form-cadastro-laudo').addEventListener('submit', function(event) {
    event.preventDefault();

    // Captura os valores do formulário
    const pacienteId = document.getElementById('paciente-select').value;
    const dataLaudo = document.getElementById('data-laudo').value;
    const clinica = document.getElementById('clinica-laudo').value;
    const medico = document.getElementById('medico-laudo').value;
    const exame = document.getElementById('exame-laudo').value;
    const status = document.getElementById('status-laudo').value;

    // Gera um ID para o laudo (por simplicidade, usando a data atual)
    const laudoId = `laudo-${Date.now()}`;

    // Cria uma estrutura para o novo laudo (exibido como exemplo)
    const novoLaudo = {
        id: laudoId,
        pacienteId,
        dataLaudo,
        clinica,
        medico,
        exame,
        status
    };

    // Salvar ou exibir o laudo (pode ser salvo em um banco ou localStorage)
    console.log('Laudo criado:', novoLaudo);

    // Limpar o formulário após adicionar o laudo
    this.reset();

    // Mensagem de confirmação
    alert('Laudo adicionado com sucesso!');
});

// Redirecionar para a visualização de paciente
document.getElementById('view-as-patient-btn').addEventListener('click', function() {
    window.location.href = 'historico-paciente.html';
});
