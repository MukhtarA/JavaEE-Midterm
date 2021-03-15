package com.example.Midterm_JavaEE;

import java.sql.*;
import java.util.ArrayList;

public class ClientsDBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5430/clients", "m1", "qwerty");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Client> selectAllClients() {
        ArrayList<Client> clients = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM clients order by id")) {
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                clients.add(new Client(resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("surname"),
                        resultSet.getDate("birthday").toLocalDate(),
                        resultSet.getString("address"),
                        resultSet.getString("orderstatus")
                ));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return clients;
    }

    public static Client getClientById(int id) {
        Client client = new Client();
        String query = "SELECT * FROM clients WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
            return new Client(
                    id,
                    resultSet.getString("name"),
                    resultSet.getString("surname"),
                    resultSet.getDate("birthday").toLocalDate(),
                    resultSet.getString("address"),
                    resultSet.getString("orderstatus"));

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return client;
    }

    public static boolean addClient(Client client) {
        int row = 0;
        String sql = "insert into clients " +
                "(name, surname, birthday, address, t.orderstatus)" +
                " values (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, client.getName());
            statement.setString(2, client.getSurname());
            statement.setDate(3, Date.valueOf(client.getBirthday()));
            statement.setString(4, client.getAddress());
            statement.setString(5, client.getOrderstatus());

            row = statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return row > 0;
    }

    public static boolean saveClient(Client client) {
        int row = 0;
        String sql = "UPDATE clients set name = ?, surname = ?, birthday = ?," +
                "address = ?, orderstatus = ? where id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, client.getName());
            statement.setString(2, client.getSurname());
            statement.setDate(3, Date.valueOf(client.getBirthday()));
            statement.setString(4, client.getAddress());
            statement.setString(5, client.getOrderstatus());

            statement.setInt(6, (int) client.getId());

            row = statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return row > 0;
    }

    public static boolean deleteClient(int id) {
        int row = 0;
        String sql = "DELETE FROM clients where id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            row = statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return row > 0;
    }

    public static ArrayList<Client> findFilteredClient(String name, String surname,
                                                      String address, String orderstatus,
                                                      int fromIndex, int size) {
        ArrayList<Client> clients = new ArrayList<>(size);

        String query = "SELECT * FROM clients WHERE "
                + ("".equals(name) ? "" : "name = '" + name + "' and ")
                + ("".equals(surname) ? "" : "surname = '" + surname + "' and ")
                + ("".equals(address) ? "" : "address = '" + address + "' and ")
                + "t.orderstatus = '" + orderstatus + "' OFFSET " + fromIndex;

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                clients.add(new Client(resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("surname"),
                        resultSet.getDate("birthday").toLocalDate(),
                        resultSet.getString("address"),
                        resultSet.getString("orderstatus")));
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }

        return clients;
    }
}

