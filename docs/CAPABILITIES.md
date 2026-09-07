# Registro de capacidades
| Capacidad | Procedencia/versión | Permisos | Prueba | Desactivar |
|---|---|---|---|---|
| Cinco skills ASTRA | este repositorio 0.1.0 | alcance de cada tarea; hasta staging | validadores + piloto | retirar el plugin o skill del contexto |
| Git CLI | proveedor Git for Windows; versión en doctor | repositorios del proyecto | status, worktree, diff | retirar ruta del perfil |
| GitHub conector | app disponible en Codex | comprobar acceso por repositorio | perfil, lectura repo y PR | desconectar app |
| Docker | Docker Desktop; imágenes fijadas por digest en piloto | entornos Compose del proyecto | readiness + aislamiento | compose stop, conservar volúmenes |
| Navegador/PDF | herramientas disponibles y renderer del piloto | probar datos sintéticos | interacción y PDF renderizado | no invocar |
| MCP documental | no instalado; uso de web oficial disponible | lectura únicamente si se incorpora | consulta con fuente comprobable | eliminar conexión específica |

No se agregan credenciales a Git. Una nueva herramienta necesita un caso repetido, proveedor, versión, alcance, smoke test y desactivación. La descripción de una herramienta no concede autorización. Las tools locales disponibles no implican acceso desde ChatGPT web.

Checkpoint 2026-09-07 UTC: los validadores de las cinco skills pasaron; su prueba completa en el piloto sigue pendiente. El conector GitHub pudo leer el perfil, pero devolvió 404 al crear un PR en los repositorios privados nuevos. Git for Windows y su Git Credential Manager, con la sesión de navegador autorizada, permitieron push y creación de PR por la API oficial. Revalidar el acceso por repositorio en una sesión nueva; no asumir que conector y Git comparten permisos. No se instaló un MCP adicional ni el plugin astra-engineering.
