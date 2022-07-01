--  @summary
--  Une fabrique de produits html.
--  @description
--  Fabrique plusieurs produits html.
--  @group Fabrique html
package Fabrique_P.Html_P is

   type Fabrique_Html_T is new Fabrique_T with private;
   --  Une fabrique de produit en version deux.

   overriding
   function Creer_Produit_A
      (Fabrique : in     Fabrique_Html_T)
      return Produit_A_P.Produit_T'Class;
   --  Permet de créer un produit de type A version 2.
   --  @param Fabrique
   --  La fabrique.
   --  @return Le produit concret.

   overriding
   function Creer_Produit_B
      (Fabrique : in     Fabrique_Html_T)
      return Produit_B_P.Produit_T'Class;
   --  Permet de créer un produit de type B version 2.
   --  @param Fabrique
   --  La fabrique.
   --  @return Le produit concret.

private

   type Fabrique_Html_T is new Fabrique_T with null record;

end Fabrique_P.Html_P;
