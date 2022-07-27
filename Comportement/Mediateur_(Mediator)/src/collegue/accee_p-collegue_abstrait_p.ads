--  @summary
--  Un collègue qui va interagir avec le médiateur.
--  @description
--  Un collègue qui va interagir avec le médiateur.
--  @group Médiateur
package Accee_P.Collegue_Abstrait_P
   with
      Pure           => False,
      Preelaborate   => True,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Collegue_T is interface;
   --  Classe héritée par les classes qui vont avoir
   --  besoin de collaborer ensemble.

   procedure Ajouter
      (
         This      : in out Collegue_T;
         Mediateur : in     Mediateur_A;
         Id        : in     Mediateur_P.Id_T
      )
   is abstract;
   --  Le médiateur se signal à son collègue.
   --  @param This
   --  La classe qui a besoin de collaborer.
   --  @param Mediateur
   --  Le médiateur.
   --  @param Id
   --  L'identifiant unique connu du médiateur.

end Accee_P.Collegue_Abstrait_P;
