using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp1
{
    public class Grafo
    {
        public static List<Aresta> Arestas = new List<Aresta>();
        public static List<Vertice> vertices = new List<Vertice>();
        public static List<Aresta> ArestasArv = new List<Aresta>();
        public static List<Vertice> VerticesArv = new List<Vertice>();

        public static void MontarGrafo()
        {
            string[] lines = System.IO.File.ReadAllLines("Entrada.txt");

            int n = 0;
            int m = 0;

            for (int i = 0; i < lines.Length; i++)
            {
                if (i == 0)
                {
                    n = int.Parse(lines[i].Split(' ')[0]);
                    m = int.Parse(lines[i].Split(' ')[1]);

                    PreencherListaVertices(n, out vertices);
                }

                else if (i <= m)
                {
                    string[] split = lines[i].Split(' ');

                    Vertice v1 = vertices.Find(x => x.Id == Convert.ToInt32(split[0].ToString()));
                    Vertice v2 = vertices.Find(x => x.Id == Convert.ToInt32(split[1].ToString()));

                    //Adicionar para cada vértice o seu adjacente.
                    v1.VerticesAdj.Add(v2);
                    v2.VerticesAdj.Add(v1);
                }
            }

            int count = 1;

            for (int i = (m + 1); i < lines.Length; i++)
            {

                Vertice v1 = vertices.Find(x => x.Id == count);
                v1.Subconjunto = lines[i];

                count++;
            }

            PreencherListaArestas(vertices);
        }

        public static void PreencherListaVertices(int n, out List<Vertice> vertices)
        {
            vertices = new List<Vertice>();
            for (int i = 0; i < n; i++)
            {
                Vertice vertice = new Vertice();
                vertice.Id = i + 1;
                vertices.Add(vertice);
            }
        }

        public static void PreencherListaArestas(List<Vertice> vertices)
        {
            foreach (var vertice in vertices)
            {
                foreach (var verticeAdj in vertice.VerticesAdj)
                {
                    if (!PossuiAresta(vertice, verticeAdj))
                    {
                        CompCabeamento(vertice, verticeAdj);
                    }
                }
            }
        }


        public static void CompCabeamento(Vertice v1, Vertice v2)
        {
            int count = 0;
            int maior = int.MinValue;

            for (int i = 0; i <= 5; i++)
            {
                int a = v2.Subconjunto.IndexOf(v1.Subconjunto[i], i);
                if (a != -1)
                {
                    count++;
                }
            }

            Aresta aresta = new Aresta();
            aresta.v1 = v1;
            aresta.v2 = v2;
            aresta.Peso = MenorSubconjunto(v1.Subconjunto, v2.Subconjunto, 0, 0);

            v1.Arestas.Add(aresta);
            v2.Arestas.Add(aresta);
            Arestas.Add(aresta);
        }

        public static bool PossuiAresta(Vertice v1, Vertice v2)
        {
            if (v1.Arestas != null)
            {
                foreach (var item in v1.Arestas)
                {
                    if (item.v1 == v2 || item.v2 == v2)
                        return true;

                    //else
                    //    return false;
                }

                return false;
            }

            else
                return false;
        }

        public static void VerificarArestaMenorPeso(List<Vertice> vertices)
        {

        }

        public static int MenorSubconjunto(String sub1, String sub2, int index1, int index2)
        {
            int max = 0;
            if (index1 == sub1.Length)
            {
                //You have reached beyond A and thus no subsequence
                return 0;
            }
            if (index2 == sub2.Length)
            {   //you may reach end of 2nd string. LCS from that end is 0
                return 0;
            }

            for (int i = index1; i < sub1.Length; i++)
            {
                int exist = sub2.IndexOf(sub1[i], index2);
                if (exist != -1)
                {
                    //   found = true;

                    int temp = 1 + MenorSubconjunto(sub1, sub2, i + 1, exist + 1);
                    if (max < temp)
                    {
                        max = temp;
                    }


                }


            }
            return max;

        }

        public static int CriarArvore()
        {
            IniciarArvore();

            while (VerticesArv.Count < vertices.Count)
            {
                MenorPesoForaDaArvore();
            }

            return SomarPesoArestas();
        }



        public static void IniciarArvore()
        {
            Vertice vertice = vertices[0];
            vertice.VerticesAdj.Clear();

            VerticesArv.Add(vertice);

            Aresta arestaMenor = new Aresta();
            arestaMenor.Peso = int.MaxValue;

            foreach (var item in VerticesArv[0].Arestas)
            {
                if (item.Peso < arestaMenor.Peso)
                    arestaMenor = item;
            }

            ArestasArv.Add(arestaMenor);


            if (arestaMenor.v1 != null && arestaMenor.v2 != null)
            {
                if (!VerticesArv.Contains(arestaMenor.v1) && arestaMenor.v1 != null)
                    VerticesArv.Add(arestaMenor.v1);

                if (!VerticesArv.Contains(arestaMenor.v2) && arestaMenor.v2 != null)
                    VerticesArv.Add(arestaMenor.v2);

                //Vertice v1 = VerticesArv.Find(x => x.Id == arestaMenor.v1.Id);
                //Vertice v2 = VerticesArv.Find(x => x.Id == arestaMenor.v2.Id);

                ////Adicionar para cada vértice o seu adjacente.
                //v1.VerticesAdj.Add(v2);
                //v2.VerticesAdj.Add(v1);
            }
        }

        public static void MenorPesoForaDaArvore()
        {
            Aresta arestaMenor = new Aresta();
            arestaMenor.Peso = int.MaxValue;


            foreach (var vertice in VerticesArv)
            {
                foreach (var item in vertice.Arestas)
                {
                    if (!VerticesArv.Contains(item.v1) || !VerticesArv.Contains(item.v2))
                    {
                        if (!VerticesArv.Contains(item.v2))
                        {
                            if (item.Peso < arestaMenor.Peso)
                                arestaMenor = item;
                        }
                    }
                }
            }

            ArestasArv.Add(arestaMenor);


            if (arestaMenor.v1 != null && arestaMenor.v2 != null)
            {
                if (!VerticesArv.Contains(arestaMenor.v1) && arestaMenor.v1 != null)
                    VerticesArv.Add(arestaMenor.v1);

                if (!VerticesArv.Contains(arestaMenor.v2) && arestaMenor.v2 != null)
                    VerticesArv.Add(arestaMenor.v2);

                //Vertice v1 = VerticesArv.Find(x => x.Id == arestaMenor.v1.Id);
                //Vertice v2 = VerticesArv.Find(x => x.Id == arestaMenor.v2.Id);

                ////Adicionar para cada vértice o seu adjacente.
                //v1.VerticesAdj.Add(v2);
                //v2.VerticesAdj.Add(v1);
            }
        }

        public static int SomarPesoArestas()
        {
            int soma = 0;

            foreach (var item in ArestasArv)
            {
                soma += item.Peso;
            }

            return soma;
        }

        public static void VerificaFunc(ref int estagiario, ref int efetivo)
        {
            AjustarAdj();

            foreach (var item in VerticesArv)
            {
                foreach (var itemAdj in item.VerticesAdj)
                {
                    if (itemAdj.Funcionario == "Efetivo")
                    {
                        item.Funcionario = "Estagiario";
                        estagiario++;
                    }
                }

                if (item.Funcionario == string.Empty || item.Funcionario == null)
                {
                    item.Funcionario = "Efetivo";
                    efetivo++;
                }
            }
        }

        public static void AjustarAdj()
        {
            foreach (var item in VerticesArv)
            {
                item.VerticesAdj.Clear();
            }

            foreach (var item in ArestasArv)
            {
                Vertice v1 = VerticesArv.Find(x => x.Id == item.v1.Id);
                Vertice v2 = VerticesArv.Find(x => x.Id == item.v2.Id);

                //Adicionar para cada vértice o seu adjacente.
                v1.VerticesAdj.Add(v2);
                v2.VerticesAdj.Add(v1);
            }
        }
    }
}
