with Ada.Containers.Indefinite_Holders;

with Utilisateur_Singleton_P;

use type Utilisateur_Singleton_P.Utilisateur_T;

package Utilisateur_Holders_P is new Ada.Containers.Indefinite_Holders
   (Element_Type => Utilisateur_Singleton_P.Utilisateur_T'Class);
