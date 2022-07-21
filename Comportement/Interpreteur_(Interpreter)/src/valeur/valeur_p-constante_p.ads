--  @summary
--  Valeur constante dans une opération.
--  @description
--  Valeur constante dans une opération.
--  @group Interpreteur
package Valeur_P.Constante_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Constante_T is new Valeur_Abstraite_T with private;

   overriding
   function Interprete
      (This : in     Constante_T)
      return Data_P.Valeur_T;
   --  Interprète l'objet en renvoyant sa valeur
   --  @param This
   --  L'objet à interpréter
   --  @return La valeur de la constante.

   overriding
   function Image
      (This : in     Constante_T)
      return String;
   --  Produit une représentation de la constante.
   --  @param This
   --  La constante.
   --  @return La string qui représente la constante.

   function Creer
      (Valeur : in     Data_P.Valeur_T)
      return Constante_T;
   --  Crée un objet valeur constante.
   --  @param Valeur
   --  La valeur à stocker dans l'objet.
   --  @return L'objet valeur constante.

private

   type Constante_T is new Valeur_Abstraite_T with
      record
         Valeur : Data_P.Valeur_T := 0;
      end record;

end Valeur_P.Constante_P;
