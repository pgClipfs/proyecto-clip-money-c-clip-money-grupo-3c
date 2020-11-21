import { NgModule } from '@angular/core';
import { IngresarDineroComponent } from './pages/ingresar-dinero/ingresar-dinero.component';
import { RouterModule } from '@angular/router';
import { RetirarDineroComponent } from './pages/retirar-dinero/retirar-dinero.component';



@NgModule({
  declarations: [IngresarDineroComponent, RetirarDineroComponent],
  imports: [
    RouterModule.forChild([
      { path: 'ingresar-dinero', component: IngresarDineroComponent}
    ])
  ]
})
export class OperatoriaPesosArgentinosModule { }
