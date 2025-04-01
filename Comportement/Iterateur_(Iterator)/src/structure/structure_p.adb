package body Structure_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Lire
      (
         This     : in     Structure_T;
         Position : in     Indice_T
      )
      return Data_P.Element_T
   is
   begin
      return This.Elements (Position);
   end Lire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Modifier_Element
      (
         This     : in out Structure_T;
         Position : in     Indice_T;
         Valeur   : in     Data_P.Element_T
      )
   is
   begin
      This.Elements (Position) := Valeur;
   end Modifier_Element;
   ---------------------------------------------------------------------------

   -------------------------------------------------
   --  Les définitions pour le pattern itérateur  --
   -------------------------------------------------

   ---------------------------------------------------------------------------
   function Has_Element
      (Curseur : in     Curseur_T)
      return Boolean
   is
   begin
      return not Curseur.Est_Termine;
   end Has_Element;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Iterer
      (This : in     Structure_T)
      return Iterateur_Interface_P.Reversible_Iterator'Class
   is
      pragma Unreferenced (This);
   begin
      return Iterateur_T'(null record);
   end Iterer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire
      (
         This    : in     Structure_T;
         Curseur : in     Curseur_T
      )
      return Accesseur_T
   is
   begin
      return Accesseur_T'(Donnee => This.Elements (Curseur.Position)'Access);
   end Lire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Ecrire
      (
         This    : in out Structure_T;
         Curseur : in     Curseur_T
      )
      return Modifieur_T
   is
   begin
      return Modifieur_T'(Donnee => This.Elements (Curseur.Position)'Access);
   end Lire_Ecrire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Structure_P;
