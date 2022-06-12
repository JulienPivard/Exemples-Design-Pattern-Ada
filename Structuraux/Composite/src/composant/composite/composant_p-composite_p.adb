with Composant_P.Feuille_P;

package body Composant_P.Composite_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Faire
      (This : in     Composite_T)
   is
   begin
      if not This.Enfant_1.Is_Empty then
         This.Enfant_1.Element.Faire;
      end if;
      if not This.Enfant_2.Is_Empty then
         This.Enfant_2.Element.Faire;
      end if;
   end Faire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter
      (
         This   : in out Composite_T;
         Valeur : in     Valeur_P.Valeur_T
      )
   is
      Nb_Enfants_Gauche : constant Nb_Enfants_T :=
         (
            if This.Enfant_1.Is_Empty then
               0
            else
               This.Enfant_1.Element.Lire_Nb_Enfants
         );
      Nb_Enfants_Droite : constant Nb_Enfants_T :=
         (
            if This.Enfant_2.Is_Empty then
               0
            else
               This.Enfant_2.Element.Lire_Nb_Enfants
         );
   begin
      if    This.Enfant_1.Is_Empty then
         Bloc_Creer_Feuille_Gauche :
         declare
            Feuille : constant Feuille_P.Feuille_T :=
               Feuille_P.Construire (Valeur => Valeur);
         begin
            This.Enfant_1 := Enfant_P.To_Holder (New_Item => Feuille);
         end Bloc_Creer_Feuille_Gauche;
      elsif This.Enfant_2.Is_Empty then
         Bloc_Creer_Feuille_Droite :
         declare
            Feuille : constant Feuille_P.Feuille_T :=
               Feuille_P.Construire (Valeur => Valeur);
         begin
            This.Enfant_2 := Enfant_P.To_Holder (New_Item => Feuille);
         end Bloc_Creer_Feuille_Droite;
      elsif Nb_Enfants_Gauche = 0 then
         Bloc_Creer_Composite_Gauche :
         declare
            Composite : Composite_T;
         begin
            Composite.Enfant_1 := This.Enfant_1.Copy;
            Composite.Ajouter (Valeur => Valeur);
            This.Enfant_1.Replace_Element (New_Item => Composite);
         end Bloc_Creer_Composite_Gauche;
      elsif Nb_Enfants_Droite = 0 then
         Bloc_Creer_Composite_Droite :
         declare
            Composite : Composite_T;
         begin
            Composite.Enfant_1 := This.Enfant_2.Copy;
            Composite.Ajouter (Valeur => Valeur);
            This.Enfant_2.Replace_Element (New_Item => Composite);
         end Bloc_Creer_Composite_Droite;
      elsif Nb_Enfants_Droite < Nb_Enfants_Gauche - 1 then
         This.Enfant_2.Reference.Ajouter (Valeur => Valeur);
      elsif Nb_Enfants_Gauche < Nb_Enfants_Droite - 1 then
         This.Enfant_1.Reference.Ajouter (Valeur => Valeur);
      else
         This.Enfant_1.Reference.Ajouter (Valeur => Valeur);
      end if;
   end Ajouter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Supprimer
      (
         This   : in out Composite_T;
         Valeur : in     Valeur_P.Valeur_T
      )
   is
   begin
      if not This.Enfant_1.Is_Empty then
         This.Enfant_1.Reference.Supprimer (Valeur => Valeur);
      end if;
      if not This.Enfant_2.Is_Empty then
         This.Enfant_2.Reference.Supprimer (Valeur => Valeur);
      end if;
   end Supprimer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Enfant
      (
         This     : in     Composite_T;
         Position : in     Id_T
      )
      return Composant_T'Class
   is
      Resultat : constant Composant_T'Class :=
         (
            case Position is
               when 1 =>
                  This.Enfant_1.Element,
               when 2 =>
                  This.Enfant_2.Element
         );
   begin
      return Resultat;
   end Lire_Enfant;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Nb_Enfants
      (This : in     Composite_T)
      return Nb_Enfants_T
   is
      Nb_Enfants : Nb_Enfants_T := Nb_Enfants_T'First;
   begin
      if not This.Enfant_1.Is_Empty then
         Nb_Enfants := Nb_Enfants + This.Enfant_1.Element.Lire_Nb_Enfants + 1;
      end if;
      if not This.Enfant_2.Is_Empty then
         Nb_Enfants := Nb_Enfants + This.Enfant_2.Element.Lire_Nb_Enfants + 1;
      end if;
      return Nb_Enfants;
   end Lire_Nb_Enfants;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Composant_P.Composite_P;
