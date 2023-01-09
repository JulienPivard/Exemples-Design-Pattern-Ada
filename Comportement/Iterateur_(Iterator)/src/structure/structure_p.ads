with Ada.Iterator_Interfaces;

with Data_P;

--  @summary
--  Itérateur dont on peut modifier les éléments pendant l'itération.
--  @description
--  Itérateur dont on peut modifier les éléments pendant l'itération.
--  On utilise la structure interne du langage pour réaliser
--  l'itérateur.
--  @group Itérateur
package Structure_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Indice_T is range 1 .. 10;

   type Structure_T is tagged private
      with
         Default_Iterator  => Iterer,
         Iterator_Element  => Data_P.Element_T,
         Constant_Indexing => Lire,
         Variable_Indexing => Lire_Ecrire;
   --  La structure itérative. On utilise les facilité du langage
   --  pour mettre en place le pattern itérateur.

   function Lire_Element
      (
         This     : in     Structure_T;
         Position : in     Indice_T
      )
      return Data_P.Element_T;
   --  Lit l'élément dans la structure.
   --  @param This
   --  Le container de valeurs.
   --  @param Position
   --  La position de l'élément à lire.
   --  @return La valeur lue.

   procedure Modifier_Element
      (
         This     : in out Structure_T;
         Position : in     Indice_T;
         Valeur   : in     Data_P.Element_T
      );
   --  Modifie l'élément dans la structure.
   --  @param This
   --  Le container de valeurs.
   --  @param Position
   --  La position de l'élément à modifier.
   --  @param Valeur
   --  La valeur à écrire.

   -------------------------------------------------
   --  Les définitions pour le pattern itérateur  --
   -------------------------------------------------

   type Curseur_T is private;
   --  Le curseur qui mémorise la position dans les itérations.

   function Has_Element
      (Curseur : in     Curseur_T)
      return Boolean;
   --  Il y a encore au moins un élément dans l'itérateur.
   --  @param Curseur
   --  Le curseur.
   --  @return Il reste au moins un élément.

   package Iterateur_Interface_P is new Ada.Iterator_Interfaces
      (
         Cursor      => Curseur_T,
         Has_Element => Has_Element
      );
   --  Instance pour le pattern itérateurs.

   function Iterer
      (This : in     Structure_T)
      return Iterateur_Interface_P.Reversible_Iterator'Class;
   --  Fonction pour itérer sur les élément de notre structure.
   --  @param This
   --  Le container contenant les éléments.
   --  @return Un itérateur vers l'avant.

   type Accesseur_T
      (Donnee : not null access constant Data_P.Element_T)
   is limited private
      with Implicit_Dereference => Donnee;
   --  Accesseur protégeant le pointeur. Aucune déallocation
   --  du pointeur n'est possible puisque le fait que ce soit
   --  un discriminant en fait un pointeur constant. Le contenu
   --  pointé ne peut pas être modifié.

   function Lire
      (
         This    : in     Structure_T;
         Curseur : in     Curseur_T
      )
      return Accesseur_T
      with Inline => True;
   --  Accesseur sur une constante au travers d'un pointeur protégé.
   --  @param This
   --  Notre objet contenant les instances.
   --  @param Curseur
   --  La position de l'objet à récupérer.
   --  @return Un pointeur protégé sur la constante.

   type Modifieur_T
      (Donnee : not null access Data_P.Element_T)
   is limited private
      with Implicit_Dereference => Donnee;
   --  Accesseur protégeant le pointeur. Aucune déallocation
   --  du pointeur n'est possible puisque le fait que ce soit
   --  un discriminant en fait un pointeur constant. Le contenu
   --  pointé peut, par contre, être modifié.

   function Lire_Ecrire
      (
         This    : in out Structure_T;
         Curseur : in     Curseur_T
      )
      return Modifieur_T
      with Inline => True;
   --  Accesseur sur une variable au travers d'un pointeur protégé.
   --  @param This
   --  Notre objet contenant les instances.
   --  @param Curseur
   --  La position de l'objet à récupérer.
   --  @return Un pointeur protégé sur la variable.

private

   type Table_Elements_T is array (Indice_T) of aliased Data_P.Element_T;
   --  Le tableau des éléments stocké.

   type Structure_T is tagged
      record
         Elements : Table_Elements_T := Table_Elements_T'(others => 0);
         --  Les éléments stocké dans un tableau.
      end record;

   -------------------------------------------------
   --  Les définitions pour le pattern itérateur  --
   -------------------------------------------------

   type Accesseur_T
      (Donnee : not null access constant Data_P.Element_T)
   is limited null record;

   type Modifieur_T
      (Donnee : not null access          Data_P.Element_T)
   is limited null record;

   type Curseur_T is
      record
         Position    : Indice_T := Indice_T'First;
         --  La position dans les itérations.
         Est_Termine : Boolean  := False;
         --  Le parcours est terminé.
      end record;

   type Iterateur_T is new Iterateur_Interface_P.Reversible_Iterator with
      record
         null;
      end record;
   --  Notre itérateur dans les deux sens.

   overriding
   function First
      (It : in     Iterateur_T)
      return Curseur_T;
   --  Un curseur en position sur le premier élément.
   --  @param It
   --  Notre itérateur.
   --  @return Le curseur en position initial.

   overriding
   function Next
      (
         It       : in     Iterateur_T;
         Curseur  : in     Curseur_T
      )
      return Curseur_T;
   --  Fait passer le curseur au prochain élément.
   --  @param It
   --  Notre itérateur.
   --  @param Curseur
   --  Le curseur.
   --  @return Notre curseur un pas en avant.

   overriding
   function Last
      (It : in     Iterateur_T)
      return Curseur_T;
   --  Un curseur en position sur le dernier élément.
   --  @param It
   --  Notre itérateur.
   --  @return Le curseur en position initial.

   overriding
   function Previous
      (
         It       : in     Iterateur_T;
         Curseur  : in     Curseur_T
      )
      return Curseur_T;
   --  Fait passer le curseur à l'élément précédent.
   --  @param It
   --  Notre itérateur.
   --  @param Curseur
   --  Le curseur.
   --  @return Notre curseur un pas en arrière.

   --------------
   overriding
   function First
      (It : in     Iterateur_T)
      return Curseur_T
   is
      (
         Curseur_T'
            (
               Position    => Indice_T'First,
               Est_Termine => False
            )
      );

   -------------
   overriding
   function Next
      (
         It       : in     Iterateur_T;
         Curseur  : in     Curseur_T
      )
      return Curseur_T
   is
      (
         Curseur_T'
            (
               Position    =>
                  (
                     if Curseur.Position < Indice_T'Last then
                        Curseur.Position + 1
                     else
                        Curseur.Position
                  ),
               Est_Termine => not (Curseur.Position < Indice_T'Last)
            )
      );

   -------------
   overriding
   function Last
      (It : in     Iterateur_T)
      return Curseur_T
   is
      (
         Curseur_T'
            (
               Position    => Indice_T'Last,
               Est_Termine => False
            )
      );

   -----------------
   overriding
   function Previous
      (
         It       : in     Iterateur_T;
         Curseur  : in     Curseur_T
      )
      return Curseur_T
   is
      (
         Curseur_T'
            (
               Position    =>
                  (
                     if Curseur.Position > Indice_T'First then
                        Curseur.Position - 1
                     else
                        Curseur.Position
                  ),
               Est_Termine => not (Curseur.Position > Indice_T'First)
            )
      );

end Structure_P;
