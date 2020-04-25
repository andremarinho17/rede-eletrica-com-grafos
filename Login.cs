using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace WindowsFormsApp1
{
    public partial class Login : Form
    {
        private DataSet mdataset;
        private MySqlConnection conexao;
        private MySqlDataAdapter mAdapter;

        public Login()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM usuario WHERE idUsuario=?idUsuario and Senha =?Senha and nivelacesso =?nivel", conexao);
            cmd.Parameters.Add("?idUsuario", MySqlDbType.Int16).Value = usuarioTextBox.Text;
            cmd.Parameters.Add("?Senha", MySqlDbType.Int16).Value = senhaTextBox.Text;
            conexao.Open();
            MySqlDataReader le = null;
            le = cmd.ExecuteReader();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            conexao = new MySqlConnection("server=localhost;User id=root;database=infraeletrica;password=");
            try
            {
                conexao.Open();
            }
            finally
            {
                conexao.Close();
            }
            button1.Enabled = false;
            button2.Enabled = true;
        }
    }
}
