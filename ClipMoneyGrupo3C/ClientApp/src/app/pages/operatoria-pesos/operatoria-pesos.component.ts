import { Component, OnInit } from '@angular/core';
import { OperatoriaPesosService } from '../../services/operatoria-pesos.service';

@Component({
  selector: 'app-operatoria-pesos',
  templateUrl: './operatoria-pesos.component.html',
  styleUrls: ['./operatoria-pesos.component.css']
})
export class OperatoriaPesosComponent implements OnInit {

  saldo: number;

  constructor(private operatoriaPesosService: OperatoriaPesosService) { }

  ngOnInit() {
    this.operatoriaPesosService.getSaldo().subscribe(saldo => this.saldo = saldo);
  }

  cargarSaldo(saldoACargar: number) {
    this.operatoriaPesosService.cargarSaldo(saldoACargar).subscribe(
      res => console.log('saldo cargado!')
    );
  }

}
