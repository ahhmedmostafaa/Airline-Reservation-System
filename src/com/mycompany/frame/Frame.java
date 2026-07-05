package com.mycompany.frame;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

public class Frame extends JFrame implements ActionListener {

    JButton b1 = new JButton("Login");
    JButton b2 = new JButton("Exit");
    JTextField t1 = new JTextField();
    JPasswordField t2 = new JPasswordField();
    JFrame f2 = new JFrame();
    JLabel label1 = new JLabel("Enter Username:");
    JLabel label2 = new JLabel("Enter your ID:");

    public Frame()
    {
        // image of background
        ImageIcon img = new ImageIcon("background.jpg");
        JLabel background = new JLabel(img);
        this.setLayout(null);
        background.setBounds(0, 0, 600, 400);
        this.add(background);

        // frame login = f1
        this.setTitle("Airline Application");
        this.setBounds(500, 100, 600, 400);
        this.setVisible(true);

        // frame App = f2
        f2.setTitle("Airline Application");
        f2.setBounds(500, 100, 600, 400);
        f2.setLayout(null);
        f2.setVisible(false);

        // button login
        b1.setBounds(100, 250, 150, 50);
        b1.setBackground(new Color(0, 153, 204));
        b1.setFont(new Font("Arial", Font.BOLD, 16));
        b1.setForeground(Color.WHITE);
        b1.addActionListener(this);
        background.add(b1);

        // button exit
        b2.setBounds(350, 250, 150, 50);
        b2.setBackground(new Color(255, 51, 51));
        b2.setFont(new Font("Arial", Font.BOLD, 16));
        b2.setForeground(Color.WHITE);
        b2.addActionListener(this);
        background.add(b2);

        // label 1
        label1.setBounds(100, 100, 150, 30);
        label1.setFont(new Font("Arial", Font.BOLD, 16));
        label1.setForeground(new Color(230, 250, 250));
        background.add(label1);

        // label 2
        label2.setBounds(100, 150, 150, 30);
        label2.setFont(new Font("Arial", Font.BOLD, 16));
        label2.setForeground(new Color(230, 250, 250));
        background.add(label2);

        // text field username
        t1.setText("");
        t1.setBounds(250, 100, 250, 30);
        background.add(t1);

        // text field ID
        t2.setText("");
        t2.setBounds(250, 150, 250, 30);
        background.add(t2);
    }

    public static void main(String[] args) {
        Frame f1 = new Frame();
    }

    @Override
    public void actionPerformed(ActionEvent e)
    {
        if (e.getSource() == b1)
        {
            // check if username and ID are correct
            String username = t1.getText();
            String id = new String(t2.getPassword());

            if (username.equals("admin") && id.equals("6723"))
            {
                // display success message and show the new frame
                JOptionPane.showMessageDialog(this, "Login Successful!");
                f2.setVisible(true);
                this.setVisible(false);
            }
            else
            {
                // display error message
                JOptionPane.showMessageDialog(this, "Username or ID is incorrect. Please try again.");
            }
        }
        else if (e.getSource() == b2)
        {
            System.exit(0);
        }
    }
}
