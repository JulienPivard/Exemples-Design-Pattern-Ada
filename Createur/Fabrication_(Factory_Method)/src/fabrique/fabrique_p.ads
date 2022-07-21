with Produit_P;

--  @summary
--  Une fabrique abstraite.
--  @description
--  Une fabrique de produits abstraite.
--  @group Fabrique
package Fabrique_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Fabrique_T is abstract tagged private;
   --  Fabrique abstraite.

   function Fabriquer
      (Fabrique : in Fabrique_T)
      return Produit_P.Produit_T'Class
   is abstract;
   --  Fabrique un produit.
   --  @param Fabrique
   --  Une fabrique d'objet.
   --  @return Un produit.

private

   type Fabrique_T is abstract tagged null record;

end Fabrique_P;
