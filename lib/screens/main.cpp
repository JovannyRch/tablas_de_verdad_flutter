#include <iostream>
#include <string.h>
#include <stdlib.h>
#include <fstream>
#include <iomanip>
#include <conio.h>

using namespace std;

struct Inf
{
  char modelo[30];
  int anio;
  float kilometraje;
  double precio;
};
struct Inf Ini = {'\0', 0, 0, 0};

struct Inf leerDatos()
{
  struct Inf R;
  cout << "\nDame el modelo del auto: ";
  cin.ignore();
  cin >> R.modelo;
  cout << "\nDame el anio: ";
  cin >> R.anio;
  cout << "\nDame la kilometraje: ";
  cin >> R.kilometraje;
  cout << "\nDame el precio: ";
  cin >> R.precio;
  return R;
}
class Nodo
{
  struct Inf dato;
  Nodo *sig, *ant;

public:
  Nodo(struct Inf d = Ini, Nodo *a = NULL, Nodo *s = NULL)
  {
    dato = d;
    sig = s;
    ant = a;
  }
  struct Inf Regdato() { return dato; }
  Nodo *Regsig() { return (sig); }
  Nodo *Regant() { return (ant); }
  void Modfsig(Nodo *s) { sig = s; }
  void Modfant(Nodo *a) { ant = a; }

