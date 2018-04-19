/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.medico.dao;

import br.ufscar.dc.medico.bean.Consulta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author 496227
 */
public class ConsultaDAO {
    private final static String CRIAR_CONSULTA_SQL = "insert into Consulta"
            + " (cpfPaciente, crmMedico, dataConsulta)"
            + " values (?,?,?)";

    private final static String BUSCAR_CONSULTA_SQL = "select"
            + " cpfPaciente, crmMedico, dataConsulta"
            + " from Consulta"
            + " where id=?";
    
    DataSource dataSource;
    
    public ConsultaDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    public Consulta gravarConsulta(Consulta c) throws SQLException, NamingException {
        try (Connection con = dataSource.getConnection();
            PreparedStatement ps = con.prepareStatement(CRIAR_CONSULTA_SQL, Statement.RETURN_GENERATED_KEYS);) {
            ps.setString(1, c.getCpfPaciente());
            ps.setString(2, c.getCrmMedico());
            ps.setDate(3, new java.sql.Date(c.getDataConsulta().getTime()));
            ps.execute();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                rs.next();
                c.setId(rs.getInt(1));
            }
        }
        return c;
    }

    public Consulta buscarConsulta(int id) throws SQLException, NamingException {
        try (Connection con = dataSource.getConnection();
                PreparedStatement ps = con.prepareStatement(BUSCAR_CONSULTA_SQL)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                rs.next();
                Consulta c = new Consulta();
                c.setId(rs.getInt("id"));
                c.setCpfPaciente(rs.getString("cpfPaciente"));
                c.setCrmMedico(rs.getString("crmMedico"));
                c.setDataConsulta(new Date(rs.getDate("dataDeNascimento").getTime()));
                return c;
            }
        }
    }
    
}
