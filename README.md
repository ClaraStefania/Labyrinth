### Labyrinth

   Scopul problemei este acela de a gasi iesirea dintr-un labirint
reprezentat printr-o matrice, mergand pe drumul format din zero-uri.

   Sunt initializati indicii cu 0 si elementul de pe prima pozitie devine 1.
Se decrementeaza m (numarul de linii) si n (numarul de coloane). Se verifica
in ordine daca se poate avansa in dreapta, jos, stanga si sus (se verifica
daca elementele sunt 0). Elementele de pe pozitiile vizitate devin 1. Daca se
ajunge la marginea din dreapta sau la cea de jos, se opreste verificarea si
se returneaza indicii.
