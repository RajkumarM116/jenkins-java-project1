// Version: 1.0.0

import javax.swing.*;
import java.awt.*;

public class AnimatedLogin extends JFrame {
    private int x = 0;
    private int direction = 1;
    private Image cartoonImage;

    public AnimatedLogin() {
        setSize(400, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        cartoonImage = new ImageIcon("path/to/your/image.png").getImage();
    }

    public void animate() {
        JPanel content = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                g.drawString("Welcome to Amazon Prime", x, 100);
                g.drawImage(cartoonImage, 50, 50, this);
            }
        };

        getContentPane().add(content);

        Timer timer = new Timer(10, e -> {
            x += direction;
            if (x > getWidth()) {
                direction = -1;
            } else if (x < 0) {
                direction = 1;
            }
            content.repaint();
        });
        timer.start();
    }

    public static void main(String[] args) {
        AnimatedLogin frame = new AnimatedLogin();
        frame.setVisible(true);
        frame.animate();
    }
}
