package body Utilisateur_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Creer
      return Utilisateur_T
   is
      Transition : Transition_P.Transition_T := Transition_P.Creer;
      Etat       : Etat_P.Etat_T'Class       := Transition.Etat_Initial;
   begin
      return Utilisateur_T'
         (
            Etat       => Etat_Holder_P.To_Holder (New_Item => Etat),
            Transition => Transition
         );
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Presser
      (
         This   : in out Utilisateur_T;
         Lettre : in     Lettre_P.ID_Touche_T
      )
   is
   begin
      case Lettre is
         when Lettre_P.Lettre_E =>
            This.Etat.Reference.Presse_E;
         when Lettre_P.Lettre_I =>
            This.Etat.Reference.Presse_I;
         when Lettre_P.Lettre_V =>
            This.Etat.Reference.Presse_V;
         when Lettre_P.Lettre_R =>
            This.Etat.Reference.Presse_R;
         when Lettre_P.Lettre_Esc =>
            This.Etat.Reference.Presse_Esc;
      end case;

      This.Changer_D_Etat (Touche => Lettre);
   end Presser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Changer_D_Etat
      (
         This   : in out Utilisateur_T;
         Touche : in     Lettre_P.ID_Touche_T
      )
   is
      Il_Faut_Changer_D_Etat : constant Boolean :=
         This.Transition.Il_Faut_Changer_D_Etat
            (
               Etat   => This.Etat.Element,
               Touche => Touche
            );
   begin
      if Il_Faut_Changer_D_Etat then
         Bloc_Changer_D_Etat :
         declare
            Etat : constant Etat_P.Etat_T'Class := This.Transition.Changer_D_Etat
                  (
                     Etat   => This.Etat.Element,
                     Touche => Touche
                  );
         begin
            This.Etat.Replace_Element (New_Item => Etat);
         end Bloc_Changer_D_Etat;
      end if;
   end Changer_D_Etat;
   ---------------------------------------------------------------------------

end Utilisateur_P;
