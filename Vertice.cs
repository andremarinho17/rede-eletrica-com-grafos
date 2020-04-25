using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp1
{
    public class Vertice
    {
        public int Id { get; set; }
        public string Subconjunto { get; set; }
        public string Funcionario { get; set; }

        public List<Vertice> VerticesAdj = new List<Vertice>();
        public List<Aresta> Arestas = new List<Aresta>();
    }
}
