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
               Lettre_P.Lettre_E   => Pas_De_Changement_E,
               Lettre_P.Lettre_I   => Insertion_E,
               Lettre_P.Lettre_V   => Visuel_E,
               Lettre_P.Lettre_R   => Remplacement_E,
               Lettre_P.Lettre_Esc => Pas_De_Changement_E
            ),
         Etat_P.Insertion =>
            (
               Lettre_P.Lettre_E   => Pas_De_Changement_E,
               Lettre_P.Lettre_I   => Pas_De_Changement_E,
               Lettre_P.Lettre_V   => Pas_De_Changement_E,
               Lettre_P.Lettre_R   => Pas_De_Changement_E,
               Lettre_P.Lettre_Esc => Commande_E
            ),
         Etat_P.Remplacement =>
            (
               Lettre_P.Lettre_E   => Pas_De_Changement_E,
               Lettre_P.Lettre_I   => Pas_De_Changement_E,
               Lettre_P.Lettre_V   => Pas_De_Changement_E,
               Lettre_P.Lettre_R   => Pas_De_Changement_E,
               Lettre_P.Lettre_Esc => Commande_E
            ),
         Etat_P.Visuel =>
            (
               Lettre_P.Lettre_E   => Pas_De_Changement_E,
               Lettre_P.Lettre_I   => Pas_De_Changement_E,
               Lettre_P.Lettre_V   => Pas_De_Changement_E,
               Lettre_P.Lettre_R   => Pas_De_Changement_E,
               Lettre_P.Lettre_Esc => Commande_E
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
      (Enum => Etat_P.ID_Etat_T);
   package Prochain_Etat_IO is new Ada.Text_IO.Enumeration_IO
      (Enum => Prochain_Etat_T);

   ---------------------------------------------------------------------------
   function Changer_D_Etat
      (
         This   : in out Transition_T;
         Etat   : in     Etat_P.Etat_T'Class;
         Touche : in     Lettre_P.ID_Touche_T
      )
      return Etat_P.Etat_T'Class
   is
      pragma Unreferenced (This);

      Suivant : constant Prochain_Etat_T :=
         Prochain_Etat (Etat.Lire_ID, Touche);
   begin
      case Suivant is
         when Commande_E | Insertion_E | Remplacement_E | Visuel_E =>
            Ada.Text_IO.Put      (Item => "----------- ");
            Etat_IO.Put          (Item => Etat.Lire_ID, Width => 15);
            Ada.Text_IO.Put      (Item => " => ");
            Prochain_Etat_IO.Put (Item => Suivant,      Width => 15);
            Ada.Text_IO.Put      (Item => " -----------");
            Ada.Text_IO.New_Line (Spacing => 1);

         when Pas_De_Changement_E =>
            null;
      end case;

      return
         (
            case Suivant is
               when Pas_De_Changement_E => Etat,
               when Commande_E          => Etat_P.Commande_P.Creer,
               when Insertion_E         => Etat_P.Insertion_P.Creer,
               when Remplacement_E      => Etat_P.Remplacement_P.Creer,
               when Visuel_E            => Etat_P.Visuel_P.Creer
         );
   end Changer_D_Etat;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Transition_P;
