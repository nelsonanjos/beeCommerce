<?php
class Usuario{
  private $cod;
  private $usuario;
  private $permissao;
  private $pessoa;
  private $senha;

  public function __construct($cod, $usuario, $permissao, $pessoa, $senha){
    $this->cod = $cod;
    $this->usuario = $usuario;
    $this->permissao = $permissao;
    $this->pessoa = $pessoa;
    $this->senha = $senha;
  }

  public function gets($att){
    switch ($att) {
      case 'cod':
        return $this->cod;
        break;
      case 'usuario':
        return $this->usuario;
        break;
      case 'permissao':
        return $this->permissao;
        break;
      case 'pessoa':
        return $this->pessoa;
        break;
      case 'senha':
        return $this->senha;
        break;
      default:
        return "0_0 Oops... Erro";
        break;
    }
  }
}
?>
