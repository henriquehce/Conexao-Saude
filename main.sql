
use conexao_saude;

-- Criação do banco de dados
CREATE DATABASE sistema_laudo;

-- Seleciona o banco de dados
USE sistema_laudo;

-- Tabela de médicos
CREATE TABLE medico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE exame (
    id_exame INT AUTO_INCREMENT PRIMARY KEY,
    nome_exame VARCHAR(100) NOT NULL,
    tipo_exame VARCHAR(50) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    id_medico INT,
    FOREIGN KEY (id_medico) REFERENCES medico(id)
);


-- Tabela de clientes
CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de laudos
CREATE TABLE laudo (
    id_laudo INT AUTO_INCREMENT PRIMARY KEY,
    data_realizacao DATE NOT NULL,
    id_medico INT,
    id_paciente INT,
    id_exame INT,
    FOREIGN KEY (id_medico) REFERENCES medico(id),
    FOREIGN KEY (id_paciente) REFERENCES cliente(id),
    FOREIGN KEY (id_exame) REFERENCES exame(id_exame)
);

-- Tabela de login
CREATE TABLE login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('medico', 'admin', 'cliente') NOT NULL
);

INSERT INTO medico (cpf, nome, crm) VALUES
('12345678901', 'Dr. João Silva', 'CRM12345'),
('10987654321', 'Dra. Maria Oliveira', 'CRM67890'),
('12332112345', 'Dr. Carlos Mendes', 'CRM11223'),
('45678912300', 'Dra. Fernanda Costa', 'CRM44456'),
('98765432100', 'Dr. Pedro Lima', 'CRM78901'),
('23456789012', 'Dra. Ana Beatriz', 'CRM54321'),
('34567890123', 'Dr. Lucas Martins', 'CRM23456'),
('67890123456', 'Dr. Rafael Almeida', 'CRM09876'),
('78901234567', 'Dra. Julia Campos', 'CRM87654'),
('89012345678', 'Dr. Gustavo Santos', 'CRM34567'),
('90123456789', 'Dra. Tatiane Souza', 'CRM23423'),
('01234567890', 'Dr. Renan Oliveira', 'CRM45678'),
('12345678902', 'Dra. Priscila Dias', 'CRM56789'),
('23456789013', 'Dr. Igor Rocha', 'CRM67812'),
('34567890134', 'Dra. Vanessa Lima', 'CRM78934'),
('45678901245', 'Dr. Fernando Azevedo', 'CRM89012'),
('56789012356', 'Dra. Camila Ribeiro', 'CRM12398'),
('67890123467', 'Dr. Eduardo Santos', 'CRM45789'),
('89012345689', 'Dr. Felipe Moreira', 'CRM23414'),
('90123456790', 'Dra. Renata Pires', 'CRM34511'),
('01234567891', 'Dr. Leonardo Torres', 'CRM45624'),
('12345678903', 'Dra. Paula Mendes', 'CRM56725'),
('23456789014', 'Dr. André Silva', 'CRM67836'),
('34567890145', 'Dra. Patricia Ferreira', 'CRM78947'),
('45678901256', 'Dr. Hugo Carvalho', 'CRM89058'),
('56789012367', 'Dra. Jéssica Rocha', 'CRM12370'),
('67890123478', 'Dr. Bruno Lima', 'CRM45681'),
('78901234589', 'Dra. Thaís Martins', 'CRM67892'),
('89012345690', 'Dr. Diogo Almeida', 'CRM23403'),
('90123456701', 'Dra. Sofia Ribeiro', 'CRM34514'),
('01234567892', 'Dr. Matheus Santos', 'CRM45625'),
('12345678904', 'Dra. Tânia Azevedo', 'CRM56736'),
('23456789015', 'Dr. Samuel Moreira', 'CRM67847'),
('34567890156', 'Dra. Gabriela Nascimento', 'CRM78958'),
('45678901267', 'Dr. Vitor Rocha', 'CRM89069'),
('56789012378', 'Dra. Cíntia Lima', 'CRM12380'),
('67890123489', 'Dr. Igor Torres', 'CRM45691'),
('78901234590', 'Dra. Cristiane Pires', 'CRM67802'),
('89012345601', 'Dr. Alan Martins', 'CRM23424'),
('90123456712', 'Dra. Elaine Ferreira', 'CRM34535'),
('01234567893', 'Dr. Jorge Silva', 'CRM45646'),
('12345678905', 'Dra. Fernanda Costa', 'CRM56757'),
('23456789016', 'Dr. Otávio Almeida', 'CRM67868'),
('34567890167', 'Dra. Camila Rocha', 'CRM78979'),
('56789012389', 'Dra. Renata Lima', 'CRM12391');

INSERT INTO cliente (cpf, nome) VALUES
('98765432100', 'Ana Paula Santos'),
('23456789012', 'Luiz Fernando Costa'),
('34567890123', 'Mariana Almeida'),
('45678901234', 'Carlos Eduardo Lima'),
('56789012345', 'Fernanda Ribeiro'),
('67890123456', 'Roberto Ferreira'),
('78901234567', 'Juliana Tavares'),
('89012345678', 'Rafael Almeida'),
('90123456789', 'Luciana Pires'),
('01234567890', 'Tiago Martins'),
('13579246801', 'Natália Nascimento'),
('24681357902', 'Eduardo Almeida'),
('13580246791', 'Aline Rocha'),
('24691357802', 'Felipe Tavares'),
('46813579024', 'Hugo Costa'),
('68035791246', 'Silvia Martins'),
('35702468913', 'Joana Ribeiro'),
('57924680135', 'Lucas Moreira'),
('79146802357', 'Gustavo Ribeiro'),
('80257913468', 'Fernanda Lima'),
('91368024579', 'Elaine Tavares'),
('02479135680', 'Evelyn Costa');


