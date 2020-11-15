using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ClipMoneyGrupo3C.Models;

namespace ClipMoneyGrupo3C.Controllers
{
    public class PasswordsController : Controller
    {
        private clipMoneyEntities db = new clipMoneyEntities();

        // GET: Passwords
        public ActionResult Index()
        {
            var passwords = db.passwords.Include(p => p.usuario);
            return View(passwords.ToList());
        }

        // GET: Passwords/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            password password = db.passwords.Find(id);
            if (password == null)
            {
                return HttpNotFound();
            }
            return View(password);
        }

        // GET: Passwords/Create
        public ActionResult Create()
        {
            ViewBag.usuarioId = new SelectList(db.usuarios, "dni", "nombre");
            return View();
        }

        // POST: Passwords/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,usuarioId,valor,fecha")] password password)
        {
            if (ModelState.IsValid)
            {
                db.passwords.Add(password);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.usuarioId = new SelectList(db.usuarios, "dni", "nombre", password.usuarioId);
            return View(password);
        }

        // GET: Passwords/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            password password = db.passwords.Find(id);
            if (password == null)
            {
                return HttpNotFound();
            }
            ViewBag.usuarioId = new SelectList(db.usuarios, "dni", "nombre", password.usuarioId);
            return View(password);
        }

        // POST: Passwords/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,usuarioId,valor,fecha")] password password)
        {
            if (ModelState.IsValid)
            {
                db.Entry(password).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.usuarioId = new SelectList(db.usuarios, "dni", "nombre", password.usuarioId);
            return View(password);
        }

        // GET: Passwords/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            password password = db.passwords.Find(id);
            if (password == null)
            {
                return HttpNotFound();
            }
            return View(password);
        }

        // POST: Passwords/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            password password = db.passwords.Find(id);
            db.passwords.Remove(password);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
