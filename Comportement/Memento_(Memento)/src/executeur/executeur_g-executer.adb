with Ada.Numerics.Discrete_Random;

with Utilisateur_P;
with Utilisateur_P.Memento_P;

with Mem_P.Memento_P.Utilisateur_P;
with Mem_P.Auteur_P;

with Valeur_P;
with Auteur_P;
with Auteur_P.Memento_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   generic
      type Valeur_Bis_G_T  is range <>;
      --  Contenu.

      type Auteur_Bis_G_T  is tagged private;
      --  Classe utilisatrice de memento.

      with function Lire_Valeur_G
         (This : in     Auteur_Bis_G_T)
         return Valeur_Bis_G_T;
      --  Lit la valeur stockée.
      --  @param This
      --  L'utilisateur.
      --  @return La valeur dans l'auteur.

   procedure Afficher_G
      (Utilisateur : in     Auteur_Bis_G_T);
   --  Affiche le contenu de l'auteur.
   --  @param Utilisateur
   --  L'utilisateur à afficher.

   --------------------
   procedure Afficher_G
      (Utilisateur : in     Auteur_Bis_G_T)
   is
      V : constant Valeur_Bis_G_T := Lire_Valeur_G (This => Utilisateur);
   begin
      Ada.Text_IO.Put_Line (Item => "Valeur : " & V'Image);
   end Afficher_G;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   generic
      type Valeur_G_T  is range <>;
      --  Contenu.

      type Memento_G_T is private;
      --  Memento d'un état de l'auteur.

      type Auteur_G_T  is tagged private;
      --  Classe utilisatrice de memento.

      with procedure Modifier_G
         (
            This   : in out Auteur_G_T;
            Valeur : in     Valeur_G_T
         );
      --  Modifie la valeur stocké dans l'auteur.
      --  @param This
      --  L'utilisateur.
      --  @param Valeur
      --  La valeur à stocker.

      with function Lire_Valeur_G
         (This : in     Auteur_G_T)
         return Valeur_G_T;
      --  Lit la valeur stockée.
      --  @param This
      --  L'utilisateur.
      --  @return La valeur dans l'auteur.

      with function Memoriser_G
         (This : in     Auteur_G_T)
         return Memento_G_T;
      --  Mémorise l'état actuelle de l'auteur.
      --  @param This
      --  L'auteur.
      --  @return L'état de l'auteur à un instant donné.

      with procedure Retablir_G
         (
            This    : in out Auteur_G_T;
            Memento : in     Memento_G_T
         );
      --  Remet l'auteur dans l'état qu'il avait au moment donné.
      --  @param This
      --  L'auteur.
      --  @param Memento
      --  L'état à rétablir.

   procedure Montrer_Utilisation_G;
   --  Démonstration de l'utilisation des différents Memento.

   --------------------------------
   procedure Montrer_Utilisation_G is
      ---------
      procedure Afficher is new Afficher_G
         (
            Valeur_Bis_G_T => Valeur_G_T,
            Auteur_Bis_G_T => Auteur_G_T,
            Lire_Valeur_G  => Lire_Valeur_G
         );
      ---------

      package Alea_P is new Ada.Numerics.Discrete_Random
         (Result_Subtype => Valeur_G_T);

      Generateur : Alea_P.Generator;

      U   : Auteur_G_T;
      M_1 : Memento_G_T;
      M_2 : Memento_G_T;
   begin
      Alea_P.Reset (Gen => Generateur);

      Ada.Text_IO.Put_Line (Item => "On met l'utilisateur à valeur");
      Modifier_G
         (
            This   => U,
            Valeur => Alea_P.Random (Gen => Generateur)
         );
      Afficher (Utilisateur => U);
      Ada.Text_IO.Put_Line (Item => "On sauvegarde dans M1");
      M_1 := Memoriser_G (This => U);

      Ada.Text_IO.Put_Line (Item => "On met l'utilisateur à valeur");
      Modifier_G
         (
            This   => U,
            Valeur => Alea_P.Random (Gen => Generateur)
         );
      Afficher (Utilisateur => U);
      Ada.Text_IO.Put_Line (Item => "On sauvegarde dans M2");
      M_2 := Memoriser_G (This => U);

      Ada.Text_IO.Put_Line (Item => "On met l'utilisateur à valeur");
      Modifier_G
         (
            This   => U,
            Valeur => Alea_P.Random (Gen => Generateur)
         );
      Afficher (Utilisateur => U);

      Ada.Text_IO.New_Line (Spacing => 1);

      Ada.Text_IO.Put_Line
         (Item => "On rétablit l'utilisateur à la valeur sauvegardé dans M1");
      Retablir_G
         (
            This    => U,
            Memento => M_1
         );
      Afficher (Utilisateur => U);

      Ada.Text_IO.Put_Line
         (Item => "On rétablit l'utilisateur à la valeur sauvegardé dans M2");
      Retablir_G
         (
            This    => U,
            Memento => M_2
         );
      Afficher (Utilisateur => U);
   end Montrer_Utilisation_G;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Restaurer
      (
         Auteur : in out Auteur_P.Auteur_T;
         This   : in     Auteur_P.Memento_P.Memento_T
      );

   -------------------
   procedure Restaurer
      (
         Auteur : in out Auteur_P.Auteur_T;
         This   : in     Auteur_P.Memento_P.Memento_T
      )
   is
   begin
      This.Restaurer (Auteur => Auteur);
   end Restaurer;
   ---------------------------------------------------------------------------

   procedure Montrer_1 is new Montrer_Utilisation_G
      (
         Valeur_G_T    => Utilisateur_P.Valeur_T,
         Memento_G_T   => Utilisateur_P.Memento_P.Memento_T,
         Auteur_G_T    => Utilisateur_P.Utilisateur_T,
         Modifier_G    => Utilisateur_P.Modifier,
         Lire_Valeur_G => Utilisateur_P.Lire_Valeur,
         Memoriser_G   => Utilisateur_P.Memoriser,
         Retablir_G    => Utilisateur_P.Retablir
      );

   procedure Montrer_2 is new Montrer_Utilisation_G
      (
         Valeur_G_T    => Mem_P.Valeur_T,
         Memento_G_T   => Mem_P.Memento_P.Memento_T,
         Auteur_G_T    => Mem_P.Memento_P.Utilisateur_P.Utilisateur_T,
         Modifier_G    => Mem_P.Memento_P.Utilisateur_P.Modifier,
         Lire_Valeur_G => Mem_P.Memento_P.Utilisateur_P.Lire_Valeur,
         Memoriser_G   => Mem_P.Memento_P.Utilisateur_P.Memoriser,
         Retablir_G    => Mem_P.Memento_P.Utilisateur_P.Retablir
      );

   procedure Montrer_3 is new Montrer_Utilisation_G
      (
         Valeur_G_T    => Mem_P.Valeur_T,
         Memento_G_T   => Mem_P.Auteur_P.Memento_T,
         Auteur_G_T    => Mem_P.Auteur_P.Auteur_T,
         Modifier_G    => Mem_P.Auteur_P.Modifier,
         Lire_Valeur_G => Mem_P.Auteur_P.Lire_Valeur,
         Memoriser_G   => Mem_P.Auteur_P.Memoriser,
         Retablir_G    => Mem_P.Auteur_P.Retablir
      );

   procedure Montrer_4 is new Montrer_Utilisation_G
      (
         Valeur_G_T    => Valeur_P.Valeur_T,
         Memento_G_T   => Auteur_P.Memento_P.Memento_T,
         Auteur_G_T    => Auteur_P.Auteur_T,
         Modifier_G    => Auteur_P.Modifier,
         Lire_Valeur_G => Auteur_P.Lire_Valeur,
         Memoriser_G   => Auteur_P.Memento_P.Memoriser,
         Retablir_G    => Restaurer
      );
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern mémento.");
   Ada.Text_IO.Put_Line (Item => "Enregistrer facilement l'état d'un objet");
   Ada.Text_IO.Put_Line (Item => "pour pouvoir le rétablir après.");
   Ada.Text_IO.Put_Line (Item => "3 constructions différentes du memento.");
   Ada.Text_IO.Put_Line (Item => "Ce sont des tests d'organisation du code");
   Ada.Text_IO.Put_Line (Item => "pour répondre au mieux aux contraintes");
   Ada.Text_IO.Put_Line (Item => "du modèle.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Montrer_1;
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 2);

   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Montrer_2;
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 2);

   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Montrer_3;
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 2);

   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Montrer_4;
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
