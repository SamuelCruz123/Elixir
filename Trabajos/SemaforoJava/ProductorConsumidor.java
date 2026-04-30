package SemaforoJava;

import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.Semaphore;

public class ProductorConsumidor {

    public static void main(String[] args) {

        Buffer buffer = new Buffer(5);

        Thread productor = new Thread(new Productor(buffer));
        Thread consumidor = new Thread(new Consumidor(buffer));

        productor.start();
        consumidor.start();

        try {
            Thread.sleep(8000);

            productor.interrupt();
            consumidor.interrupt();

        } catch (InterruptedException e) {
            System.out.println("El hilo principal fue interrumpido.");
        }
    }
}




class Buffer {

    private Queue<Integer> cola = new LinkedList<>();
    private int capacidad;

    private Semaphore espaciosDisponibles;
    private Semaphore productosDisponibles;
    private Semaphore mutex;

    public Buffer(int capacidad) {
        this.capacidad = capacidad;

        espaciosDisponibles = new Semaphore(capacidad);
        productosDisponibles = new Semaphore(0);
        mutex = new Semaphore(1);
    }

    public void producir(int producto) throws InterruptedException {

        espaciosDisponibles.acquire();

        mutex.acquire();

        cola.add(producto);
        System.out.println("Productor produjo: " + producto);

        mutex.release();

        productosDisponibles.release();
    }

    public int consumir() throws InterruptedException {

        productosDisponibles.acquire();

        mutex.acquire();

        int producto = cola.remove();
        System.out.println("Consumidor consumió: " + producto);

        mutex.release();

        espaciosDisponibles.release();

        return producto;
    }
}

class Productor implements Runnable {

    private Buffer buffer;

    public Productor(Buffer buffer) {
        this.buffer = buffer;
    }

    @Override
    public void run() {
        int producto = 1;

        while (true) {
            try {
                buffer.producir(producto);
                producto++;

                Thread.sleep(1000);

            } catch (InterruptedException e) {
                System.out.println("Productor interrumpido.");
                break;
            }
        }
    }
}

class Consumidor implements Runnable {

    private Buffer buffer;

    public Consumidor(Buffer buffer) {
        this.buffer = buffer;
    }

    @Override
    public void run() {

        while (true) {
            try {
                buffer.consumir();

                Thread.sleep(1500);

            } catch (InterruptedException e) {
                System.out.println("Consumidor interrumpido.");
                break;
            }
        }
    }
}