  void Modfdato(struct Inf d) { dato = d; }
  void ModfModelo(char modelo[]) { strcpy(dato.modelo, modelo); }
  void ModfAnio(int anio) { dato.anio = anio; }
  void ModfKilometraje(float kilometraje) { dato.kilometraje = kilometraje; }
  void ModfPrecio(double precio) { dato.precio = precio; }
};
class LDE
{
  Nodo *st, *ed, *gen, *aux;

public:
  LDE() { st = ed = gen = NULL; }
  void Insertar(struct Inf x);
  void InsOrd(struct Inf x);
  void Imprimir();
  void Buscar(char x[]);
  void Eliminar();
  void Modificar();
  void GuarArch();
  void LeerArch();
};
void LDE::Eliminar()
{
  Nodo *p = NULL, *q = NULL;
  if (aux == st)
  {
    st = aux->Regsig();
    aux->Modfsig(NULL);
    st->Modfant(NULL);
    delete aux;
    return;
  }
  else
  {
    if (aux == ed)
    {
      ed = aux->Regant();
      ed->Modfsig(NULL);
      aux->Modfsig(NULL);
      delete aux;
      return;
    }
    else
    {
      p = aux->Regant();
      q = aux->Regsig();
      q->Modfant(p);
      p->Modfsig(q);
      aux->Modfant(NULL);
      delete aux;
      return;
    }
  }
}
void LDE::Modificar()
{
  struct Inf Nvovalor;
  cout << "Dame el nuevo valor: ";
  Nvovalor = leerDatos();
  aux->Modfdato(Nvovalor);
  Imprimir();
  Eliminar();
  InsOrd(Nvovalor);
  Imprimir();
}
void LDE::Imprimir()
{
  Nodo *i;
  cout << "Imprimir de izquierda a derecha" << endl;
  for (i = st; i != NULL; i = i->Regsig())
  {
    cout << i->Regdato().modelo << ", " << i->Regdato().anio << ", "
         << i->Regdato().kilometraje << ", "
         << i->Regdato().precio
         << " | ";
  }
  cout << "\nImprimir de derecha a izquierda" << endl;
  for (i = ed; i != NULL; i = i->Regant())
  {
    cout << i->Regdato().modelo << ", " << i->Regdato().anio << ", "
         << i->Regdato().kilometraje << ", "
         << i->Regdato().precio
         << " | ";
  }
}
void LDE::Insertar(struct Inf x)
{
  if (st == NULL)
  {
    gen = new Nodo(x);
    if (gen == NULL)
    {
      cout << "No hay memoria suficiente" << endl;
      exit(1);
    }
    st = ed = gen;
  }
  else
  {
    Nodo *p = gen;
    gen = new Nodo(x, p);
    if (gen == NULL)
    {
      cout << "No hay memoria suficiente" << endl;
      exit(1);
    }
    p->Modfsig(gen);
    ed = gen;
  }
}
void LDE::Buscar(char x[])
{
  aux = st;
  while (strcmp(x, aux->Regdato().modelo) != 0)
  {
    aux = aux->Regsig();
    if (aux == NULL)
    {
      cout << "No existe en la lista";
      exit(1);
    }
    cout << "Valor encontrado" << aux->Regdato().modelo;
  }
}
void LDE::InsOrd(struct Inf x)
{
  Nodo *p = NULL, *q = NULL;
  if (st == NULL)
  {
    gen = new Nodo(x);
    if (gen == NULL)
    {
      cout << "No hay memoria" << endl;
      exit(1);
    }
    st = ed = gen;
  }
  else
  {
    p = st;
    if (strcmp(x.modelo, p->Regdato().modelo) < 0)
    {
      gen = new Nodo(x, p);
      if (gen == NULL)
      {
        cout << "No hay memoria" << endl;
        exit(1);
      }
      p->Modfant(gen);
      st = gen;
    }
    else
    {
      p = ed;
      if (strcmp(x.modelo, p->Regdato().modelo) > 0)
      {
        gen = new Nodo(x, p);
        if (gen == NULL)
        {
          cout << "No hay memoria" << endl;
          exit(1);
        }
        p->Modfsig(gen);
        ed = gen;
      }
      else
      {
        p = st;
        while (strcmp(x.modelo, p->Regdato().modelo) > 0)
        {
          p = p->Regsig();
          q = p->Regant();
          gen = new Nodo(x, q, p);
          if (gen == NULL)
          {
            cout << "No hay memoria" << endl;
            exit(1);
          }
          p->Modfant(gen);
          q->Modfsig(gen);
        }
      }
    }
  }
}
void LDE::GuarArch()
{
  Nodo *p;
  ofstream arch;
  char nom[30];
  cout << "\nDame el nombre del archivo: ";
  cin >> nom;
  arch.open(nom, ios::app);
  arch << "\n\n\nElaboro: Canchola Velazquez Osvaldo Martin" << endl;
  arch << "Practica de Archivos. Escribir en un archivo" << endl;

  arch << "\n"
       << setw(10) << "MODELO" << setw(10) << "ANIO" << setw(10) << "KM" << setw(10) << "PRECIO" << endl;

  for (p = st; p != NULL; p = p->Regsig())
  {
    arch << "\n"
         << setw(10) << p->Regdato().modelo << setw(10) << p -
        > Regdato().anio << setw(10) << p->Regdato().kilometraje << setw(10) << p -
        > Regdato().precio << endl;
  }
  arch.close();
}
void LDE::LeerArch()
{
  Inf l;
  ifstream arch;
  char nom[30];
  char datos[50];
  cout << "\n\nDame el nombre del archivo: ";
  cin >> nom;
  arch.open(nom);
  cout << "\nLeyendo archivo...";
  if (arch != NULL)
  {
    while (arch.getline(datos, 50))
    {
      cout << datos << endl;
    }
  }
  else
  {
    cout << "El archivo esta vacio" << endl;
  }
}
int main()
{
  int opc;
  int entrada;
  char modelo[30];
  LDE R = LDE();
  do
  {
    system("cls");
    cout << "\n\t\tM E N U \t\t" << endl;
    cout << "\t1.- Insertar" << endl;
    cout << "\t2.- Insertar Ordenado" << endl;
    cout << "\t3.- Eliminar" << endl;
    cout << "\t4.- Modificar" << endl;
    cout << "\t5.- Guardar Archivo" << endl;
    cout << "\t6.- Leer Archivo" << endl;
    cout << "\t7.- Imprimir" << endl;
    cout << "\t8.- Salir" << endl;
    cout << "\n\t\tOpcion: ";
    cin >> opc;

    switch (opc)
    {
    case 1:
      cout << "\n\tInsertar" << endl;
      R.Insertar(leerDatos());
      break;
    case 2:
      cout << "\n\tInsertar Ordenadamente" << endl;
      R.InsOrd(leerDatos());
      break;
    case 3:
      cout << "\nDame el modelo del auto a Eliminar: ";
      cin >> modelo;
      R.Buscar(modelo);
      cin.ignore();
      R.Eliminar();
      break;
    case 4:
      cout << "\nDame el modelo del auto a Modificar: ";
      cin >> modelo;
      R.Buscar(modelo);
      cin.ignore();
      R.Modificar();
      break;
    case 5:
      R.GuarArch();
      break;
    case 6:
      R.LeerArch();
      break;
    case 7:
      cout << "\nLSEO: ";
      R.Imprimir();
      break;
    case 8:
      cout << "\n\n\n\tGracias por usar este software" << endl;
      break;
    default:

      break;
    }
    cout << "\n\n";
    system("pause");
  } while (opc != 8);

  return 0;
}
