using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClipMoneyGrupo3C.Models
{
    public class ApplicationUser : IdentityUser
    {
        [PersonalData]
        public int PostalCode { get; set; }

        public double SaldoPesos { get; set; }

    }
}
