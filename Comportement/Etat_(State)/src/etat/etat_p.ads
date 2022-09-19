--  @summary
--  Interface pour la classe abstraite Etat.
--  @description
--  Interface pour la classe abstraite Etat.
--  @group Etat
package Etat_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Id_Etat_T is (Commande, Insertion);

   type Id_Touche_T is
      (
         Lettre_E,
         Lettre_I,
         Lettre_V,
         Lettre_R,
         Lettre_Esc
      );

   type Etat_T is interface;

   procedure Presse_E
      (This : in out Etat_T)
   is abstract;

   procedure Presse_I
      (This : in out Etat_T)
   is abstract;

   procedure Presse_V
      (This : in out Etat_T)
   is abstract;

   procedure Presse_R
      (This : in out Etat_T)
   is abstract;

   procedure Presse_Esc
      (This : in out Etat_T)
   is abstract;

   function Lire_Id
      (This : in     Etat_T)
      return Id_Etat_T
   is abstract;

end Etat_P;
