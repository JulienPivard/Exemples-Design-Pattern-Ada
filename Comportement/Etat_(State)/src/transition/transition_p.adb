with Ada.Text_IO;

with Etat_P.Commande_P;
with Etat_P.Insertion_P;

package body Transition_P
   with Spark_Mode => Off
is

   Prochain_Etat : constant Table_De_Transition_T := Table_De_Transition_T'
      (
         Etat_P.Commande  =>
            (
               Etat_P.Lettre_E   => Pas_De_Changement,
               Etat_P.Lettre_I   => Insertion,
               Etat_P.Lettre_V   => Pas_De_Changement,
               Etat_P.Lettre_R   => Pas_De_Changement,
               Etat_P.Lettre_Esc => Pas_De_Changement
            ),
         Etat_P.Insertion =>
            (
               Etat_P.Lettre_E   => Pas_De_Changement,
               Etat_P.Lettre_I   => Pas_De_Changement,
               Etat_P.Lettre_V   => Pas_De_Changement,
               Etat_P.Lettre_R   => Pas_De_Changement,
               Etat_P.Lettre_Esc => Commande
            )
      );

   ---------------------------------------------------------------------------
   function Creer
      return Transition_T
   is
      Transition : Transition_P.Transition_T;
   begin
      return Transition;
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Etat_Initial
      (This : in out Transition_T)
      return Etat_P.Etat_T'Class
   is
      pragma Unreferenced (This);

      Etat : constant Etat_P.Commande_P.Commande_T :=
         Etat_P.Commande_P.Creer;
   begin
      return Etat;
   end Etat_Initial;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Changer_D_Etat
      (
         This   : in out Transition_T;
         Etat   : in     Etat_P.Etat_T'Class;
         Touche : in     Etat_P.Id_Touche_T
      )
      return Etat_P.Etat_T'Class
   is
      pragma Unreferenced (This);

      Suivant : constant Prochain_Etat_T :=
         Prochain_Etat (Etat.Lire_Id, Touche);
   begin
      case Suivant is
         when Commande =>
            Ada.Text_IO.Put_Line (Item => "----------- Commande  -----------");
         when Insertion =>
            Ada.Text_IO.Put_Line (Item => "----------- Insertion -----------");
         when Pas_De_Changement =>
            null;
      end case;

      return
         (
            case Suivant is
               when Pas_De_Changement => Etat,
               when Commande          => Etat_P.Commande_P.Creer,
               when Insertion         => Etat_P.Insertion_P.Creer
         );
   end Changer_D_Etat;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Transition_P;
