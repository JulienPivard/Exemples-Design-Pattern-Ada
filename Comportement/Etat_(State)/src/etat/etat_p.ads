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

   type ID_Etat_T is
      (
         Commande,
         --  L'état commande.
         Insertion,
         --  L'état insertion.
         Remplacement,
         --  L'état remplacement.
         Visuel
         --  L'état visuel.
      );
   --  L'identifiant de l'état actuel.

   type Etat_T is interface;
   --  Un état d'interprétation des touches du clavier.
   --  Chaque enfant de cette classe pourra interprété
   --  l'appuie sur les touches à sa façon.

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

   function Lire_ID
      (This : in     Etat_T)
      return ID_Etat_T
   is abstract;
   --  Lit l'identifiant unique de l'état.
   --  @param This
   --  L'état en cours.
   --  @return L'identifiant unique de l'état.

end Etat_P;
