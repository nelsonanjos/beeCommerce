<?php
include_once("AppController.php");
$arrTags = array(
  'user'=>$_SESSION['usr'],
  'module'=>$_GET['module'],
  'request'=>$_GET['request'],
);
getTemplate("consult","/title.tpl",$arrTags);

$id=0;
foreach (getNomeModulos() as $modulo) {
  $arrTags = array(
    'modulo'=>$modulo,
    'id'=>$id,
    'link_modulo'=>"index.php?module=".$modulo."&request=Consulta",
    '__ROOT__'=>__ROOT__
  );
  getTemplate("consult","/button.tpl",$arrTags);
  $id++;
}

?>
