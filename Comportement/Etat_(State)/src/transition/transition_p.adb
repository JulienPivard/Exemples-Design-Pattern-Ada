with Ada.Text_IO;

with Etat_P.Commande_P;
with Etat_P.Insertion_P;
with Etat_P.Remplacement_P;
with Etat_P.Visuel_P;

package body Transition_P
   with Spark_Mode => Off
is

   Prochain_Etat : constant Table_De_Transition_T := Table_De_Transition_T'
      (
         Etat_P.Commande  =>
            (
               Lettre_P.Lettre_E   => Pas_De_Changement,
               Lettre_P.Lettre_I   => Insertion,
               Lettre_P.Lettre_V   => Visuel,
               Lettre_P.Lettre_R   => Remplacement,
               Lettre_P.Lettre_Esc => Pas_De_Changement
            ),
         Etat_P.Insertion =>
            (
               Lettre_P.Lettre_E   => Pas_De_Changement,
               Lettre_P.Lettre_I   => Pas_De_Changement,
               Lettre_P.Lettre_V   => Pas_De_Changement,
               Lettre_P.Lettre_R   => Pas_De_Changement,
               Lettre_P.Lettre_Esc => Commande
            ),
         Etat_P.Remplacement =>
            (
               Lettre_P.Lettre_E   => Pas_De_Changement,
               Lettre_P.Lettre_I   => Pas_De_Changement,
               Lettre_P.Lettre_V   => Pas_De_Changement,
               Lettre_P.Lettre_R   => Pas_De_Changement,
               Lettre_P.Lettre_Esc => Commande
            ),
         Etat_P.Visuel =>
            (
               Lettre_P.Lettre_E   => Pas_De_Changement,
               Lettre_P.Lettre_I   => Pas_De_Changement,
               Lettre_P.Lettre_V   => Pas_De_Changement,
               Lettre_P.Lettre_R   => Pas_De_Changement,
               Lettre_P.Lettre_Esc => Commande
            )
      );

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

   package Etat_IO          is new Ada.Text_IO.Enumeration_IO
      (Enum => Etat_P.Id_Etat_T);
   package Prochain_Etat_IO is new Ada.Text_IO.Enumeration_IO
      (Enum => Prochain_Etat_T);

   ---------------------------------------------------------------------------
   function Changer_D_Etat
      (
         This   : in out Transition_T;
         Etat   : in     Etat_P.Etat_T'Class;
         Touche : in     Lettre_P.Id_Touche_T
      )
      return Etat_P.Etat_T'Class
   is
      pragma Unreferenced (This);

      Suivant : constant Prochain_Etat_T :=
         Prochain_Etat (Etat.Lire_Id, Touche);
   begin
      case Suivant is
         when Commande | Insertion | Remplacement | Visuel =>
            Ada.Text_IO.Put      (Item => "----------- ");
            Etat_IO.Put          (Item => Etat.Lire_Id, Width => 15);
            Ada.Text_IO.Put      (Item => " => ");
            Prochain_Etat_IO.Put (Item => Suivant,      Width => 15);
            Ada.Text_IO.Put      (Item => " -----------");
            Ada.Text_IO.New_Line (Spacing => 1);
         when Pas_De_Changement =>
            null;
      end case;

      return
         (
            case Suivant is
               when Pas_De_Changement => Etat,
               when Commande          => Etat_P.Commande_P.Creer,
               when Insertion         => Etat_P.Insertion_P.Creer,
               when Remplacement      => Etat_P.Remplacement_P.Creer,
               when Visuel            => Etat_P.Visuel_P.Creer
         );
   end Changer_D_Etat;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Transition_P;
