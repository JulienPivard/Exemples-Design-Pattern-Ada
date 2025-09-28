package body Composant_P.Composite_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   function Faire
      (This : in     Composite_T)
      return Valeur_P.Valeur_T
   is
      use type Valeur_P.Valeur_T;

      Resultat_Gauche : Valeur_P.Valeur_T := Valeur_P.Neutre;
      Resultat_Droite : Valeur_P.Valeur_T := Valeur_P.Neutre;
   begin
      if not This.Enfant_1.Is_Empty then
         Resultat_Gauche := This.Enfant_1.Element.Faire;
      end if;
      if not This.Enfant_2.Is_Empty then
         Resultat_Droite := This.Enfant_2.Element.Faire;
      end if;

      return Resultat_Gauche + Resultat_Droite;
   end Faire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter
      (
         This     : in out Composite_T;
         Compoant : in     Composant_T'Class;
         Position : in     ID_T
      )
   is
   begin
      case Position is
         when 1 =>
            This.Enfant_1 := Holder_P.To_Holder (New_Item => Compoant);
         when 2 =>
            This.Enfant_2 := Holder_P.To_Holder (New_Item => Compoant);
      end case;
   end Ajouter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Supprimer
      (
         This     : in out Composite_T;
         Position : in     ID_T
      )
   is
   begin
      case Position is
         when 1 =>
            if not This.Enfant_1.Is_Empty then
               This.Enfant_1.Reference.Supprimer (Position => 1);
               This.Enfant_1.Reference.Supprimer (Position => 2);
               This.Enfant_1.Clear;
            end if;
         when 2 =>
            if not This.Enfant_2.Is_Empty then
               This.Enfant_2.Reference.Supprimer (Position => 1);
               This.Enfant_2.Reference.Supprimer (Position => 2);
               This.Enfant_2.Clear;
            end if;
      end case;
   end Supprimer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Enfant
      (
         This     : in     Composite_T;
         Position : in     ID_T
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
      Nb_Enfants : Nb_Enfants_T := 0;
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
   overriding
   function Image
      (This : in     Composite_T)
      return String
   is
   begin
      return "(" & This.Lire_Gauche & " + " & This.Lire_Droite & ")";
   end Image;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Gauche
      (This : in     Composite_T)
      return String
   is
   begin
      if This.Enfant_1.Is_Empty then
         return "";
      else
         return This.Enfant_1.Element.Image;
      end if;
   end Lire_Gauche;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Droite
      (This : in     Composite_T)
      return String
   is
   begin
      if This.Enfant_2.Is_Empty then
         return "";
      else
         return This.Enfant_2.Element.Image;
      end if;
   end Lire_Droite;
   ---------------------------------------------------------------------------

end Composant_P.Composite_P;
