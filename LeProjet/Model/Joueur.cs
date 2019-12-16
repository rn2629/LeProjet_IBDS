using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeProjet.Model
{
    class Joueur : INotifyPropertyChanged
    {
        string nom = "";
        string prenom = "";
        string gamerTag = "";
        int password;

        public Joueur()
        {
            Nom = nom;
            Prenom = prenom;
            GamerTag = gamerTag;
            Password = password;
        }


        public string Nom { get => nom; set { nom = value; OnPropertyChanged("Nom"); } }

        public string Prenom { get => prenom; set { prenom = value; OnPropertyChanged("Prenom"); } }

        public string GamerTag { get => gamerTag; set { gamerTag = value; OnPropertyChanged("GamerTag"); } }

        public int Password { get => password; set { password = value; OnPropertyChanged("Password"); } }


        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
