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

      Resultat_Gauche : constant Valeur_P.Valeur_T :=
         (
            if This.Enfant_1.Is_Empty then
               Valeur_P.Neutre
            else
               This.Enfant_1.Element.Faire
         );
      Resultat_Droite : constant Valeur_P.Valeur_T :=
         (
            if This.Enfant_2.Is_Empty then
               Valeur_P.Neutre
            else
               This.Enfant_2.Element.Faire
         );
   begin
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
   function Lire_NB_Enfants
      (This : in     Composite_T)
      return NB_Enfants_T
   is
      NB_Enfants_Gauche : constant NB_Enfants_T :=
         (
            if This.Enfant_1.Is_Empty then
               0
            else
               This.Enfant_1.Element.Lire_NB_Enfants + 1
         );
      NB_Enfants_Droite : constant NB_Enfants_T :=
         (
            if This.Enfant_2.Is_Empty then
               0
            else
               This.Enfant_2.Element.Lire_NB_Enfants + 1
         );
   begin
      return NB_Enfants_Gauche + NB_Enfants_Droite;
   end Lire_NB_Enfants;
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
      Vide : constant Boolean := This.Enfant_1.Is_Empty;
   begin
      return (if Vide then "" else This.Enfant_1.Element.Image);
   end Lire_Gauche;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Droite
      (This : in     Composite_T)
      return String
   is
      Vide : constant Boolean := This.Enfant_2.Is_Empty;
   begin
      return (if Vide then "" else This.Enfant_2.Element.Image);
   end Lire_Droite;
   ---------------------------------------------------------------------------

end Composant_P.Composite_P;
