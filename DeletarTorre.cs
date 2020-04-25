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
    public partial class DeletarTorre : Form
    {
        private DataSet mdataset;
        private MySqlConnection conexao;
        private MySqlDataAdapter mAdapter;

        public DeletarTorre()
        {
            InitializeComponent();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            mdataset = new DataSet();
            mAdapter = new MySqlDataAdapter("SELECT * FROM torre where idTorre="+torreText.Text, conexao);
            mAdapter.Fill(mdataset, "torre");
            dataGridView1.DataSource = mdataset;
            dataGridView1.DataMember = "torre";
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
            mdataset = new DataSet();
            mAdapter = new MySqlDataAdapter("DELETE FROM torre where idTorre=" + torreText.Text, conexao);
            mAdapter.Fill(mdataset, "torre");
            MessageBox.Show("Torre deletada com sucesso");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            TelaInicial form = new TelaInicial();
            DeletarTorre delete = new DeletarTorre();
            delete.Close();
            form.Show();
        }
    }
}