INSERT INTO exame (nome_exame, tipo_exame, valor, id_medico) VALUES
('Hemograma Completo', 'Laboratorial', 45.00, 1),
('Exame de Sangue', 'Laboratorial', 30.00, 2),
('Radiografia de Tórax', 'Imagem', 150.00, 3),
('Ultrassom Abdominal', 'Imagem', 200.00, 4),
('Ressonância Magnética', 'Imagem', 600.00, 5),
('Tomografia Computadorizada', 'Imagem', 500.00, 6),
('Exame de Urina', 'Laboratorial', 25.00, 7),
('Teste de Colesterol', 'Laboratorial', 40.00, 8),
('Exame de Glicemia', 'Laboratorial', 20.00, 9),
('Eletrocardiograma', 'Imagem', 100.00, 10),
('Exame de Fezes', 'Laboratorial', 35.00, 11),
('Exame de HIV', 'Laboratorial', 50.00, 12),
('Teste de Hepatite B', 'Laboratorial', 60.00, 13),
('Exame de Vitamina D', 'Laboratorial', 70.00, 14),
('Teste de TSH', 'Laboratorial', 65.00, 15),
('Ultrassom Obstétrico', 'Imagem', 250.00, 1),
('Mamografia', 'Imagem', 180.00, 2),
('Exame de Papanicolau', 'Laboratorial', 75.00, 3),
('Cultura de Secreção', 'Laboratorial', 80.00, 4),
('Teste de Alergia', 'Laboratorial', 100.00, 5),
('Exame de Tóxicos', 'Laboratorial', 90.00, 6),
('Teste de Função Pulmonar', 'Laboratorial', 110.00, 7),
('Exame de ECG de Estresse', 'Imagem', 120.00, 8),
('Exame de Sangue Oculto', 'Laboratorial', 55.00, 9),
('Exame de Creatinina', 'Laboratorial', 50.00, 10),
('Radiografia de Coluna', 'Imagem', 140.00, 11),
('Ultrassom de Mama', 'Imagem', 190.00, 12),
('Densitometria Óssea', 'Imagem', 300.00, 13),
('Colangiopancreatografia', 'Imagem', 400.00, 14),
('Exame de Câncer de Próstata', 'Laboratorial', 85.00, 15),
('Exame de Anticorpos', 'Laboratorial', 150.00, 1),
('Teste de Esforço', 'Imagem', 200.00, 2),
('Exame de Pesticidas', 'Laboratorial', 60.00, 3),
('Exame de Ácido Úrico', 'Laboratorial', 50.00, 4),
('Exame de Hormonais', 'Laboratorial', 90.00, 5),
('Teste de Antígeno Prostático', 'Laboratorial', 75.00, 6),
('Ultrassonografia de Tireóide', 'Imagem', 180.00, 7),
('Exame de Rinoscopia', 'Imagem', 50.00, 8),
('Exame de Flebotomia', 'Laboratorial', 40.00, 9),
('Teste de Intolerância à Lactose', 'Laboratorial', 130.00, 10),
('Ultrassom de Articulações', 'Imagem', 160.00, 11),
('Exame de Sangue para Câncer', 'Laboratorial', 200.00, 12),
('Tomografia de Seios Paranasais', 'Imagem', 350.00, 13),
('Exame de Citoquímica', 'Laboratorial', 90.00, 14),
('Testes Genéticos', 'Laboratorial', 400.00, 15),
('Exame de Holter', 'Imagem', 200.00, 1),
('Exame de Colonoscopia', 'Imagem', 450.00, 2),
('Ultrassom de Vascular', 'Imagem', 300.00, 3),
('Exame de COVID-19', 'Laboratorial', 100.00, 4),
('Exame de Lúpus', 'Laboratorial', 110.00, 5),
('Exame de Sífilis', 'Laboratorial', 55.00, 6),
('Teste de HIV 2', 'Laboratorial', 60.00, 7),
('Radiografia Dentária', 'Imagem', 75.00, 8),
('Exame de HCG', 'Laboratorial', 40.00, 9),
('Ultrassonografia Transvaginal', 'Imagem', 200.00, 10);


INSERT INTO laudo (data_realizacao, id_medico, id_paciente, id_exame) VALUES
('2024-09-01', 1, 1, 1),  -- Laudo 1
('2024-09-02', 2, 1, 2),  -- Laudo 2
('2024-09-03', 3, 2, 3),  -- Laudo 3
('2024-09-04', 4, 2, 4),  -- Laudo 4
('2024-09-05', 5, 3, 5),  -- Laudo 5
('2024-09-06', 1, 3, 6),  -- Laudo 6
('2024-09-07', 2, 4, 7),  -- Laudo 7
('2024-09-08', 3, 4, 8),  -- Laudo 8
('2024-09-09', 4, 5, 9),  -- Laudo 9
('2024-09-10', 5, 5, 10), -- Laudo 10
('2024-09-11', 1, 6, 11), -- Laudo 11
('2024-09-12', 2, 6, 12), -- Laudo 12
('2024-09-13', 3, 7, 13), -- Laudo 13
('2024-09-14', 4, 7, 14), -- Laudo 14
('2024-09-15', 5, 8, 15); -- Laudo 15



