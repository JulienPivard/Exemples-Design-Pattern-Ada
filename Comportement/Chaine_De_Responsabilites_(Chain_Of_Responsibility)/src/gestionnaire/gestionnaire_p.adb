package body Gestionnaire_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Gerer_Requete
      (
         This     : in out Chaine_De_Responsabilite_T'Class;
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
            Successeur : Parent_T'Class := This.Lire_Successeur;
         begin
            Successeur.Gerer_Requete (Contexte => Contexte);
            --  Si le contenu du successeur est modifié on le met à jour.
            This.Remplacer (Successeur => Successeur);
         end Bloc_Activer_Successeur;
      end if;
   end Gerer_Requete;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Gerer_Requete
      (
         This     : in out Chaine_De_Responsabilite_T'Class;
         Contexte : in     Contexte_P.Action_T
      )
      return Boolean
   is
      Responsable_Trouve : Boolean := False;
   begin
      Responsable_Trouve := This.Faire_Action (Contexte => Contexte);
      if This.Possede_Successeur and then not Responsable_Trouve then
         --  On n'as pas accès à un quelconque contenu
         --  car gestionnaire est une interface.
         Bloc_Activer_Successeur :
         declare
            --  On récupère le successeur, CE N'EST PAS UN POINTEUR.
            Successeur : Parent_T'Class := This.Lire_Successeur;
         begin
            Responsable_Trouve :=
               Successeur.Gerer_Requete (Contexte => Contexte);
            --  Si le contenu du successeur est modifié on le met à jour.
            This.Remplacer (Successeur => Successeur);
         end Bloc_Activer_Successeur;
      end if;

      return Responsable_Trouve;
   end Gerer_Requete;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter
      (
         This       : in out Maillon_Abstrait_T;
         Successeur : in     Chaine_De_Responsabilite_T'Class
      )
   is
   begin
      if This.Possede_Successeur then
         This.Successeur.Reference.Ajouter (Successeur => Successeur);
      else
         This.Successeur := Successeur_P.To_Holder (New_Item => Successeur);
      end if;
   end Ajouter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Possede_Successeur
      (This : in     Maillon_Abstrait_T)
      return Boolean
   is
   begin
      return not This.Successeur.Is_Empty;
   end Possede_Successeur;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Successeur
      (This : in     Maillon_Abstrait_T)
      return Chaine_De_Responsabilite_T'Class
   is
   begin
      return This.Successeur.Element;
   end Lire_Successeur;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Remplacer
      (
         This       : in out Maillon_Abstrait_T;
         Successeur : in     Chaine_De_Responsabilite_T'Class
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
