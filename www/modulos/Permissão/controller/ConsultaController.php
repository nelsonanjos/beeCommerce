<?php
include_once("../webi/model/class-usuario.php");
include_once("../webi/AppController.php");
include_once("../webi/sql/dao.php");

$arrTags = array(
  'module'=>$_GET['module'],
  'request'=>$_GET['request'],
  'link_new'=>"index.php?module=".$_GET['module']."&request=Novo",
  'link_img'=>"www/modulos/".$_GET['module']."/gallery/menu_lateral_p.png",
  'link_home'=>"index.php?module=Home&request=Consulta"
);

$result = $conn->query("SELECT * FROM see_usuario");
$arrUser = array();
if( $result->num_rows > 0){
  while ($row = $result->fetch_assoc()){
    $cod = $row['codigo'];
    $pessoa = $row['pessoa'];
    $usuario = $row['usuario'];
    $permissao = $row['permissao'];

    $arrUser[] = new Usuario($cod, $usuario, $permissao, $pessoa, '');
  }
} else {
}

getTemplate("consult","/begin_consult.tpl",$arrTags);
getTemplate("consult","/top_table.tpl",$arrTags);
if(!empty($arrUser)){
  foreach($arrUser as $user) {
    $arrTags = array(
      'cod'=>$user->gets('cod'),
      'pessoa'=>$user->gets('pessoa'),
      'usuario'=>$user->gets('usuario'),
      'permissao'=>$user->gets('permissao')
    );
    getTemplate("consult","/body_table.tpl",$arrTags);
  }
} else {
    echo '<table><th>Nenhum resultado foi encontrado</th><table>';
}
getTemplate("consult","/bottom_table.tpl",$arrTags);


// include_once("../webi/AppController.php");
//
// $arrTags = array(
//   'module'=>$_GET['module'],
//   'request'=>$_GET['request'],
//   'link_new'=>"index.php?module=".$_GET['module']."&request=Novo",
//   'link_img'=>"/webi/www/modulos/".$_GET['module']."/gallery/menu_lateral_p.png",
//   'link_home'=>"index.php?module=Home&request=Consulta"
//   'id' =>
// );
// getTemplate("consult","/begin_consult.tpl",$arrTags);
// getTemplate("consult","/top_table.tpl",$arrTags);
// //while(as tuplas do bd !=null) {
// getTemplate("consult","/body_table.tpl",$arrTags);
// //}
// getTemplate("consult","/bottom_table.tpl",$arrTags);
?>
