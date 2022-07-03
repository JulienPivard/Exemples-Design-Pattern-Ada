package body Gestionnaire_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Gerer_Requete
      (
         This     : in out Gestionnaire_T'Class;
         Contexte : in     Contexte_P.Action_T
      )
   is
   begin
      This.Faire_Action (Contexte => Contexte);
      if This.Possede_Successeur then
         --  On n'as pas accès à un quelconque contenu
         --  car gestionnaire est une interface.
         Bloc_Activer_Successeur :
         declare
            Successeur : Gestionnaire_T'Class := This.Lire_Successeur;
         begin
            Successeur.Gerer_Requete (Contexte => Contexte);
            This.Remplacer (Successeur => Successeur);
         end Bloc_Activer_Successeur;
      end if;
   end Gerer_Requete;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter_Successeur
      (
         This       : in out Chaine_De_Responsabilite_T;
         Successeur : in     Gestionnaire_T'Class
      )
   is
   begin
      if This.Possede_Successeur then
         This.Successeur.Reference.Ajouter_Successeur
            (Successeur => Successeur);
      else
         This.Successeur := Successeur_P.To_Holder (New_Item => Successeur);
      end if;
   end Ajouter_Successeur;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Possede_Successeur
      (This : in     Chaine_De_Responsabilite_T)
      return Boolean
   is
   begin
      return not This.Successeur.Is_Empty;
   end Possede_Successeur;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Successeur
      (This : in     Chaine_De_Responsabilite_T)
      return Gestionnaire_T'Class
   is
   begin
      return This.Successeur.Element;
   end Lire_Successeur;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Remplacer
      (
         This       : in out Chaine_De_Responsabilite_T;
         Successeur : in     Gestionnaire_T'Class
      )
   is
   begin
      This.Successeur.Replace_Element (New_Item => Successeur);
   end Remplacer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Gestionnaire_P;
