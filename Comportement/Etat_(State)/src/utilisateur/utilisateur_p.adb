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
   procedure Presse_E
      (This : in out Utilisateur_T)
   is
   begin
      This.Etat.Reference.Presse_E;
      This.Changer_D_Etat (Touche => Etat_P.Lettre_E);
   end Presse_E;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Presse_I
      (This : in out Utilisateur_T)
   is
   begin
      This.Etat.Reference.Presse_I;
      This.Changer_D_Etat (Touche => Etat_P.Lettre_I);
   end Presse_I;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Presse_Esc
      (This : in out Utilisateur_T)
   is
   begin
      This.Etat.Reference.Presse_Esc;
      This.Changer_D_Etat (Touche => Etat_P.Lettre_Esc);
   end Presse_Esc;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Changer_D_Etat
      (
         This   : in out Utilisateur_T;
         Touche : in     Etat_P.Id_Touche_T
      )
   is
      Etat : constant Etat_P.Etat_T'Class := This.Transition.Changer_D_Etat
         (
            Etat   => This.Etat.Element,
            Touche => Touche
         );
   begin
      This.Etat.Replace_Element (New_Item => Etat);
   end Changer_D_Etat;
   ---------------------------------------------------------------------------

end Utilisateur_P;
