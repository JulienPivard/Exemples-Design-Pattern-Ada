--  @summary
--  Les données manipulé par les collègues.
--  @description
--  Les données manipulé par les collègues.
--  @group Données
package Donnee_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   subtype Contenu_T is String (1 .. 20);
   --  Le contenu du texte.

end Donnee_P;
