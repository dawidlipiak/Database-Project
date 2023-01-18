package org.example;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.Objects;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws FileNotFoundException, SQLException {
        File file;
        Scanner in;
        String value;
        Scanner scan = new Scanner(System.in);

        System.out.println("Witamy! W celu założenia nowego konta udaj się do najbliższego salonu.");
        System.out.print("Aby się zalogować podaj login: ");
        String login = scan.nextLine();
        System.out.print("Podaj hasło: ");
        String haslo = scan.nextLine();

        switch (login) {
            case "admin" -> {
                //sprawdzamy haslo
                file = new File("hasloAdmina.txt");
                in = new Scanner(file);
                String hasloAdmina = in.nextLine();
                String haslospr = String.valueOf(haslo.hashCode());

                Admin admin;
                if (haslospr.equals(hasloAdmina)) {
                    admin = new Admin();
                    value = admin.execute();

                    while (!value.equals("exit")){
                        value = admin.execute();
                    }

                } else {
                    System.out.println("Haslo niepoprawne, sprobuj ponownie.");
                }

            }
            case "klient" -> {
                //sprawdzamy haslo
                file = new File("hasloKlient.txt");
                in = new Scanner(file);
                String hasloKlienta = in.nextLine();
                String haslospr2 = String.valueOf(haslo.hashCode());

                Klient klient;
                if (haslospr2.equals(hasloKlienta)) {
                    klient = new Klient();
                    value = klient.execute();

                    while (!value.equals("exit")){
                        value = klient.execute();
                    }
                } else {
                    System.out.println("Haslo niepoprawne, sprobuj ponownie.");
                }
            }
            case "pracownik" -> {
                //sprawdzamy haslo
                file = new File("hasloPracownik.txt");
                in = new Scanner(file);
                String hasloPracownika = in.nextLine();
                String haslospr3 = String.valueOf(haslo.hashCode());

                Pracownik pracownik;
                if (haslospr3.equals(hasloPracownika)) {
                    pracownik = new Pracownik();
                    value = pracownik.execute();

                    while (!value.equals("exit")){
                        value = pracownik.execute();
                    }
                } else {
                    System.out.println("Haslo niepoprawne, sprobuj ponownie.");
                }
            }
        }
    }
}