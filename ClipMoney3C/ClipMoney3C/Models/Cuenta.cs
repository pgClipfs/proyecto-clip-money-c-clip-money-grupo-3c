﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClipMoney3C.Models
{
    public class Cuenta
    {
        public long ID { get; set; }
        public string OwnerId { get; set; }
        public double Saldo { get; set; }

    }
}