with Builder_P;

--  @summary
--  Un directeur de construction.
--  @description
--  Un directeur de construction qui va utiliser un monteur
--  pour formater son texte.
--  @group Directeur
package Directeur_P is

   type Directeur_T is tagged private;
   --  Le directeur du monteur.

   procedure Construire
      (
         Directeur : in     Directeur_T;
         Monteur   : in out Builder_P.Monteur_T'Class
      );
   --  Formate le texte au format donné par le monteur.
   --  @param Directeur
   --  Le directeur qui veut formater son texte.
   --  @param Monteur
   --  Le monteur.

private

   type Directeur_T is tagged null record;

end Directeur_P;
