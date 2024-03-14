# README

SET-UP :

Ruby ==> 3.1.2

Rails ==> 7.1.3.2

SQLite

Vue.js ==> @vue/cli 5.0.8 (Vue 2)

## SET-UP MACOS :
## rbenv

On va maintenant installer [`rbenv`](https://github.com/sstephenson/rbenv), un logiciel qui permet d’installer et de gérer des environnements `ruby`.

Pour commencer, tu dois nettoyer toute installation antérieure éventuelle de Ruby :

```bash
rvm implode && sudo rm -rf ~/.rvm
# Si tu vois apparaître « zsh: command not found: rvm », continue. Cela signifie que `rvm` n’est pas installé
# sur ton ordinateur, et c’est qu’on veut !

sudo rm -rf $HOME/.rbenv /usr/local/rbenv /opt/rbenv /usr/local/opt/rbenv
```

:warning: Cette commande est susceptible de te demander ton mot de passe.

:warning: Lorsque tu saisiras ton mot de passe, rien ne s’affichera à l’écran ; **c’est normal**. Il s’agit d’une mesure de sécurité permettant de masquer ton mot de passe et sa longueur. Saisis simplement ton mot de passe, puis appuie sur `Enter`.

Dans le terminal, exécute :

```bash
brew uninstall --force rbenv ruby-build
exec zsh
```

Puis exécute ensuite :

```bash
brew install rbenv
```


## Ruby

### Installation

Tu peux maintenant installer la dernière version de [ruby](https://www.ruby-lang.org/en/) et en faire la version par défaut.

Exécute cette commande ; cela **peut prendre un moment (5-10 minutes)**

```bash
rbenv install 3.1.2
```

Une fois que l’installation de Ruby est terminée, exécute cette commande pour indiquer au système
d’utiliser la version 3.1.2 par défaut.

```bash
rbenv global 3.1.2
```

**Réinitialise** ton ton terminal et vérifie ta version de Ruby :

```bash
exec zsh
```

Puis exécute :

```bash
ruby -v
```

:heavy_check_mark: Si tu vois apparaître un message commençant par `ruby 3.1.2p`, tu peux continuer :+1:

### Installer des gems

Dans l’environnement ruby, les bibliothèques externes sont appelées des `gems` : ce sont des bouts de code ruby, que tu peux télécharger et exécuter sur ton ordinateur. On va en installer quelques-unes.

Tout d'abord, nous allons mettre à jour `bundler`, ce qui nous permet d'installer des gemmes :

```bash
gem update bundler
```

Copie-colle la commande suivante dans ton terminal :

```bash
gem install colored faker http pry-byebug rake rails rest-client rspec rubocop-performance sqlite3
```

:heavy_check_mark: Si tu vois apparaître `xx gems installed`, c’est bon :+1:

:x: Si tu obtiens l’erreur suivante :

```bash
ERROR: While executing gem ... (TypeError)
incompatible marshal file format (can't be read)
format version 4.8 required; 60.33 given
```

Exécute la commande suivante :
```bash
rm -rf ~/.gemrc
```

Exécute à nouveau la commande pour installer les gems.

:warning: N’installe **JAMAIS** une gem avec `sudo gem install` ! Et ce même si tu tombes sur une réponse de Stack Overflow (ou du terminal) t’invitant à le faire.

## SQLite

Dans quelques semaines, on abordera les bases de données et le SQL. [SQLite](https://sqlite.org/index.html) est un système de gestion de base de données utilisé pour exécuter des requêtes SQL sur des bases de données d'un seul fichier. Installons-le :

Dans un terminal, exécute la commande suivante :

```bash
brew install sqlite
```

Puis exécute celle-ci :

```bash
sqlite3 -version
```

:heavy_check_mark: Si tu vois une version s'afficher, c'est tout bon :+1:

## Rails

```bash
gem install rails
```

## Node.js

[Node.js](https://nodejs.org/en/) est un programme d’exécution JavaScript qui permet d’exécuter du code JavaScript dans le terminal. On va l’installer avec [nvm](https://github.com/nvm-sh/nvm), un gestionnaire de versions pour Node.js.

Exécute les commandes suivantes dans ton terminal :

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
exec zsh
```

Puis exécute la commande suivante :

```bash
nvm -v
```

Tu devrais voir apparaître une version. Sinon, demande au prof.

On va maintenant installer node :

```bash
nvm install 16.15.1
```

Une fois l’installation terminée, exécute :

```bash
node -v
```

Si tu vois apparaître `v16.15.1`, l'installation a réussi :heavy_check_mark: Tu peux alors exécuter :

```bash
nvm cache clear
```

:x: Sinon, **demande au prof**


## yarn

[`yarn`](https://yarnpkg.com/) est un gestionnaire de paquets, qui permet d’installer des bibliothèques JavaScript. Installons-le :

Exécute les commandes suivantes dans le terminal :

```bash
npm install --global yarn
exec zsh
```

Puis exécute la commande suivante :

```bash
yarn -v
```

:heavy_check_mark: Si tu vois apparaître une version, c’est bon :+1:

:x: Sinon, **demande au prof**



## SET-UP WINDOWS :
## rbenv

On va maintenant installer [`rbenv`](https://github.com/sstephenson/rbenv), un logiciel qui permet d’installer et de gérer des environnements `ruby`.

Pour commencer, tu dois nettoyer toute installation antérieure éventuelle de Ruby :

```bash
rvm implode && sudo rm -rf ~/.rvm
# If you got "zsh: command not found: rvm", carry on.
# It means `rvm` is not on your computer, that's what we want!
rm -rf ~/.rbenv
```

Puis dans le terminal, exécute :

```bash
sudo apt install -y build-essential tklib zlib1g-dev libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev libreadline-dev
```

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```

```bash
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
exec zsh
```


## Ruby

### Installation

Tu peux maintenant installer la dernière version de [ruby](https://www.ruby-lang.org/en/) et en faire la version par défaut.

Exécute cette commande ; cela **peut prendre un moment (5-10 minutes)**

```bash
rbenv install 3.1.2
```

Une fois que l’installation de Ruby est terminée, exécute cette commande pour indiquer au système
d’utiliser la version 3.1.2 par défaut.

```bash
rbenv global 3.1.2
```

**Réinitialise** ton ton terminal et vérifie ta version de Ruby :

```bash
exec zsh
```

Puis exécute :

```bash
ruby -v
```

:heavy_check_mark: Si tu vois apparaître un message commençant par `ruby 3.1.2p`, tu peux continuer :+1:

:x: Sinon, **demande au prof**

### Installer des gems

<details>
  <summary>Si tu es en <bold>Chine</bold> 🇨🇳 clique ici</summary>

  :warning: Si tu es en Chine, mets à jour la procédure d’installation des gems avec les commandes suivantes.

```bash
# En Chine seulement !
gem sources --remove https://rubygems.org/
gem sources -a https://gems.ruby-china.com/
gem sources -l
# *** SOURCES ACTUELLES ***
# https://gems.ruby-china.com/
# Ruby-china.com doit maintenant figurer dans la liste
```
</details>

**Que tu sois en Chine ou non**, continue ici pour installer les gems.

Dans l’environnement ruby, les bibliothèques externes sont appelées des `gems` : ce sont des bouts de code ruby, que tu peux télécharger et exécuter sur ton ordinateur. On va en installer quelques-unes.

Tout d'abord, nous allons mettre à jour `bundler`, ce qui nous permet d'installer des gemmes :

```bash
gem update bundler
```

Copie-colle la commande suivante dans ton terminal :

```bash
gem install colored faker http pry-byebug rake rails rest-client rspec rubocop-performance sqlite3
```

:heavy_check_mark: Si tu vois apparaître `xx gems installed`, c’est bon :+1:

:x: Si tu obtiens l’erreur suivante :

```bash
ERROR: While executing gem ... (TypeError)
incompatible marshal file format (can't be read)
format version 4.8 required; 60.33 given
```

Exécute la commande suivante :
```bash
rm -rf ~/.gemrc
```

Exécute à nouveau la commande pour installer les gems.

:warning: N’installe **JAMAIS** une gem avec `sudo gem install` ! Et ce même si tu tombes sur une réponse de Stack Overflow (ou du terminal) t’invitant à le faire.

## SQLite

Dans quelques semaines, on abordera les bases de données et le SQL. [SQLite](https://sqlite.org/index.html) est un système de gestion de base de données utilisé pour exécuter des requêtes SQL sur des bases de données d'un seul fichier. Installons-le :

Dans un terminal, exécute la commande suivante :

```bash
sudo apt-get install sqlite3 libsqlite3-dev
```

Puis exécute celle-ci :

```bash
sqlite3 -version
```

:heavy_check_mark: Si tu vois une version s'afficher, c'est tout bon :+1:

:x: If not, **demande au prof**

## Rails

```bash
gem install rails
```

## Node.js

[Node.js](https://nodejs.org/en/) est un programme d’exécution JavaScript qui permet d’exécuter du code JavaScript dans le terminal. On va l’installer avec [nvm](https://github.com/nvm-sh/nvm), un gestionnaire de versions pour Node.js.

Exécute les commandes suivantes dans ton terminal :

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
exec zsh
```

Puis exécute la commande suivante :

```bash
nvm -v
```

Tu devrais voir apparaître une version. Sinon, demande au prof.

On va maintenant installer node :

```bash
nvm install 16.15.1
```

Une fois l’installation terminée, exécute :

```bash
node -v
```

Si tu vois apparaître `v16.15.1`, l'installation a réussi :heavy_check_mark: Tu peux alors exécuter :

```bash
nvm cache clear
```

:x: Sinon, **demande au prof**


## yarn

[`yarn`](https://yarnpkg.com/) est un gestionnaire de paquets, qui permet d’installer des bibliothèques JavaScript. Installons-le :

Exécute les commandes suivantes dans le terminal :

```bash
npm install --global yarn
exec zsh
```

Puis exécute la commande suivante :

```bash
yarn -v
```

:heavy_check_mark: Si tu vois apparaître une version, c’est bon :+1:

:x: Sinon, **demande au prof**



## SET-UP LINUX
## rbenv

On va maintenant installer [`rbenv`](https://github.com/sstephenson/rbenv), un logiciel qui permet d’installer et de gérer des environnements `ruby`.

Pour commencer, tu dois nettoyer toute installation antérieure éventuelle de Ruby :

```bash
rvm implode && sudo rm -rf ~/.rvm
# If you got "zsh: command not found: rvm", carry on.
# It means `rvm` is not on your computer, that's what we want!
rm -rf ~/.rbenv
```

Puis dans le terminal, exécute :

```bash
sudo apt install -y build-essential tklib zlib1g-dev libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev libreadline-dev
```

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```

```bash
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
exec zsh
```

## Ruby

### Installation

Tu peux maintenant installer la dernière version de [ruby](https://www.ruby-lang.org/en/) et en faire la version par défaut.

Exécute cette commande ; cela **peut prendre un moment (5-10 minutes)**

```bash
rbenv install 3.1.2
```

Une fois que l’installation de Ruby est terminée, exécute cette commande pour indiquer au système
d’utiliser la version 3.1.2 par défaut.

```bash
rbenv global 3.1.2
```

**Réinitialise** ton ton terminal et vérifie ta version de Ruby :

```bash
exec zsh
```

Puis exécute :

```bash
ruby -v
```

:heavy_check_mark: Si tu vois apparaître un message commençant par `ruby 3.1.2p`, tu peux continuer :+1:

:x: Sinon, **demande au prof**

### Installer des gems

<details>
  <summary>Si tu es en <bold>Chine</bold> 🇨🇳 clique ici</summary>

  :warning: Si tu es en Chine, mets à jour la procédure d’installation des gems avec les commandes suivantes.

```bash
# En Chine seulement !
gem sources --remove https://rubygems.org/
gem sources -a https://gems.ruby-china.com/
gem sources -l
# *** SOURCES ACTUELLES ***
# https://gems.ruby-china.com/
# Ruby-china.com doit maintenant figurer dans la liste
```
</details>

**Que tu sois en Chine ou non**, continue ici pour installer les gems.

Dans l’environnement ruby, les bibliothèques externes sont appelées des `gems` : ce sont des bouts de code ruby, que tu peux télécharger et exécuter sur ton ordinateur. On va en installer quelques-unes.

Tout d'abord, nous allons mettre à jour `bundler`, ce qui nous permet d'installer des gemmes :

```bash
gem update bundler
```

Copie-colle la commande suivante dans ton terminal :

```bash
gem install colored faker http pry-byebug rake rails rest-client rspec rubocop-performance sqlite3
```

:heavy_check_mark: Si tu vois apparaître `xx gems installed`, c’est bon :+1:

:x: Si tu obtiens l’erreur suivante :

```bash
ERROR: While executing gem ... (TypeError)
incompatible marshal file format (can't be read)
format version 4.8 required; 60.33 given
```

Exécute la commande suivante :
```bash
rm -rf ~/.gemrc
```

Exécute à nouveau la commande pour installer les gems.

:warning: N’installe **JAMAIS** une gem avec `sudo gem install` ! Et ce même si tu tombes sur une réponse de Stack Overflow (ou du terminal) t’invitant à le faire.

## SQLite

Dans quelques semaines, on abordera les bases de données et le SQL. [SQLite](https://sqlite.org/index.html) est un système de gestion de base de données utilisé pour exécuter des requêtes SQL sur des bases de données d'un seul fichier. Installons-le :

Dans un terminal, exécute la commande suivante :

```bash
sudo apt-get install sqlite3 libsqlite3-dev
```

Puis exécute celle-ci :

```bash
sqlite3 -version
```

:heavy_check_mark: Si tu vois une version s'afficher, c'est tout bon :+1:

:x: If not, **demande au prof**

## Rails

```bash
gem install rails
```

## Node.js

[Node.js](https://nodejs.org/en/) est un programme d’exécution JavaScript qui permet d’exécuter du code JavaScript dans le terminal. On va l’installer avec [nvm](https://github.com/nvm-sh/nvm), un gestionnaire de versions pour Node.js.

Exécute les commandes suivantes dans ton terminal :

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
exec zsh
```

Puis exécute la commande suivante :

```bash
nvm -v
```

Tu devrais voir apparaître une version. Sinon, demande au prof.

On va maintenant installer node :

```bash
nvm install 16.15.1
```

Une fois l’installation terminée, exécute :

```bash
node -v
```

Si tu vois apparaître `v16.15.1`, l'installation a réussi :heavy_check_mark: Tu peux alors exécuter :

```bash
nvm cache clear
```

:x: Sinon, **demande au prof**


## yarn

[`yarn`](https://yarnpkg.com/) est un gestionnaire de paquets, qui permet d’installer des bibliothèques JavaScript. Installons-le :

Exécute les commandes suivantes dans le terminal :

```bash
npm install --global yarn
exec zsh
```

Puis exécute la commande suivante :

```bash
yarn -v
```

:heavy_check_mark: Si tu vois apparaître une version, c’est bon :+1:

:x: Sinon, **demande au prof**


## INSTALLATION VUE CLI
```bash
yarn global add @vue/cli
```

## INSTALLATION BOOTSTRAP
```bash
npm install bootstrap bootstrap-vue
```
OU

```bash
npm install --save bootstrap
```

## --------------------

Une fois le projet cloné, il faut faire cet enchaînement de commande en console dans Rails :
```bash
bundle install
rails s
```
Puis ouvrir un nouvel onglet :

```bash
rails db:create
rails db:migrate
rails db:seed
```

Pour le front :
```bash
yarn dev
```

url front : http://localhost:8080/#/
url back : http://localhost:3000/
