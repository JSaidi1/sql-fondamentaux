
# Exercice jointures:

Considérez deux tables, "Clients" et "Achats".

   a. **INNER JOIN :**
   - Sélectionnez les noms et prénoms des clients ainsi que les détails de leurs achats (si disponibles).

   b. **LEFT JOIN :**
   - Sélectionnez tous les clients et les détails de leurs achats s'ils ont effectué des achats, sinon affichez les colonnes des achats avec des valeurs NULL.

   c. **RIGHT JOIN :**
   - Sélectionnez tous les achats et les détails des clients correspondants, même s'il n'y a pas de correspondance pour certains achats.

   d. **FULL JOIN :**
   - Sélectionnez tous les clients et tous les achats, en affichant les détails des clients même s'ils n'ont pas effectué d'achats, et vice versa.

---

### Correction :

**a. INNER JOIN :**
```sql
SELECT Clients.nom, Clients.prenom, Achats.produit, Achats.montant
FROM Clients
INNER JOIN Achats ON Clients.id = Achats.client_id;
```

**b. LEFT JOIN :**
```sql
SELECT Clients.nom, Clients.prenom, Achats.produit, Achats.montant
FROM Clients
LEFT JOIN Achats ON Clients.id = Achats.client_id;
```

**c. RIGHT JOIN :**
```sql
SELECT Clients.nom, Clients.prenom, Achats.produit, Achats.montant
FROM Clients
RIGHT JOIN Achats ON Clients.id = Achats.client_id;
```

**d. FULL JOIN :**
```sql
SELECT Clients.nom, Clients.prenom, Achats.produit, Achats.montant
FROM Clients
FULL JOIN Achats ON Clients.id = Achats.client_id;
```

```sql
-- Simuler un FULL JOIN en MySQL
SELECT Clients.nom, Clients.prenom, Achats.produit, Achats.montant
FROM Clients
LEFT JOIN Achats ON Clients.id = Achats.client_id
UNION
SELECT Clients.nom, Clients.prenom, Achats.produit, Achats.montant
FROM Clients
RIGHT JOIN Achats ON Clients.id = Achats.client_id
WHERE Clients.id IS NULL;
```
