private

--  @summary
--  L'état qui sera stocké dans le Mémento.
--  @description
--  L'état qui sera stocké dans le Mémento.
--  @group Memento
package Mem_P.Etat_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Etat_T is private;

   function Creer
      (Valeur : in     Valeur_T)
      return Etat_T;
   --  Crée un état.
   --  @param Valeur
   --  La valeur à stocker.
   --  @return L'état.

   function Lire_Valeur
      (Etat : in     Etat_T)
      return Valeur_T;
   --  Lit la valeur de l'état.
   --  @param Etat
   --  L'état.
   --  @return La valeur stockée.

private

   type Etat_T is
      record
         Valeur : Valeur_T;
      end record;

   --------------
   function Creer
      (Valeur : in     Valeur_T)
      return Etat_T
   is (Etat_T'(Valeur => Valeur));
   --------------

   --------------------
   function Lire_Valeur
      (Etat : in     Etat_T)
      return Valeur_T
   is (Etat.Valeur);
   --------------------

end Mem_P.Etat_P;
