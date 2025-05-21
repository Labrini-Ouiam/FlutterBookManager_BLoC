# 📚 FlutterBookManager_BLoC

Une application Flutter qui permet de chercher des livres via l’API Google Books, de les enregistrer localement comme favoris, et de les gérer via une architecture propre basée sur **BLoC (Business Logic Component)**.

---

## ✨ Fonctionnalités

- 🔍 Recherche de livres via l'API Google Books
- 📌 Ajout de livres aux favoris (stockage local avec SQLite)
- 🗑️ Suppression de livres favoris
- 🧱 Architecture basée sur `flutter_bloc`

- ![image](https://github.com/user-attachments/assets/8a37d850-b0b4-40c3-9b48-413e32a1c5b9)


---

## 🧱 Architecture du projet

```
lib/
├── blocs/          # BLoC files (events, states, bloc)
├── models/         # Modèle de données (Book)
├── pages/          # UI pages (SearchPage, FavoritesPage)
├── repositories/   # Accès aux API externes
├── services/       # Base de données locale (SQLite)
└── main.dart       # Entrée principale
```

---

## 🚀 Installation

### 1. Cloner le dépôt

```bash
git clone https://github.com/Labrini-Ouiam/FlutterBookManager_BLoC.git
cd FlutterBookManager_BLoC
```

### 2. Installer les dépendances

```bash
flutter pub get
```

### 3. Lancer l’application

```bash
flutter run
```

📱 Fonctionne sur Android, Windows, Web (sans images), etc.

---

## 📦 Dépendances principales

- `flutter_bloc`
- `http`
- `sqflite`
- `path`

---

## 🎓 Réalisé pour le TP mobile (S4) - Génie Logiciel  
> Auteur : Labrini Ouiam  
