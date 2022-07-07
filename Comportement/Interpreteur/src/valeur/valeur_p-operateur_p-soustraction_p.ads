--  @summary
--  Opération de soustraction.
--  @description
--  Opération de soustraction.
--  @group Interpreteur
package Valeur_P.Operateur_P.Soustraction_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Soustraction_T is new Operateur_T with private;

   overriding
   function Interprete
      (This : in     Soustraction_T)
      return Data_P.Valeur_T;

   overriding
   function Image
      (This : in     Soustraction_T)
      return String;
   --  Produit une représentation de l'opération de soustraction.
   --  @param This
   --  L'opération de soustraction.
   --  @return La string qui représente la soustraction.

   overriding
   function Creer
      (
         Gauche : in     Valeur_Abstraite_T'Class;
         Droite : in     Valeur_Abstraite_T'Class
      )
      return Soustraction_T;

private

   type Soustraction_T is new Operateur_T with
      record
         null;
      end record;

end Valeur_P.Operateur_P.Soustraction_P;
