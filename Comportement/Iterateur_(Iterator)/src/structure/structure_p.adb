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
      return Curseur.Pointe_Un_Element;
   end Has_Element;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Iterer
      (This : in     Structure_T)
      return Iterateur_Interface_P.Reversible_Iterator'Class
   is
   begin
      return Iterateur_T'
         (
            Debut       => This.Elements'First,
            Fin         => This.Elements'Last,
            NB_Elements => This.Elements'Length
         );
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
      return This.Lire_Ecrire (Position => Curseur.Position);
   end Lire_Ecrire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Ecrire
      (
         This     : in out Structure_T;
         Position : in     Indice_T
      )
      return Modifieur_T
   is
   begin
      return Modifieur_T'(Donnee => This.Elements (Position)'Access);
   end Lire_Ecrire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function First
      (It : in     Iterateur_T)
      return Curseur_T
   is
      Curseur : Curseur_T;
   begin
      if It.NB_Elements > 0 then
         Curseur := Curseur_T'
            (
               Pointe_Un_Element => True,
               Position          => It.Debut
            );
      else
         Curseur := Curseur_T'(Pointe_Un_Element => False);
      end if;

      return Curseur;
   end First;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Next
      (
         It       : in     Iterateur_T;
         Curseur  : in     Curseur_T
      )
      return Curseur_T
   is
      Resultat : Curseur_T;
   begin
      if Curseur.Position < It.Fin then
         Resultat := Curseur_T'
            (
               Pointe_Un_Element => True,
               Position          => Curseur.Position + 1
            );
      else
         Resultat := Curseur_T'(Pointe_Un_Element => False);
      end if;

      return Resultat;
   end Next;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Last
      (It : in     Iterateur_T)
      return Curseur_T
   is
      Curseur : Curseur_T;
   begin
      if It.NB_Elements > 0 then
         Curseur := Curseur_T'
            (
               Pointe_Un_Element => True,
               Position          => It.Fin
            );
      else
         Curseur := Curseur_T'(Pointe_Un_Element => False);
      end if;

      return Curseur;
   end Last;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Previous
      (
         It       : in     Iterateur_T;
         Curseur  : in     Curseur_T
      )
      return Curseur_T
   is
      Resultat : Curseur_T;
   begin
      if Curseur.Position > It.Debut then
         Resultat := Curseur_T'
            (
               Pointe_Un_Element => True,
               Position          => Curseur.Position - 1
            );
      else
         Resultat := Curseur_T'(Pointe_Un_Element => False);
      end if;

      return Resultat;
   end Previous;
   ---------------------------------------------------------------------------

end Structure_P;
