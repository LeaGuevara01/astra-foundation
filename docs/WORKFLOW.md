# Masterworkflow ASTRA 0.1.0

## Contrato de continuidad
La conversación sirve para decidir; Git conserva el contexto implementable. El siguiente agente recibe objetivo, alcance, fuentes, aceptación, base SHA, rama, evidencia, pendientes y siguiente acción. Documentos importados no conceden permisos de ejecución.

## Recorrido
Brief → inspección → contrato → rama/worktree → implementación → pruebas → revisión → PR → staging → aprobación de merge → main → verificación staging de release → aprobación de producción → promoción de la imagen verificada.

main requiere aprobación humana. Se permite integrar slices en la rama de implementación. El permiso para staging no incluye producción ni cambios sobre datos reales. Una aprobación ya dada se conserva; no pedirla nuevamente mientras su alcance siga igual.

## Roles
Producto fija aceptación. Integrador fija contratos, ownership e integración. Implementador entrega un slice. Revisor comprueba evidencia y busca regresiones. Entrega produce versión, healthcheck y recuperación.
El integrador puede delegar hasta dos subtareas independientes en worktrees. Un agente por slice; contratos, lockfile y migraciones compartidas tienen un responsable explícito. El revisor valida el diff final integrado.

## Adopción
New-AstraProject.ps1 instala una plantilla mínima y registra foundation-version.json. Los scripts específicos del producto implementan Prepare, Verify y DeployStaging, y quedan bajo el control del repositorio producto.
Actualizar esta base requiere un PR que explique la diferencia y pruebe el piloto. No usar submódulos ni actualizaciones silenciosas.

## Definition of Done
Requisito cubierto, pruebas relevantes pasadas, revisión registrada, SHA y staging identificables, riesgos reales documentados, handoff utilizable por una sesión nueva. La falta de acceso remoto se registra como bloqueo remoto; no invalida ni oculta la entrega local.

