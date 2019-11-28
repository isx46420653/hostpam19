# hostpam19:aware

# github: isx46420653/hostpam19:aware

# dockerhub: isx46420653/hostpam19:aware

## ASIX M06-ASO Pau Martín @edt Curs 2019-2020

## Examen 28 - 11 - 2019

-----------------------------------------

1. Creem els usuaris anna i pau a la imatge, ho fem afegint a install.sh les ordres corresponents, un cop ho tinguem comprovem que els ha creat correctament i que tenen les passwords corresponents.

2. Creem el programa pamaware.py, per a fer-ho, copiem el programa de l'exemple del HowTo de PAM, abans de modificar-lo el provem, per a entendre com funciona, un cop ja l'he provat i identificat quines són les variables que utilitza, el modifico per a deixar-lo més personalitzat. Guardem el programa *pamaware.py* junt als fitxers de configuració.

3. Un cop creat el programa PAM aware, creem el mòdul pam_mates.py, agafem el que hi ha a HowTo de PAM, en aquest cas no el podem provar, però intentem identificar com funciona i quines variables hem de modificar.

4. Quan tinguem entesa la sintaxi del fitxer, i quins paràmetres i variables podem canviar sense afectar al funcionament d'aquest, el modifiquem al nostre gust, podem canviar la pregunta matemàtica per a que sigui més complicada. També guardem el fitxer *pam_mates.py* al mateix directori dels fitxers de configuració.

5. També crearem un mòdul anomenat *pam_permit.py*, que tindrà el mateix funcionament que el pam_permit.so, l'utilitzarem per permetre als usuaris canviar-se el chfn. Agafarem l'exemple *pam_permit.py* del HowTo de PAM. Guardem el fitxer el mateix directori dels fitxers de configuració.

6. Per a poder executar el mòdul *pam_mates.py* i *pam_permit.py* necessitem tenir l'objecte que els executi, aquest serà el pam_python.so, i l'haurem de compilar.

+ Descarreguem la [carpeta comprimida](https://netcologne.dl.sourceforge.net/project/pam-python/pam-python-1.0.7-1/pam-python-1.0.7.tar.gz) que conté tots els fitxers necessaris per a crear l'objecte, hem d'observar que la versió sigui la correcta, un cop descarregada l'hem de descomprimir `tar xvzf pam-python-1.0.versio.tar.gz`, i hi entrem amb `cd`.

+ Instal·lem tot el programari necessari:
```
dnf -y install sphinx python3-sphinx phyton2-sphinx gcc
dnf -y install pam-devel
dnf -y install redhat-rpm-config
dnf -y install python-devel
```

+ Editem la línea 201 del fitxer **/usr/include/features.h** deixant-la:
`# define _XOPEN_SOURCE	600`

+ Finalment executem l'ordre `make`, al acabar el procès podem comprovar que al directori src/ hi tenim l'objecte *pam_python.so*, aquest objecte el copiem i el guardem al directori amb els altres fitxers de configuració

7. Editem el fitxer chfn per a que quan els usuaris l'executin se li apliquin les regles de PAM que hem creat.

8. Al fitxer install.sh indiquem tots els fitxers del directori de configuració on s'han de copiar dins del contenidor per a que tot funcioni correctament, crearem un directori anomenat *python* on dins hi tindrem els diversos programes.

9. Modifiquem el fitxer *startup.sh* per a que cridi l'*install.sh* i es configuri tot al iniciar el contenidor.

# Comprovacions

Dins del contenidor i executat l'*install.sh*, podem realitzar les comprovacions.

### Fitxer pamaware.py

Executem `python pamaware.py`, introduim un nom d'usuari vàlid i la contrasenya corresponent, per exemple, *anna*. Observem el missatge que ens dóna:
```
0 Success
anna és un usuari UNIX vàlid
```

Després introduim un nom d'usuari i contrasenya que no existeixin, per exemple, *sergi*. Observem el missatge que ens dóna:
```
7 Authentication failure
NO és un usuari UNIX vàlid
```

### chfn com a usuari NO root

Ens autentiquem com a un usuari local sense privilegis, per exemple *pau*, executem chfn i canviem els valors. Veiem que sense pregunta l'operació matemàtica, la responem correctament i observem el missatge que ens dóna:
```
auth -----------------
Quant fan 5*3?
15
account --------------
Finger information changed.
```
Ara ho tornem a provar però errant la resposta.
```
auth -----------------
Quant fan 5*3?
34
account --------------
chfn: Permission denied
chfn: changing user attribute failed: Permission denied
```
