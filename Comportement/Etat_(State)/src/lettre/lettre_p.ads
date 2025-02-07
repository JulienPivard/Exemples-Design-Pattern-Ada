--  @summary
--  L'énumération des lettres utilisable.
--  @description
--  L'énumération des lettres utilisable.
--  @group Lettres
package Lettre_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type ID_Touche_T is
      (
         Lettre_E,
         Lettre_I,
         Lettre_V,
         Lettre_R,
         Lettre_Esc
      );

end Lettre_P;
