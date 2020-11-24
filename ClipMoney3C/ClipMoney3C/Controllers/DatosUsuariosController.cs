using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ClipMoney3C.Data;
using ClipMoney3C.Models;
using Microsoft.AspNetCore.Hosting;
using System.IO;

namespace ClipMoney3C.Controllers
{
    public class DatosUsuariosController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment env;

        public DatosUsuariosController(ApplicationDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            this.env = env;
        }

       // GET: DatosUsuarios
       // public async Task<IActionResult> Index()
       // {
       //     var applicationDbContext = _context.DatosUsuarios.Include(d => d.Usuario);
       //     return View(await applicationDbContext.ToListAsync());
       // }

        // GET: DatosUsuarios/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var datosUsuario = await _context.DatosUsuarios
                .Include(d => d.Usuario)
                .FirstOrDefaultAsync(m => m.Dni == id);
            if (datosUsuario == null)
            {
                return NotFound();
            }

            return Ok(datosUsuario);
        }

        // GET: DatosUsuarios/Create
        public IActionResult Create()
        {
            ViewData["UsuarioId"] = new SelectList(_context.Users, "Id", "Email");
            return View();
        }

        // POST: DatosUsuarios/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Dni,Nombre,Apellido,Direccion,Localidad,Provincia,Pais,Cp,DniFrente,DniDorso,UsuarioId")] DatosUsuario datosUsuario)
        {
            if (ModelState.IsValid)
            {
                var DniFotos = HttpContext.Request.Form.Files;
                if (DniFotos != null && DniFotos.Count > 0)
                {
                    var DniFrente = DniFotos[0];
                    var DniDorso = DniFotos[1];
                    var pathDestino = Path.Combine(env.WebRootPath, "images\\dni");
                    if (DniFrente.Length > 0 && DniDorso.Length > 0)
                    {
                        var DniFrenteDestino = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(DniFrente.FileName);
                        var DniDorsoDestino = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(DniFrente.FileName);

                        using (var filestreamFrente = new FileStream(Path.Combine(pathDestino, DniFrenteDestino), FileMode.Create))
                        {
                            DniFrente.CopyTo(filestreamFrente);
                            datosUsuario.DniFrente = DniFrenteDestino;
                        };
                        using (var filestreamDorso = new FileStream(Path.Combine(pathDestino, DniDorsoDestino), FileMode.Create))
                        {
                            DniFrente.CopyTo(filestreamDorso);
                            datosUsuario.DniDorso = DniDorsoDestino;
                        };

                    }
                }


                _context.Add(datosUsuario);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["UsuarioId"] = new SelectList(_context.Users, "Id", "Email", datosUsuario.UsuarioId);
            return Ok(datosUsuario);
        }

        // GET: DatosUsuarios/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var datosUsuario = await _context.DatosUsuarios.FindAsync(id);
            if (datosUsuario == null)
            {
                return NotFound();
            }
            ViewData["UsuarioId"] = new SelectList(_context.Users, "Id", "Email", datosUsuario.UsuarioId);
            return View(datosUsuario);
        }

        // POST: DatosUsuarios/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Dni,Nombre,Apellido,Direccion,Localidad,Provincia,Pais,Cp,DniFrente,DniDorso,UsuarioId")] DatosUsuario datosUsuario)
        {
            if (id != datosUsuario.Dni)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(datosUsuario);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DatosUsuarioExists(datosUsuario.Dni))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["UsuarioId"] = new SelectList(_context.Users, "Id", "Email", datosUsuario.UsuarioId);
            return View(datosUsuario);
        }

        // GET: DatosUsuarios/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var datosUsuario = await _context.DatosUsuarios
                .Include(d => d.Usuario)
                .FirstOrDefaultAsync(m => m.Dni == id);
            if (datosUsuario == null)
            {
                return NotFound();
            }

            return View(datosUsuario);
        }

        // POST: DatosUsuarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var datosUsuario = await _context.DatosUsuarios.FindAsync(id);
            _context.DatosUsuarios.Remove(datosUsuario);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool DatosUsuarioExists(int id)
        {
            return _context.DatosUsuarios.Any(e => e.Dni == id);
        }
    }
}
