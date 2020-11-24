import { TestBed } from '@angular/core/testing';

import { OperatoriaPesosService } from './operatoria-pesos.service';

describe('OperatoriaPesosService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: OperatoriaPesosService = TestBed.get(OperatoriaPesosService);
    expect(service).toBeTruthy();
  });
});
