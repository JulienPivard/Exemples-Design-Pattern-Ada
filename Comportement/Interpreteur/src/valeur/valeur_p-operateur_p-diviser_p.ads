--  @summary
--  Opération de division.
--  @description
--  Opération de division.
--  @group Interpreteur
package Valeur_P.Operateur_P.Diviser_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   Ope_Droite_Vaut_Zero : exception;

   type Diviser_T is new Operateur_T with private;

   overriding
   function Interprete
      (This : in     Diviser_T)
      return Data_P.Valeur_T;

   overriding
   function Image
      (This : in     Diviser_T)
      return String;
   --  Produit une représentation de l'opération de division.
   --  @param This
   --  L'opération de division.
   --  @return La string qui représente la division.

   overriding
   function Creer
      (
         Gauche : in     Valeur_Abstraite_T'Class;
         Droite : in     Valeur_Abstraite_T'Class
      )
      return Diviser_T;

private

   type Diviser_T is new Operateur_T with
      record
         null;
      end record;

end Valeur_P.Operateur_P.Diviser_P;
