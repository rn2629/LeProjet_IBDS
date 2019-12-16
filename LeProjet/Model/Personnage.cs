using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeProjet.Model
{
    class Personnage : INotifyPropertyChanged
    {
        string nom = "";
        int divinite = 0;
        int alignement = 0;
        int classe = 0;
        int niveau = 0;
        int race = 0;
        char genre;
        int age = 0;
        int taille = 0;
        float poids = 0;
        string yeux = "";
        string cheveux = "";
        int joueur = 0;

        public Personnage()
        {
            Nom = nom;
            Divinite = divinite;
            Alignement = alignement;
            Classe = classe;
            Niveau = niveau;
            Race = race;
            Genre = genre;
            Age = age;
            Taille = taille;
            Poids = poids;
            Yeux = yeux;
            Cheveux = cheveux;
            Joueur = joueur;
        }


        public string Nom { get => nom; set { nom = value; OnPropertyChanged("Nom"); } }

        public int Divinite { get => divinite; set { divinite = value; OnPropertyChanged("Divinite"); } }

        public int Alignement { get => alignement; set { alignement = value; OnPropertyChanged("Alignement"); } }

        public int Classe { get => classe; set { classe = value; OnPropertyChanged("Classe"); } }

        public int Niveau { get => niveau; set { niveau = value; OnPropertyChanged("Niveau"); } }

        public int Race { get => race; set { race = value; OnPropertyChanged("Race"); } }

        public char Genre { get => genre; set { genre = value; OnPropertyChanged("Genre"); } }

        public int Age { get => age; set { age = value; OnPropertyChanged("Age"); } }

        public int Taille { get => taille; set { taille = value; OnPropertyChanged("Taille"); } }

        public float Poids { get => poids; set { poids = value; OnPropertyChanged("Poids"); } }

        public string Yeux { get => yeux; set { yeux = value; OnPropertyChanged("Yeux"); } }

        public string Cheveux { get => cheveux; set { cheveux = value; OnPropertyChanged("Cheveux"); } }

        public int Joueur { get => joueur; set { joueur = value; OnPropertyChanged("Joueur"); } }


        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
