-- View de Usuário --
CREATE VIEW
  see_usuario
AS
  SELECT
      us.codUsua AS codigo,
      ps.nomePess AS pessoa,
      us.nomeUsua AS usuario,
      pm.nomePerm AS permissao
  FROM
      pessoa AS ps,
      usuario AS us,
      permissao AS pm
  WHERE
      ps.usuarioPessFK = us.codUsua
      AND
      us.permissaoUsuaFK = pm.codPerm;
