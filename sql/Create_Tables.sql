CREATE TABLE apiario (
	codApia INT PRIMARY KEY AUTO_INCREMENT,
	tamanhoApia FLOAT
);

CREATE TABLE apiario_has_logradouro (
	codAhsL INT PRIMARY KEY AUTO_INCREMENT,
	apiarioAhsLFK INT,
	logradouroAhsLFK INT,
	FOREIGN KEY (apiarioAhsLFK) REFERENCES apiario (codApia),
	FOREIGN KEY (logradouroAhsLFK) REFERENCES logradouro (codLogr)
);

CREATE TABLE cadastro (
	codCada INT PRIMARY KEY AUTO_INCREMENT,
	nomeCada VARCHAR(50)
);

CREATE TABLE cliente (
	codCli INT PRIMARY KEY,
	nomeCli VARCHAR(100)
);

CREATE TABLE cliente_has_pessoa (
	codChsP INT PRIMARY KEY AUTO_INCREMENT,
	clienteChsPFK INT,
	pessoaChsPFK INT,
	FOREIGN KEY (pessoaChsPFK) REFERENCES pessoa (codPess),
	FOREIGN KEY (clienteChsPFK) REFERENCES cliente (codCli)
);

CREATE TABLE comeia (
	codCome INT PRIMARY KEY AUTO_INCREMENT,
	apiarioCome INT,
	FOREIGN KEY (apiarioCome) REFERENCES apiario (codApia)
);

CREATE TABLE contato (
	codCont INT PRIMARY KEY AUTO_INCREMENT,
	pessoaCont INT,
	FOREIGN KEY (pessoaCont) REFERENCES pessoa (codPess)
);

CREATE TABLE email (
	codEmai INT PRIMARY KEY AUTO_INCREMENT,
	contatoEmaiFK INT,
	nomeEmai VARCHAR(200),
	FOREIGN KEY (contatoEmaiFK) REFERENCES contato (codCont)
);

CREATE TABLE endereco (
	codEnde INT PRIMARY KEY AUTO_INCREMENT,
	bairroEnde VARCHAR(100),
	cepEnde VARCHAR(8),
	cidadeEnde VARCHAR(100),
	ruaEnde VARCHAR(200),
	ufEnde VARCHAR(2)
);

CREATE TABLE funcionario (
	codFunc INT PRIMARY KEY AUTO_INCREMENT,
	apiarioFuncFK INT,
	pisFunc VARCHAR(20),
	FOREIGN KEY (apiarioFuncFK) REFERENCES apiario (codApia)
);

CREATE TABLE funcionario_has_pessoa (
	codFhsP INT PRIMARY KEY AUTO_INCREMENT,
	funcionarioFhsPFK INT,
	pessoaFhsPFK INT,
	FOREIGN KEY (funcionarioFhsPFK) REFERENCES funcionario (codFunc),
	FOREIGN KEY (pessoaFhsPFK) REFERENCES pessoa (codPess)
);

CREATE TABLE itemPedido (
	codItPe INT PRIMARY KEY AUTO_INCREMENT,
	produtoItPeFK INT,
	pedidoItPeFK INT,
	quantidadeItPe INT,
	valorItPe real,
	FOREIGN KEY (produtoItPeFK) REFERENCES produto (codProd),
	FOREIGN KEY (pedidoItPeFK) REFERENCES pedido (codPedi)
);

CREATE TABLE logradouro (
	codLogr INT PRIMARY KEY AUTO_INCREMENT,
	complementoLogr VARCHAR(50),
	enderecoLogrFK INT,
	numeroLogr INT,
	FOREIGN KEY (enderecoLogrFK) REFERENCES endereco (codEnde)
);

CREATE TABLE lote(
	codLote INT PRIMARY KEY AUTO_INCREMENT,
	comeiaLoteFK INT,
	dataProducaoLote DATE,
	produtoLoteFK INT,
	qualidadeLote char,
	quantidadeLote FLOAT,
	validadeLote DATE,
	FOREIGN KEY (comeiaLoteFK) REFERENCES comeia (codCome),
	FOREIGN KEY (produtoLoteFK) REFERENCES produto (codProd)
);

CREATE TABLE pedido (
	codPedi INT PRIMARY KEY AUTO_INCREMENT,
	clientePediFK INT,
	dataPedi DATE,
	destinoPediFK INT,
	valorVendaPedi real,
	FOREIGN KEY (clientePediFK) REFERENCES cliente (codCli),
	FOREIGN KEY (destinoPediFK) REFERENCES logradouro (codLogr)
);

CREATE TABLE permissao (
	codPerm INT PRIMARY KEY AUTO_INCREMENT,
	nomePerm VARCHAR(50)
);

CREATE TABLE permissao_has_cadastro (
    codPerHsCad INT PRIMARY KEY AUTO_INCREMENT,
	cadastroPhsCFK INT,
	permissaoPhsCFK INT,
	criarPhsC TINYINT,
	consultarPhsC TINYINT,
	alterarPhsC TINYINT,
	apagarPhsC TINYINT,
    FOREIGN KEY (permissaoPhsCFK) REFERENCES permissao (codPerm),
    FOREIGN KEY (cadastroPhsCFK) REFERENCES cadastro (codCada)
);

CREATE TABLE pessoa (
	codPess INT PRIMARY KEY AUTO_INCREMENT,
	logradouroPessFK INT,
	nomePess VARCHAR(100),
	situacaoPessFK INT,
	usuarioPessFK INT,
	FOREIGN KEY (logradouroPessFK) REFERENCES logradouro (codLogr),
	FOREIGN KEY (situacaoPessFK) REFERENCES situacao (codSitu)
);

CREATE TABLE produto (
	codProd INT PRIMARY KEY AUTO_INCREMENT,
	nomeProd VARCHAR(200),
	quantidadeProd FLOAT,
	valorProd real
);

CREATE TABLE situacao (
	codSitu INT PRIMARY KEY AUTO_INCREMENT,
	nomeSitu VARCHAR(50)
);

CREATE TABLE usuario(
	codUsua INT PRIMARY KEY AUTO_INCREMENT,
	nomeUsua VARCHAR(20),
	permissaoUsuaFK INT,
	pessoaUsuaFK INT,
	senhaUsua VARCHAR(256),
	FOREIGN KEY (permissaoUsuaFK) REFERENCES permissao (codPerm),
	FOREIGN KEY (pessoaUsuaFK) REFERENCES pessoa (codPess)
);

CREATE TABLE telefone (
	codTele INT PRIMARY KEY AUTO_INCREMENT,
	numeroTele VARCHAR(11),
	contatoTeleFK INT,
	FOREIGN KEY (contatoTeleFK) REFERENCES contato (codCont)
);

CREATE TABLE tipoPagamento (
	codTiPa INT PRIMARY KEY AUTO_INCREMENT,
	nomeTiPa VARCHAR(50)
);

CREATE TABLE venda (
	codVend INT PRIMARY KEY AUTO_INCREMENT,
	dataVend DATE,
	funcionarioVendFK INT,
	pedidoVendFK INT,
	qtdParcelas INT,
	tipoPagamentoVendFK INT,
	FOREIGN KEY (funcionarioVendFK) REFERENCES funcionario (codFunc),
	FOREIGN KEY (pedidoVendFK) REFERENCES pedido (codPedi),
	FOREIGN KEY (tipoPagamentoVendFK) REFERENCES tipoPagamento (codTiPa)
);
