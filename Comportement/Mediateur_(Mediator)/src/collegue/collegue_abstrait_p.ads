with Mediateur_P;

--  @summary
--  Un collègue qui va interagir avec le médiateur.
--  @description
--  Un collègue qui va interagir avec le médiateur.
--  L'interaction se fait sans pointeurs.
--  @group Médiateur
package Collegue_Abstrait_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Collegue_T is interface;
   --  Classe héritée par les classes qui vont avoir
   --  besoin de collaborer ensemble.

   procedure Ajouter
      (
         This      : in out Collegue_T;
         Mediateur : in     Mediateur_P.Mediateur_T'Class;
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

end Collegue_Abstrait_P;
