﻿using Depozit.Domain.Models;
using Depozit.Infrastructure.Interfaces;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Depozit.Infrastructure
{
    public class IntrareRepository : IIntrare
    {
        public List<Intrare> GetIntrari(string ConnectionString)
        {
            List<Intrare> intrari = new List<Intrare>();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = "SELECT intrari_input.id AS id, produse.name AS productName, Parteneri.name AS partnerName, dateReceived, quantity" +
                  
                   " FROM intrari_input INNER JOIN produse ON productId = produse.id INNER JOIN Parteneri ON providerId = Parteneri.id";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);   
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader != null)
                {
                    while ( reader.Read()) // de la models
                    {
                        Intrare i = new Intrare();
                        i.Id = int.Parse(reader["id"].ToString());
                        i.PartnerName = reader["partnerName"].ToString();
                        i.ProductName = reader["productName"].ToString();
                        i.Data = reader.GetDateTime(3);
                        i.Quantity = reader["quantity"].ToString();

                        intrari.Add(i);

                    }
                }
            }
            return intrari; 
        }
        public Intrare GetIntrare(string ConnectionString, int Id)
        {
            string query = "SELECT intrari_input.id AS id, produse.name AS productName, Parteneri.name AS partnerName, quantity, dateReceived" +
                   " FROM intrari_input INNER JOIN produse ON productId = produse.id INNER JOIN Parteneri ON providerId = Parteneri.id" +
                   " WHERE intrari_input.id = " + Id;
            Intrare i = new Intrare();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader != null)
                {
                    reader.Read();
                    i.Id = int.Parse(reader["id"].ToString());
                    i.PartnerName = reader["partnerName"].ToString();
                    i.ProductName = reader["productName"].ToString();
                    i.Data = reader.GetDateTime(4);
                    i.Quantity = reader["quantity"].ToString();

                }
            }
            return i;
        }
        public void CreateIntrare(string ConnectionString, string ProductName, string PartnerName, int Qty)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                string query = "";
                SqlCommand cmd = new SqlCommand("CreateIntrare", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@productName", ProductName));
                cmd.Parameters.Add(new SqlParameter("@partnerName", PartnerName));
                cmd.Parameters.Add(new SqlParameter("@qty", Qty));
                cmd.ExecuteNonQuery();

            }

        }
        public void UpdateIntrare(string ConnectionString, int Id, string ProductName, string PartnerName, int Qty)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString)) 
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UpdateIntrare", con);
                cmd.CommandType= System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@idIntrare", Id));
                cmd.Parameters.Add(new SqlParameter("@productName", ProductName));
                cmd.Parameters.Add(new SqlParameter("@partnerName", PartnerName));
                cmd.Parameters.Add(new SqlParameter("@qty", Qty));
                cmd.ExecuteNonQuery();

            }
        }
        public void DeleteIntrare(string ConnectionString, int Id)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DeleteIntrare", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@idIntrare", Id));
                cmd.ExecuteNonQuery();
            }
        }
    }
}