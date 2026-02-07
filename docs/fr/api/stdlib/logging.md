---
title: logging - Journalisation Avancés
createTime: 2026/02/07 15:06:33
permalink: /fr/api/stdlib/logging
---

Un paquet qui définit des fonctions qui implémentent un système de journalisation d'événement flexible.

---

## Sommaire

### Méthodes

:::table full-width
||
| -- |
| [config](#config) (configTable: { threshold: string?, autoDebug: boolean?, logger: boolean? }) : nil |
| [log](#log) (message: string, level: string) : nil |
| [getLevel](#getlevel) (name: string?) : { index: number, flags: { string } } \| { [string]: { index: number, flags: { string } } }|
| [addLevel](#addlevel) (name: string, index: number, flags: { string }?, autoFixIndex: boolean?) : boolean |
| [removeLevel](#removelevel) (name: string) : nil |
| [getLogs](#getlogs) () : { string } |
| [clearLogs](#clearlogs) () : nil |
:::

Le principale avantage de disposer de l'API de journalisation fournie par un module de la bibliothèque standard est que tous les modules de RbxPI peuvent utiliser la journalisation, de sorte que votre journal peut inclure vos propres messages intégrés aux messages de modules tiers.

Le système de journalisation contient différents niveaux de priorité que vous pouvez vous-mêmes créer. Il est possible de configurer le comportement de l'enregistreur et de valider certains niveaux de journalisation dans l'environnement Roblox.

---

## Configuration

:::: field-group

::: field name="logging.__threshold" type="string" default="INFO"
Niveau de priorité de la journalisation.
:::

::: field name="logging.__autoDebug" type="boolean" default="True"
Activer automatiquement le mode `DEBUG` si l'expérience est lancé sur Roblox Studio.
:::

::: field name="logging.__logger" type="boolean" default="True"
Gérer l'enregistrement des logs.
:::

::::

Ces paramètres peuvent être modifié via la fonction [`logging.config()`](#config) qui permet de configurer le module.

## Méthodes

#### config

Configure le paquet via certains argument.

```luau
logging.config(
    configTable: {
        threshold : string?, autoDebug : boolean?, logger : boolean?
    }
) : nil
```

**Paramètres**

:::: field-group

::: field name="configTable" type="tuple" optional"

:::: field-group

::: field name="threshold" type="string?" optional 
Niveau de priorité de la journalisation.

::: field name="autoDebug" type="boolean?" optional 
Activer automatiquement le mode `DEBUG` si l'expérience est lancé sur Roblox Studio.

::: field name="logger" type="boolean?" optional
Gérer l'enregistrement des logs.
:::

::::

Cette fonction configure le paquet `logging` en appliquant les options fournies dans `configTable`. Elle permet de définir le niveau de priorité des messages à l'aide de `threshold`, ce qui contrôle quels logs seront affichés ou ignorés en fonction de leur gravité. Cela permet de filtrer les messages selon leur importance et d’éviter d’encombrer la sortie avec des informations non essentielles.

L’option `autoDebug` active automatiquement le mode `DEBUG` si le jeu est exécuté depuis Roblox Studio. Cela facilite le développement et le débogage en affichant des informations détaillées sans avoir besoin de modifier manuellement la configuration à chaque session.

L’option `logger` contrôle si les messages doivent être effectivement enregistrés. Elle permet de désactiver temporairement la journalisation tout en conservant les appels de log dans le code, ce qui peut être utile pour les tests ou les environnements où l’enregistrement n’est pas nécessaire.

Les paramètres non fournis ne modifient pas la configuration existante, offrant ainsi une flexibilité pour ajuster uniquement les aspects nécessaires du comportement du paquet sans réinitialiser les autres réglages.

#### log

Créer un message, envoyé à la console de l'expérience avec un certain niveau de priorité.

```luau
logging.log(
    message : string, level : string
) : nil
```

**Paramètres**

:::: field-group

::: field name="message" type="string"
Message à envoyer à la console de l'expérience.
:::

::: field name="level" type="string"
Niveau de priorité du message envoyé.
:::

::::

Cette fonction crée un message et l’envoie à la console de l’expérience avec le niveau de priorité spécifié. Le paramètre `message` correspond au texte à afficher, tandis que `level` détermine l’importance ou la gravité du message, ce qui permet de filtrer ou de mettre en évidence certaines informations selon leur priorité.

Elle s’intègre au système de journalisation du paquet `logging`, garantissant que tous les messages respectent la configuration actuelle, comme le seuil de priorité défini par `threshold` ou le mode `DEBUG` activé automatiquement en Studio.

L’utilisation de cette fonction permet de suivre l’exécution du code, de déboguer plus facilement et d’avoir une trace claire des événements importants dans la console, tout en conservant la possibilité de filtrer ou de désactiver certains messages selon les besoins.

#### getLevel

Récupère les informations d’un niveau de log spécifique ou l’ensemble des niveaux de log.

```luau
logging.getLevel(
    levelName: string?
) : { index: number, flags: { string } } | { [string]: { index: number, flags: { string } } }
```

**Paramètres**

:::: field-group

::: field name="levelName" type="string?" optional
Nom optionnel du niveau de log à récupérer. Si aucun nom n’est fourni, la fonction retourne tous les niveaux de log existants.
:::

::::

**Retours**

:::: field-group
::: field type="table"
Un tableau ou un ensemble de chaînes représentant des valeurs différentes

:::: field-group
Un tableau contenant:

::: field name="index" type="number"
Numéro du niveau de log.

::: field name="flags" type="table"
Ensemble de chaînes représentant les drapeaux associés au niveau.
:::

:::: field-group
Un dictionnaire où chaque clé est un nom de niveau de log et chaque valeur contient:

::: field name="index" type="number"
Numéro du niveau de log.

::: field name="flags" type="table"
Ensemble de chaînes représentant les drapeaux associés au niveau.
:::

::::

Cette fonction récupère les informations relatives à un niveau de log spécifique ou à l’ensemble des niveaux définis dans le système de journalisation. Si un `levelName` est fourni, elle retourne uniquement les données correspondant à ce niveau, incluant son numéro d’index et les drapeaux (`flags`) associés. Si aucun nom n’est indiqué, elle renvoie un dictionnaire complet de tous les niveaux existants, permettant d’accéder facilement à leurs propriétés.

Elle s’intègre au paquet `logging` et permet aux développeurs de consulter ou d’exploiter dynamiquement les niveaux de log, par exemple pour filtrer, trier ou afficher des messages selon leur gravité ou leurs caractéristiques spécifiques.

L’utilisation de cette fonction facilite la gestion fine des logs dans le projet, en offrant une vue centralisée et structurée des différents niveaux et de leurs attributs, tout en conservant la flexibilité d’accès pour des besoins spécifiques.

#### addLevel

Ajoute un nouveau niveau de log personnalisé au paquet `logging`.

```luau
logging.addLevel(
    name : string, index : number, flags : {string}?, autoFixIndex: boolean?
): boolean
```

**Paramètres**

:::: field-group

::: field name="name" type="string"
Nom du niveau que vous souhaitez créer. Ce nom sera utilisé pour identifier le niveau dans les appels de log.
:::

::: field name="index" type="number"
Niveau de priorité associé. Les niveaux avec un index plus élevé sont considérés comme plus importants. Cela influence quels messages seront affichés ou ignorés selon le threshold défini dans la configuration.
:::

::: field name="flags" type="table? optional"
Propriétés optionnelles à associer au niveau. Les valeurs possibles incluent :
- `canWarn` : le niveau peut générer des avertissements.
- `advancedOutput` : le niveau produit des logs détaillés avec informations supplémentaires.
:::

::: field name="autoFixIndex" type="boolean? optional"
Si `true`, corrige automatiquement l’index du niveau si celui-ci est déjà utilisé par un autre niveau. Cela permet d’éviter les conflits et de garantir que chaque niveau ait un index unique.
:::

::::

**Retours**

:::: field-group

::: field type="boolean"
Retourne `true` si le niveau a été ajouté avec succès, `false` si l’ajout a échoué (par exemple en cas de conflit de nom ou d’index non résoluble).
:::

::::

Cette fonction permet d’étendre le système de journalisation en ajoutant de nouveaux niveaux personnalisés. Le paramètre `name` définit le nom du niveau, tandis que `index` indique sa priorité relative. Les `flags` permettent de spécifier des comportements particuliers pour le niveau, comme l’autorisation d’avertissements ou l’activation de sorties détaillées.

L’option `autoFixIndex` est utile pour éviter les conflits d’index, en ajustant automatiquement la valeur si un autre niveau utilise déjà le même index. Cela permet de maintenir la cohérence du système sans avoir à gérer manuellement les priorités.

En cas de succès, la fonction retourne `true`, ce qui permet de confirmer que le niveau a bien été ajouté et est prêt à être utilisé pour la journalisation.

#### removeLevel

Supprime un niveau de log existant du paquet `logging`.

```luau
logging.removeLevel(
    name: string
): nil
```

**Paramètres**

:::: field-group

::: field name="name" type="string"
Nom du niveau de log à supprimer. Ce nom doit correspondre exactement à celui utilisé lors de l’ajout avec addLevel.
:::

::::

Cette fonction permet de retirer un niveau de log précédemment créé. Une fois supprimé, ce niveau ne pourra plus être utilisé pour les appels de journalisation.

Cela est utile pour nettoyer des niveaux temporaires ou obsolètes, ou pour réorganiser la hiérarchie des priorités sans redémarrer l'expérience.

La fonction ne retourne aucune valeur (`nil`) et les niveaux supprimés sont définitivement retirés de la configuration en cours.

#### getLogs

Récupère tous les logs actuellement enregistrés par le paquet `logging`.

```luau
logging.getLogs(
): { string }
```

**Retours**

:::: field-group

::: field type="table"
Table contenant tous les messages de log sous forme de chaînes (`string`). Chaque élément de la table correspond à un message enregistré, dans l’ordre chronologique.
:::

::::

Cette fonction permet d’accéder à l’ensemble des logs qui ont été générés depuis le lancement de l’expérience ou depuis la dernière réinitialisation du journal.

Elle est utile pour analyser le comportement du code, exporter des logs pour débogage ou afficher l’historique des messages dans des interfaces personnalisées.

La table retournée est indépendante et peut être parcourue ou copiée sans affecter l’enregistrement des logs en cours.

#### clearLogs

Efface tous les logs actuellement enregistrés par le paquet `logging`.

```luau
logging.clearLogs(
): nil
```

`clearLogs` permet de supprimer tous les messages de log stockés jusqu’à présent. Cela est utile pour réinitialiser l’historique des logs, par exemple avant de lancer une nouvelle session de test ou après avoir exporté les messages pour analyse.

La fonction ne retourne aucune valeur (`nil`) et tous les logs précédemment enregistrés sont définitivement effacés.

*[string]: Une séquence de caractères, tels que des lettres, des chiffres et des symboles.
*[boolean]: Type de données ayant une valeur de vrai ou faux.
*[number]: Un nombre à virgule flottante double précision.
*[nil]: N'importe quel type