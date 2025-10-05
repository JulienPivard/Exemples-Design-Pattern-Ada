# Design Patterns Comportementaux

Implémentation en Ada des designs pattern de la catégorie comportement.


## Chaine De Responsabilites (Chain Of Responsibility)

[Chaine De Responsabilites](./Chaine_De_Responsabilites_(Chain_Of_Responsibility))

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

## Commande (Command)

[Commande](./Commande_(Command))

## Etat (State)

[Etat](./Etat_(State))

## Interpreteur (Interpreter)

[Interpreteur](./Interpreteur_(Interpreter))

## Iterateur (Iterator)

[Iterateur](./Iterateur_(Iterator))

## Mediateur (Mediator)

[Mediateur](./Mediateur_(Mediator))

## Memento (Memento)

[Memento](./Memento_(Memento))

## Observateur (Observer)

[Observateur](./Observateur_(Observer))

## Patron De Methode (Template Method)

[Patron De Methode](./Patron_De_Methode_(Template_Method))

## Strategie (Strategy)

[Strategie](./Strategie_(Strategy))

## Visiteur (Visitor)

[Visiteur](./Visiteur_(Visitor))
