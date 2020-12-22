import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class OperatoriaPesosService {

  constructor(private http: HttpClient) { }

  public getSaldo(): Observable<number> {
    return of(1000);
  }

  public cargarPesos(pesosACargar: number): Observable<number> {
    // cargar saldo y luego retornar el obtener saldo.
    return this.getSaldo();
  }

  public retirarPesos(pesosARetirar: number): Observable<number> {
    // retirar saldo y luego retornar el obtener saldo
    return this.getSaldo();
  }
}
