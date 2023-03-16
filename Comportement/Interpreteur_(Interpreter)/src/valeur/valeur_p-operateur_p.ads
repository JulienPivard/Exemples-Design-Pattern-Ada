private with Ada.Containers.Indefinite_Holders;

--  @summary
--  Valeur interpréteur, un opérateur contenant deux valeurs.
--  @description
--  Valeur interpréteur, un opérateur contenant deux valeurs.
--  @group Interpreteur
package Valeur_P.Operateur_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Operateur_T is abstract new Valeur_Abstraite_T with private;

   overriding
   function Interprete
      (This : in     Operateur_T)
      return Data_P.Valeur_T
   is abstract;

   overriding
   function Image
      (This : in     Operateur_T)
      return String
   is abstract;
   --  Produit une représentation de l'opération.
   --  @param This
   --  L'opération.
   --  @return La string qui représente l'opération.

   function Creer
      (
         Gauche : in     Valeur_Abstraite_T'Class;
         Droite : in     Valeur_Abstraite_T'Class
      )
      return Operateur_T;

private

   package Valeur_Stocke_P is new Ada.Containers.Indefinite_Holders
      (Element_Type => Valeur_Abstraite_T'Class);

   subtype Valeur_T is Valeur_Stocke_P.Holder;

   type Operateur_T is abstract new Valeur_Abstraite_T with
      record
         Gauche : Valeur_T := Valeur_Stocke_P.Empty_Holder;
         Droite : Valeur_T := Valeur_Stocke_P.Empty_Holder;
      end record;

   function Creer
      (
         Gauche : in     Valeur_Abstraite_T'Class;
         Droite : in     Valeur_Abstraite_T'Class
      )
      return Operateur_T
   is
      (
         Operateur_T'
            (
               Gauche => Valeur_Stocke_P.To_Holder (New_Item => Gauche),
               Droite => Valeur_Stocke_P.To_Holder (New_Item => Droite)
            )
      );

end Valeur_P.Operateur_P;
