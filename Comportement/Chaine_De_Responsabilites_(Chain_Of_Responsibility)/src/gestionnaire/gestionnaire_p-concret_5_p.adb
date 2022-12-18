with Ada.Text_IO;

with GNAT.Source_Info;

package body Gestionnaire_P.Concret_5_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Creer
      return Maillon_T
   is
   begin
      return R : Maillon_T do
         R.Action := Contexte_P.Action_5;
      end return;
   end Creer;
   ---------------------------------------------------------------------------

   subtype Action_T is Contexte_P.Action_T;

   ---------------------------------------------------------------------------
   overriding
   procedure Faire_Action
      (
         This     : in out Maillon_T;
         Contexte : in     Contexte_P.Action_T
      )
   is
      use type Contexte_P.Action_T;
   begin
      Ada.Text_IO.Put (Item => GNAT.Source_Info.Enclosing_Entity & " => ");
      if This.Action = Contexte then
         Ada.Text_IO.Put_Line (Item => Action_T'Image (This.Action));
      else
         Ada.Text_IO.Put_Line (Item => "Pas d'actions");
      end if;
   end Faire_Action;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Faire_Action
      (
         This     : in out Maillon_T;
         Contexte : in     Contexte_P.Action_T
      )
      return Boolean
   is
      use type Contexte_P.Action_T;

      Action_Faisable : constant Boolean := This.Action = Contexte;
   begin
      Ada.Text_IO.Put (Item => GNAT.Source_Info.Enclosing_Entity & " => ");
      if Action_Faisable then
         Ada.Text_IO.Put_Line (Item => Action_T'Image (This.Action));
      else
         Ada.Text_IO.Put_Line (Item => "Pas d'actions");
      end if;

      return Action_Faisable;
   end Faire_Action;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Gestionnaire_P.Concret_5_P;
