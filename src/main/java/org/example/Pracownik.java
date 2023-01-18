package org.example;

import java.sql.*;
import java.util.Scanner;

public class Pracownik {
    private Scanner scan;
    private Statement statement;
    private ResultSet resultSet;
    private Connection connection;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/rental";
    private static final String USER = "root";
    private static final String PASS = "D1@3lipa";
    Pracownik() {
        try {
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            statement = connection.createStatement();
            scan = new Scanner(System.in);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public String execute() throws SQLException {
        System.out.println("Wybierz co chcesz zrobić wpisując odpowiednią liczbę:\n");
        System.out.println("1 - Podgląd dostępnych aut");
        System.out.println("2 - Podgląd historii wypożyczeń");

        String choice = scan.nextLine();

        switch (choice) {
            case "1" :
                resultSet = statement.executeQuery("SELECT * FROM vehicles");
                while (resultSet.next()) {
                    for(int i = 1; i < 9; i++) {
                        System.out.println(resultSet.getString(i));
                    }
                    System.out.println("---------------------------------------");
                }
                break;
            case "2" :
                resultSet = statement.executeQuery("SELECT * FROM rentals");
                while (resultSet.next()) {
                    for(int i = 1; i < 9; i++) {
                        System.out.println(resultSet.getString(i));
                    }
                    System.out.println("---------------------------------------");
                }
                break;
            case "3" :
                System.out.println("Podaj:");
                System.out.print("numer rejest: ");
                String nr = scan.nextLine();
                System.out.print("kategoria: ");
                String cat = scan.nextLine();
                System.out.print("typ pojazdu: ");
                String typ = scan.nextLine();
                System.out.print("markę ");
                String marka = scan.nextLine();
                System.out.print("model: ");
                String model = scan.nextLine();
                System.out.print("kolor: ");
                String kolor = scan.nextLine();
                System.out.print("rok produkcji: ");
                String rok = scan.nextLine();
                System.out.print("pojemnosc silnika: ");
                String poj = scan.nextLine();

                String command = String.format("INSERT INTO vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES ('%s', '%s', '%s', '%s', '%s','%s', %s, '%s')",nr, cat, typ,marka, model, kolor, rok, poj);
                int result = statement.executeUpdate(command);
                if (result > 0) {
                    System.out.println("successfully inserted");
                }

                else {
                    System.out.println("unsucessful insertion ");
                }
                break;

            case "4" :
                System.out.println("Podaj:");
                System.out.print("imie: ");
                String imie = scan.nextLine();
                System.out.print("nazwisko: ");
                String naz = scan.nextLine();
                System.out.print("numer telefonu: ");
                String numer = scan.nextLine();
                System.out.print("pesel ");
                String pesel = scan.nextLine();
                System.out.print("data urodzenia: ");
                String data = scan.nextLine();
                System.out.print("ulica: ");
                String ulica = scan.nextLine();
                System.out.print("miasto: ");
                String miasto = scan.nextLine();
                System.out.print("kod pocztowy: ");
                String kod = scan.nextLine();
                System.out.print("nazwa firmy: ");
                String firma = scan.nextLine();
                System.out.print("NIP: ");
                String nip = scan.nextLine();

                int result2 = statement.executeUpdate(String.format("INSERT INTO clients(first_name,last_name,phone_number,pesel, birthday, street,  city, zip_code ,  company, NIP) VALUES ('%s', '%s', %s, '%s', '%s', '%s', '%s', '%s','%s', '%s')",imie, naz, numer, pesel, data, ulica, miasto, kod, firma, nip));
                if (result2 > 0) {
                System.out.println("successfully inserted");
            }
            else {
                System.out.println("unsucessful insertion ");
            }
                break;

            case "5" :
                System.out.println("Podaj:");
                System.out.print("imie: ");
                String imie1 = scan.nextLine();
                System.out.print("nazwisko: ");
                String naz1 = scan.nextLine();
                System.out.print("ulicę: ");
                String ulica1 = scan.nextLine();
                System.out.print("kod pocztowy: ");
                String kod1 = scan.nextLine();
                System.out.print("miasto: ");
                String miasto1 = scan.nextLine();
                System.out.print("numer telefonu: ");
                String numer1 = scan.nextLine();

                int result3 = statement.executeUpdate(String.format("INSERT INTO staff(firstName, lastName, street, city,zip_code, phone_number) VALUES ('%s', '%s', '%s', '%s', '%s', %s)",imie1, naz1, ulica1,miasto1,kod1, numer1));
                System.out.println();
                if (result3 > 0) {
                    System.out.println("successfully inserted");
                }

                else {
                    System.out.println("unsucessful insertion ");
                }
                break;

            case "6" :
                resultSet = statement.executeQuery("SELECT * FROM staff");

                while (resultSet.next()) {
                    for(int i = 1; i < 8; i++) {
                        System.out.println(resultSet.getString(i));
                    }
                    System.out.println("---------------------------------------");
                }

                System.out.println("Podaj id usuwanego pracownika");
                String id = scan.nextLine();
                statement.execute(String.format("DELETE FROM staff where id_staff = %s", id));
                break;

            case "7" :
                return "exit";
            default:
                System.out.println("Zły wybór.");
        }
        return " ";
    }
}

