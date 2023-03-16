--  @summary
--  Opération d'addition
--  @description
--  Opération d'addition
--  @group Interpreteur
package Valeur_P.Operateur_P.Addition_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Addition_T is new Operateur_T with private;

   overriding
   function Interprete
      (This : in     Addition_T)
      return Data_P.Valeur_T;

   overriding
   function Image
      (This : in     Addition_T)
      return String;
   --  Produit une représentation de l'opération d'addition.
   --  @param This
   --  L'opération d'addition.
   --  @return La string qui représente l'addition.

   overriding
   function Creer
      (
         Gauche : in     Valeur_Abstraite_T'Class;
         Droite : in     Valeur_Abstraite_T'Class
      )
      return Addition_T;

private

   type Addition_T is new Operateur_T with
      record
         null;
      end record;

   overriding
   function Creer
      (
         Gauche : in     Valeur_Abstraite_T'Class;
         Droite : in     Valeur_Abstraite_T'Class
      )
      return Addition_T
   is
      (
         Addition_T'
            (
               Creer_Parent (Gauche => Gauche, Droite => Droite)
               with null record
            )
      );

end Valeur_P.Operateur_P.Addition_P;
