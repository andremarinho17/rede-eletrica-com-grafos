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
    public partial class Inserir : Form
    {

        private DataSet mdataset;
        private MySqlConnection conexao;
        private MySqlDataAdapter mAdapter;
        private MySqlConnection connection = null;

        public Inserir()
        {
            InitializeComponent();
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
            button1.Enabled = true;
            button2.Enabled = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string stringConexao = "server=localhost;User id=root;database=infraeletrica;password=";
            connection = new MySqlConnection(stringConexao);
            connection.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = "INSERT INTO usuario (idUsuario,Nome,CPF,Endereco,Numero,idTipoUsuario,Telefone,Senha,idTorre) values(@idUsuario,@Nome,@CPF,@Endereco,@Numero,@idTipoUsuario,@Telefone,@Senha,@idTorre)";
            cmd.Prepare();

            cmd.Parameters.AddWithValue("@idUsuario", usuarioTextBox.Text);
            cmd.Parameters.AddWithValue("@Nome", textBox1.Text);
            cmd.Parameters.AddWithValue("@CPF", textBox2.Text);
            cmd.Parameters.AddWithValue("@Endereco", textBox3.Text);
            cmd.Parameters.AddWithValue("@Numero", textBox4.Text);
            cmd.Parameters.AddWithValue("@idTipoUsuario", textBox5.Text);
            cmd.Parameters.AddWithValue("@Telefone", textBox6.Text);
            cmd.Parameters.AddWithValue("@Senha", textBox7.Text);
            cmd.Parameters.AddWithValue("@idTorre", textBox8.Text);
            cmd.ExecuteNonQuery();
        }

        private void usuarioTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            TelaInicial form = new TelaInicial();
            Inserir inserir = new Inserir();
            inserir.Close();
            form.Show();
        }

        private void Inserir_Load(object sender, EventArgs e)
        {

        }
    }
}
