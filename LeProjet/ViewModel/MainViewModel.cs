using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using LeProjet.Command;
using LeProjet.Model;
using LeProjet.View;

namespace LeProjet.ViewModel
{

    class MainViewModel : BaseViewModel, INotifyPropertyChanged
    {
        Personnage pers;
        Joueur joueur;

        public MainViewModel()
        {
            JoueurP = new Joueur();
            Pers = new Personnage();
            Inscription = new BaseCommand(Ins, obj => true);
            SeConnecter = new Connexion(this);
            Consulter = new ConsultPerso(this);
        }
        public ICommand OuvrirConnexion
        {
            get;
            private set;
        }
        public ICommand SeConnecter
        {
            get;
            private set;
        }

        public ICommand Consulter
        {
            get;
            private set;
        }
        public bool CanUpdate
        {
            get
            {
                if (pers == null)
                    return false;
                else
                    return true;
            }
        }


        private void Ins(Object obj)
        {
            if (JoueurP.GamerTag == "")

            {
                MessageBox.Show("Veuillez entrer au complet vos informations d'inscription");
            }
            else
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO tblJoueur(nom,prenom,gamerTag,motDePasse) VALUES(@param1,@param2,@param3,@param4)", con);
                    cmd.Parameters.Add("@param1", SqlDbType.VarChar, 255).Value = JoueurP.Nom;
                    cmd.Parameters.Add("@param2", SqlDbType.VarChar, 255).Value = JoueurP.Prenom;
                    cmd.Parameters.Add("@param3", SqlDbType.VarChar, 255).Value = JoueurP.GamerTag;
                    cmd.Parameters.Add("@param4", SqlDbType.Int, 10).Value = JoueurP.Password;
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Inscription Reussie! Veuillez vous connecter");
                }
                
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        public void Connectee()
        {
            int id = 0;
            if (JoueurP.GamerTag == "")

            {
                MessageBox.Show("Veuillez entrer vos informations de connexion");
            }
            else
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT id FROM tblJoueur WHERE gamerTag = @param1 AND motDePasse = @param2", con);
                    cmd.Parameters.Add("@param1", SqlDbType.VarChar, 255).Value = JoueurP.GamerTag;
                    cmd.Parameters.Add("@param2", SqlDbType.Int, 10).Value = JoueurP.Password;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet, "tblJoueur");


                    foreach (DataRow row in dataSet.Tables[0].Rows)
                    {
                        id = Int32.Parse(row[0].ToString());
                    }
                    if (id != 0)
                    {
                        Window fenetre2 = new GestionPerso();
                        fenetre2.Show();
                        fenetre2.DataContext = this;
                    }
                    else
                    {
                        MessageBox.Show("GamerTag ou Mot de Passe Erroné");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }

        }

        public void ConsulterPerso()
        {
            Window fenetre2 = new CreateConsulPerso();
            fenetre2.Show();
            fenetre2.DataContext = this;
        }
        public void Supp()
        {
            Window fenetre2 = new CreateConsulPerso();
            fenetre2.Show();
            fenetre2.DataContext = this;
        }

        public Personnage Pers { get => pers; set { pers = value; OnPropertyChanged("Pers"); } }
        public Joueur JoueurP { get => joueur; set { joueur = value; OnPropertyChanged("JoueurP"); } }
        public ICommand Connexion { get; set; }
        public ICommand Inscription { get; set; }



        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;

            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
