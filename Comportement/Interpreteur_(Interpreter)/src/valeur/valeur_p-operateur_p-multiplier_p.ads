--  @summary
--  Opération de multiplication.
--  @description
--  Opération de multiplication.
--  @group Interpreteur
package Valeur_P.Operateur_P.Multiplier_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Multiplier_T is new Operateur_T with private;

   overriding
   function Interprete
      (This : in     Multiplier_T)
      return Data_P.Valeur_T;

   overriding
   function Image
      (This : in     Multiplier_T)
      return String;
   --  Produit une représentation de l'opération de multiplication.
   --  @param This
   --  L'opération de multiplication.
   --  @return La string qui représente la multiplication.

   overriding
   function Creer
      (
         Gauche : in     Valeur_Abstraite_T'Class;
         Droite : in     Valeur_Abstraite_T'Class
      )
      return Multiplier_T;

private

   type Multiplier_T is new Operateur_T with
      record
         null;
      end record;

end Valeur_P.Operateur_P.Multiplier_P;
