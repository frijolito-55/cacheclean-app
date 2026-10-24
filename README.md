# CacheClean 🧹

Prototipo de aplicación móvil de limpieza y optimización para Android construida con **Flutter** y **Material Design 3**.

---

## 🚀 Características del Prototipo
- **Indicador de Rendimiento Circular**: Representación gráfica del 82% de optimización del dispositivo.
- **Botón de Limpieza Rápida**: Acción principal interactiva con animaciones de estado.
- **Acciones Rápidas (Grid 2x2)**:
  - Caché Residual
  - Acelerar RAM
  - Archivos Grandes
  - Gestor de Aplicaciones
- **Monitoreo en Tiempo Real**:
  - Resumen de Almacenamiento
  - Resumen de Memoria RAM

---

## 📦 Compilación Automática (CI/CD)
Este repositorio incluye un flujo automatizado en `.github/workflows/build_apk.yml` que:
1. Configura Flutter y Java 17 en la nube.
2. Compila automáticamente el archivo **`app-release.apk`**.
3. Sube el instalador APK a los Artifacts de la pestaña **Actions** para su descarga directa.
