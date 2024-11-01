# health_app 🏥

### _Índice_

- _[Requisitos](#requisitos-️)_
- _[Ejecución](#ejecución-)_
  - _[Celular](#dispositivo-móvil-físico-)_
  - _[Emulador](#emulador-)_
  - _[Navegador](#navegador-web)_

Este proyecto se realizó con base en esta [guía](https://youtube.com/playlist?list=PL5oPNTwQiIK05OQ_nlKlU3ii6xXfo_xHx&si=kE3OmgoRpSLSuzu2), entre los cápitulos **FLUTTER_01** y **FLUTTER_05**

## Requisitos ⚒️

Se requiere de [Flutter](https://docs.flutter.dev/get-started/install), ya sea una extensión en IDE como Visual Studio Code, o instalando el SDK según el sistema operativo.

Luego de instalarlo se deben validar lo requisitos para trabajar correctamente, en una terminal, sea bash o powershell se debe ejecutar el comando

```bash
flutter doctor
```

## Ejecución 🛫

Al ser Flutter múltiplataforma se puede ejecutar de distintas formas.

### Dispositivo móvil físico 📱

Preferiblemente Android, teniendo activadas las opciones de desarrollador (la activación varía según la marca y el modelo del dispositivo); activando preferiblemente las opciones de `desbloqueo de OEM`, `depuración por USB` e `Instalar vía USB`.

Este debe estar conectado mediante un cable de transferencia de datos a la máquina donde se está realizando el desarrollo, como se mencionó en los [requisitos](#requisitos-️) se deben tener ciertas opciones activadas.

En el IDE, en este caso Visual Studio Code, se debe seleccionar el dispositivo donde se va a ejecutar, esto se selecciona desde la parte inferior derecha en la barra de estado:

![seleccion_dispositivo](imgs\image.png) → ![dispositivo_movil](imgs\image2.png)

### Emulador 🤖

Como alternativa se puede usar un Emulador **(NO RECOMENDADO)**, se debe tener en cuenta que esto puede poner la máquina lenta, puesto que los emuladores móviles consumen muchos recursos físicos.
Pero se puede hacer así:

![emulador](imgs\image4.png)

### Navegador web💻

Otra alternativa es desde el navegador, que deber ser un navegador basado en Chromium como **Chrome** o **Edge**

![navegadores](imgs\image3.png)
