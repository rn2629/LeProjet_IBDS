using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using LeProjet.ViewModel;

namespace LeProjet.Command
{
    class SupprimerPerso : ICommand
    {
         
         

        private MainViewModel mainViewModel;
        public Predicate<object> CanExecuteFunc
        {
            get;
            set;
        }

        public Action<object> ExecuteFunc
        {
            get;
            set;
        }

        public SupprimerPerso(MainViewModel _mainViewModel)
        {

            mainViewModel = _mainViewModel;
        }

        public bool CanExecute(object parameter)
        {
            return mainViewModel.CanUpdate;
        }



        public void Execute(object parameter)
        {
            mainViewModel.Supp();

        }

        #region ICommand Members

        public event System.EventHandler CanExecuteChanged // peut etre ajouter partt dans notre code
        {
            add { CommandManager.RequerySuggested += value; }
            remove { CommandManager.RequerySuggested -= value; }
        }

        #endregion
    }

}
