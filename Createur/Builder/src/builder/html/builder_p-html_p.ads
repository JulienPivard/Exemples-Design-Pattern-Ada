with Produit_Html_P;

--  @summary
--  Un monteur de fichier html.
--  @description
--  Un monteur qui construit au format html.
--  @group Builder Html
package Builder_P.Html_P is

   type Monteur_Html_T is new Monteur_T with private;
   --  Un monteur pour du texte formaté en html

   procedure Nouveau_Texte_Html
      (Monteur : in out Monteur_Html_T);
   --  Permet d'initialiser un texte vide au format html.
   --  @param Monteur
   --  Le monteur.

   overriding
   procedure Ajouter_Titre
      (
         Monteur : in out Monteur_Html_T;
         Texte   : in     Wide_Wide_String
      );
   --  Permet d'ajouter un titre au texte html.
   --  @param Monteur
   --  Le monteur.
   --  @param Texte
   --  Le texte à ajouter dans l'objet.

   overriding
   procedure Ajouter_Paragraphe
      (
         Monteur : in out Monteur_Html_T;
         Texte   : in     Wide_Wide_String
      );
   --  Permet d'ajouter un paragraphe au texte html.
   --  @param Monteur
   --  Le monteur.
   --  @param Texte
   --  Le texte à ajouter dans l'objet.

   function Recuperer_Resultat
      (Monteur : in Monteur_Html_T)
      return Produit_Html_P.Texte_Html_T;
   --  Permet de récupérer le texte construit par le monteur.
   --  @param Monteur
   --  Le monteur.
   --  @return Le html formaté.

private

   type Monteur_Html_T is new Monteur_T with
      record
         Texte_En_Construction : Produit_Html_P.Texte_Html_T;
      end record;

end Builder_P.Html_P;
