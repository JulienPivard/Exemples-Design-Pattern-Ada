with Produit_Html_P;

package Builder_P.Builder_Html_P is

   --  Un monteur pour du texte formaté en html
   type Monteur_Html_T is new Monteur_T with private;

   --  Permet d'initialiser un texte vide au format html.
   procedure Nouveau_Texte_Html (Monteur : in out Monteur_Html_T);

   --  Permet d'ajouter un titre au texte html
   overriding
   procedure Ajouter_Titre
      (
         Monteur : in out Monteur_Html_T;
         Texte : in Contenu_R.Unbounded_Wide_Wide_String
      );

   --  Permet d'ajouter un paragraphe au texte html
   overriding
   procedure Ajouter_Paragraphe
      (
         Monteur : in out Monteur_Html_T;
         Texte : in Contenu_R.Unbounded_Wide_Wide_String
      );

   --  Permet de récupérer le texte construit par le monteur.
   function Recuperer_Resultat
      (Monteur : in Monteur_Html_T)
      return Produit_Html_P.Texte_Html_T;

private

   type Monteur_Html_T is new Monteur_T with
      record
         Texte_En_Construction : Produit_Html_P.Texte_Html_T;
      end record;

end Builder_P.Builder_Html_P;
