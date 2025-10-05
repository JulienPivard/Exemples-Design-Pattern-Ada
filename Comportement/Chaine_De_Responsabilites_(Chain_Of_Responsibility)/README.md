# Chaine de Responsabilité

A utiliser dans le cas où l'on veux éviter de fortement coupler
un émetteur de requête et différents traitement de celle-ci.
On va chainer ensemble les objets chargé de traiter la requête
de façon à la faire passer d'objet en objet jusqu'à ce que l'un
d'entre eux la traite.

## Diagramme

```
                                         ┌────────────────┐
                                         │                │
                                         ▼                │
┌────────┐                  ┌─────────────────────────┐   │ Successeur
│ Client │─────────────────▶│  Gestionnaire_Abstrait  │───┘
└────────┘                  ├─────────────────────────┤
                            │     Gerer_Requete ()    │
                            └─────────────────────────┘
                                         │
                                         △
                                        ╱ ╲
                    ┌─────────────────────────────────────────┐
                    │                                         │
     ┌────────────────────────────┐             ┌───────────────────────────┐
     │   Gestionnaire_Concret_1   │             │  Gestionnaire_Concret_2   │
     ├────────────────────────────┤             ├───────────────────────────┤
     │      Gerer_Requete ()      │             │      Gerer_Requete ()     │
     └────────────────────────────┘             └───────────────────────────┘


Edit/view: https://cascii.app/c668c

```

## Correspondance avec l'implémentation

```
Client                 -> src/client.adb
Gestionnaire_Abstrait  -> src/gestionnaire/gestionnaire_p.ads
Gestionnaire_Concret_X -> src/gestionnaire/gestionnaire_p-concret_1_p.ads
Gestionnaire_Concret_X -> src/gestionnaire/gestionnaire_p-concret_2_p.ads
Gestionnaire_Concret_X -> src/gestionnaire/gestionnaire_p-concret_3_p.ads
Gestionnaire_Concret_X -> src/gestionnaire/gestionnaire_p-concret_4_p.ads
Gestionnaire_Concret_X -> src/gestionnaire/gestionnaire_p-concret_5_p.ads
La requete             -> src/contexte/contexte_p.ads
```

## Diagramme de classe de la version Ada

Dans l'implémentation actuel, la récursivité oblige à utiliser
le conteneur `Ada.Containers.Indefinite_Holders` pour exprimer
la dépendance récursive. Il est possible de s'en passer en stockant
tous les objet dans un tableau externe et en stockant la référence
au suivant au lieu du pointeur. A voir dans une prochaine version.

```
                                     ┌────────────────────────────┐
┌────────┐                           │         <Interface>        │
│ Client │──────────────────────────▶│ Chaine_De_Responsabilite_T │◀──────────┐
└────────┘                           │     gestionnaire_p.ads     │           │
                                     ├────────────────────────────┤           │
                                     │     Gerer_Requete ()       │           │
                                     └────────────────────────────┘           │
                                                   △                          │
                                                  ╱ ╲                         │
                                                   │                          │
                            ┌───────────────────────────────────────────┐     │ Successeur
                            │             <Classe Abstraite>            │     │
                            │             Maillon_Abstrait_T            ├─────┘
                            │    src/gestionnaire/gestionnaire_p.ads    │
                            ├───────────────────────────────────────────┤
                            │              Gerer_Requete ()             │
                            ├───────────────────────────────────────────┤
                            │ - Successeur : Chaine_De_Responsabilite_T │
                            └───────────────────────────────────────────┘
                                                   │
                                                   △
                                                  ╱ ╲
         ┌────────────────────┬────────────────────┬────────────────────┬────────────────────┐
         │                    │                    │                    │                    │
┌──────────────────┐ ┌──────────────────┐ ┌──────────────────┐ ┌──────────────────┐ ┌──────────────────┐
│     Maillon_T    │ │     Maillon_T    │ │     Maillon_T    │ │     Maillon_T    │ │     Maillon_T    │
├──────────────────┤ ├──────────────────┤ ├──────────────────┤ ├──────────────────┤ ├──────────────────┤
│ Gerer_Requete () │ │ Gerer_Requete () │ │ Gerer_Requete () │ │ Gerer_Requete () │ │ Gerer_Requete () │
└──────────────────┘ └──────────────────┘ └──────────────────┘ └──────────────────┘ └──────────────────┘
src/gestionnaire/gestionnaire_p-concret_x_p.ads
```
