with Observateur_P;
with Sujet_P;

private with Observateur_P.Holders_P;

--  @summary
--  Le sujet qui va être observé.
--  @description
--  Le sujet qui va être observé.
--  @group Observateur
package Valeurs_P.Concret_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Sujet_T is new Valeurs_Graphe_T and Sujet_P.Sujet_T with private;
   --  Version concrète d'un sujet observé.

   overriding
   procedure Modifier
      (
         This : in out Sujet_T;
         Vals : in     Table_Valeurs_T
      );

   overriding
   function Lire_Vals
      (This : in     Sujet_T)
      return Table_Valeurs_T;

   overriding
   procedure Attache
      (
         This        : in out Sujet_T;
         Observateur : in     Observateur_P.Observateur_T'Class
      );
   --  Attache un observateur.
   --  @param This
   --  Le sujet observé.
   --  @param Observateur
   --  L'observateur à attacher.

   overriding
   procedure Detache
      (
         This        : in out Sujet_T;
         Observateur : in     Observateur_P.Observateur_T'Class
      );
   --  Détache un observateur.
   --  @param This
   --  Le sujet observé.
   --  @param Observateur
   --  L'observateur à attacher.

private

   overriding
   procedure Notifier
      (This : in out Sujet_T);
   --  Notifie tous ses observateurs.
   --  @param This
   --  Le sujet modifié.

   package Holders_P renames Observateur_P.Holders_P;

   type Ref_Obs_T is
      record
         Observateur : Holders_P.Holder := Holders_P.Empty_Holder;
         --  L'observateur.
         Obs_Present : Boolean          := False;
         --  Un observateur est configuré.
      end record;

   type Indice_Obs_T is range 1 .. 2;
   --  Nombre d'observateurs max sur le sujet.

   type Table_Observateur_T is array (Indice_Obs_T) of Ref_Obs_T;
   --  Tableau des observateurs.

   type Sujet_T is new Valeurs_Graphe_T and Sujet_P.Sujet_T with
      record
         Observateurs    : Table_Observateur_T;
         --  Les observateurs.
         Nb_Observateurs : Natural := 0;
         --  Le nombre d'observateurs.
      end record;

end Valeurs_P.Concret_P;
