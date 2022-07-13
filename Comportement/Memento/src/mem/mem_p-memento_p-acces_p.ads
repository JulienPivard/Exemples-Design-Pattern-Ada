private

--  @summary
--  Boite à outils pour manipuler un Memento.
--  @description
--  Boite à outils pour manipuler un Memento.
--  @group Memento
package Mem_P.Memento_P.Acces_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   function Creer
      (Etat : in     Etat_P.Etat_T)
      return Memento_T;
   --  Crée un mémento à partir d'un état interne.
   --  @param Etat
   --  L'état de l'instantané.
   --  @return L'instantané.

   function Lire_Etat
      (Memento : in     Memento_T)
      return Etat_P.Etat_T;
   --  Lit l'état interne d'un mémento.
   --  @param Memento
   --  L'instantané.
   --  @return L'état interne.

private

   --------------
   function Creer
      (Etat : in     Etat_P.Etat_T)
      return Memento_T
   is (Memento_T'(Etat => Etat));
   --------------

   ------------------
   function Lire_Etat
      (Memento : in     Memento_T)
      return Etat_P.Etat_T
   is (Memento.Etat);
   ------------------

end Mem_P.Memento_P.Acces_P;
