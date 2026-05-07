defmodule ServidorJuego do
  def iniciar(capacidad) do
    IO.puts("""

    ==============================
       SERVIDOR DE JUEGO INICIADO
    ==============================
    Capacidad máxima: #{capacidad} jugadores
    Esperando conexiones...
    """)

    spawn(fn -> loop(capacidad, [], 0) end)
  end

  # estado: capacidad, cola_espera, jugadores_actuales
  defp loop(capacidad, cola, ocupados) do
    receive do
      {:conectar, pid} ->
        if ocupados < capacidad do
          send(pid, :ok)

          IO.puts("""
          --------------------------------
          JUGADOR CONECTADO
          PID: #{inspect(pid)}
          Estado: Entró a jugar
          Ocupados: #{ocupados + 1}/#{capacidad}
          --------------------------------
          """)

          loop(capacidad, cola, ocupados + 1)
        else
          IO.puts("""
          --------------------------------
          SERVIDOR LLENO
          PID: #{inspect(pid)}
          Estado: En cola de espera
          Jugadores en espera: #{length(cola) + 1}
          --------------------------------
          """)

          loop(capacidad, cola ++ [pid], ocupados)
        end

      {:desconectar, pid} ->
        IO.puts("""
        --------------------------------
        JUGADOR DESCONECTADO
        PID: #{inspect(pid)}
        Estado: Salió del servidor
        --------------------------------
        """)

        case cola do
          [siguiente | resto] ->
            send(siguiente, :ok)

            IO.puts("""
            --------------------------------
            NUEVO JUGADOR DESDE LA COLA
            PID: #{inspect(siguiente)}
            Estado: Ahora está jugando
            Jugadores restantes en espera: #{length(resto)}
            Ocupados: #{ocupados}/#{capacidad}
            --------------------------------
            """)

            loop(capacidad, resto, ocupados)

          [] ->
            IO.puts("""
            --------------------------------
            CUPO LIBERADO
            Ocupados: #{ocupados - 1}/#{capacidad}
            Cola de espera: vacía
            --------------------------------
            """)

            loop(capacidad, cola, ocupados - 1)
        end
    end
  end
end

defmodule Jugador do
  def iniciar(servidor, tiempo) do
    spawn(fn -> conectar(servidor, tiempo) end)
  end

  defp conectar(servidor, tiempo) do
    send(servidor, {:conectar, self()})

    receive do
      :ok ->
        IO.puts("""
        --------------------------------
        JUGADOR EN PARTIDA
        PID: #{inspect(self())}
        Tiempo de juego: #{tiempo / 1000} segundos
        --------------------------------
        """)

        Process.sleep(tiempo)
        send(servidor, {:desconectar, self()})
    end
  end
end

# ---------------------------
# Simulación
# ---------------------------

defmodule Simulacion do
  def iniciar do
    servidor = ServidorJuego.iniciar(4)

    # Crear 7 jugadores con tiempos distintos
    for i <- 1..7 do
      IO.puts("""
      --------------------------------
      CREANDO JUGADOR #{i}
      Tiempo asignado: #{(3000 + i * 500) / 1000} segundos
      --------------------------------
      """)

      Jugador.iniciar(servidor, 3000 + i * 500)
      Process.sleep(500)
    end
  end
end

# Ejecutar
Simulacion.iniciar()
