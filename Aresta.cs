using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp1
{
    public class Aresta
    {
        public int Id { get; set; }
        public Vertice v1 { get; set; }
        public Vertice v2 { get; set; }
        public int Peso { get; set; }
    }
}
