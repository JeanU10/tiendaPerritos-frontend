# Tienda de Alimentos para Perritos 🐾 - Frontend

Este repositorio contiene la interfaz de usuario (Frontend) para la aplicación de la **Tienda de Alimentos para Perritos**. Es una aplicación web interactiva que permite a los usuarios gestionar el catálogo de productos de alimentos mediante operaciones CRUD (Crear, Leer, Actualizar, Eliminar).

## 🚀 Tecnologías Utilizadas

- **HTML5**: Estructura semántica de la página.
- **CSS3 (Vanilla)**: Diseño moderno, responsivo y dinámico con soporte de modo oscuro y variables CSS.
- **JavaScript (ES6+)**: Lógica del cliente, llamadas asíncronas a la API del Backend (Fetch API) y manipulación interactiva del DOM.
- **Nginx**: Servidor web utilizado para servir los archivos estáticos en el contenedor Docker.
- **Docker**: Contenedorización de la interfaz web.

## 📁 Estructura del Proyecto

- `frontend/`: Archivos web del proyecto.
  - `index.html`: Estructura y estilos CSS integrados para mayor rapidez de carga.
  - `app.js`: Lógica de integración con la API REST del backend.
  - `default.conf`: Configuración del servidor Nginx.
  - `Dockerfile`: Configuración de la imagen Docker basada en `nginx:alpine`.
- `.github/workflows/frontend-deploy.yml`: Workflow de GitHub Actions para compilar y desplegar la interfaz en AWS ECS Fargate.
- `.aws/`: Configuración y Task Definitions para el despliegue del frontend en AWS.

## 🛠️ Cómo Ejecutar Localmente

### Requisitos Previos

- Un navegador web moderno.
- Opcionalmente, Docker si deseas ejecutarlo de la misma manera que en producción.

### Pasos para iniciar el Frontend

1. Si deseas ejecutarlo de manera directa, solo abre el archivo `frontend/index.html` en tu navegador.
2. Si prefieres levantarlo en un servidor web local sencillo (por ejemplo, usando VS Code Live Server).
3. Asegúrate de configurar la URL de la API del backend en `frontend/app.js` (variable `API_URL`).

## 🐳 Ejecución con Docker

Puedes compilar la imagen de Nginx con la aplicación:

```bash
docker build -t tienda-frontend ./frontend
```

Y ejecutar el contenedor en el puerto `80` (o el puerto de tu preferencia):

```bash
docker run -d -p 8080:80 --name tienda-frontend-container tienda-frontend
```

## ⚙️ Integración Continua (GitHub Actions)

El repositorio cuenta con un flujo CI/CD definido en `.github/workflows/frontend-deploy.yml` que:
1. Se activa al realizar un `push` en la rama `main`.
2. Compila la imagen Docker del frontend con Nginx.
3. Sube la imagen a **Amazon ECR**.
4. Despliega la nueva versión en el servicio del frontend dentro de **Amazon ECS Fargate** (`tienda-perritos-cluster`).
