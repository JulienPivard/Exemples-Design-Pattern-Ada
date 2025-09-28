with Ada.Command_Line;
with Ada.Wide_Wide_Text_IO;

with NB_Args_P;

generic

   Nombre_D_Arguments_Min : NB_Args_P.NB_Args_T := 1;
   --  Si le nombre d'arguments minimum vaut 0 alors l'aide ne
   --  s'affichera pas si le programme est appelé sans arguments.
   Nombre_D_Arguments_Max : NB_Args_P.NB_Args_T := 1;
   --  Le nombre maximum d'arguments autorisé sur la ligne de commandes.

--  @summary
--  L'exécuteur de programme.
--  @description
--  L'exécuteur se charge de vérifier les arguments donné sur la ligne de
--  commande, puis d'extraire les valeurs. Dans une unité séparé il
--  contient également la méthode de lancement du programme.
--  @group Exécuteur
package Executeur_G is

   pragma Elaborate_Body;

   use type NB_Args_P.NB_Args_T;

   pragma Compile_Time_Error
      (
         Nombre_D_Arguments_Min > Nombre_D_Arguments_Max,
         "Le nombre d'arguments max doit etre superieur " &
         "au nombre d'arguments minimum."
      );

   Valeur_Option_Incorrect_E  : exception;
   --  La valeur donnée avec l'option n'est pas valide.

   package W_W_IO_R renames Ada.Wide_Wide_Text_IO;
   --  Affichage de chaines avec des long caractères.

   subtype NB_Args_T is NB_Args_P.NB_Args_T;

   NB_Args     : constant NB_Args_T :=
      NB_Args_T (Ada.Command_Line.Argument_Count);
   --  Le nombre d'arguments sur la ligne de commande.
   NB_Args_Max : constant NB_Args_T := Nombre_D_Arguments_Max;
   --  Le nombre maximum d'arguments autorisé sur la ligne de commande.

   procedure Afficher_Aide;
   --  Affiche l'aide du programme.

   function Verifier_Nombre_D_Arguments_Est_Valide
      return Boolean;
   --  Vérifie combien d'arguments ont été donné sur la ligne de
   --  commande.
   --  @return Le nombre d'arguments est valide.

   procedure Executer;
   --  Exécute le programme.

end Executeur_G;
