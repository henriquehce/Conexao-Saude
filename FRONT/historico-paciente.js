// Abre ou fecha o menu dropdown do paciente
function abrirMenuPaciente() {
    const menuDropdown = document.getElementById('menu-dropdown');
    menuDropdown.style.display = menuDropdown.style.display === 'block' ? 'none' : 'block';
}

// Redireciona para a página inicial ao clicar em "Voltar à Página Inicial"
function voltarPaginaInicial() {
    window.location.href = 'index.html'; // Mudar para a URL correta da página inicial
}

// Fecha o menu dropdown se clicar fora
document.addEventListener('click', (event) => {
    const menuPaciente = document.querySelector('.menu-paciente');
    const menuDropdown = document.getElementById('menu-dropdown');

    // Se o clique foi fora do menu dropdown e fora do botão de menu
    if (!menuDropdown.contains(event.target) && !menuPaciente.contains(event.target)) {
        menuDropdown.style.display = 'none';
    }
});

// Função para mostrar detalhes ao clicar no atendimento
function mostrarDetalhes(laudoId) {
    // Oculta todos os detalhes de laudos
    document.querySelectorAll('.laudo-conteudo').forEach((conteudo) => {
        conteudo.style.display = 'none';
    });

    // Exibe o conteúdo do laudo correspondente ao clicar
    const detalhesConteudo = document.querySelector(`.laudo-conteudo[data-laudo="${laudoId}"]`);
    if (detalhesConteudo) {
        detalhesConteudo.style.display = 'block';
        // Exibe a área de detalhes do laudo à direita
        document.getElementById('laudo-detalhes').style.display = 'block';
    }
}


// Adiciona evento de clique para todos os botões de expandir
document.querySelectorAll('.botao-expandir').forEach((botao) => {
    botao.addEventListener('click', (event) => {
        // Seleciona o item de atendimento correspondente ao botão clicado
        const itemAtendimento = event.target.closest('.item-atendimento');
        const laudoId = itemAtendimento.getAttribute('data-laudo');

        // Chama a função para mostrar detalhes
        mostrarDetalhes(laudoId);
    });
});
