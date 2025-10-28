using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjetoDBZ.Data;
using ProjetoDBZ.Models;

namespace ProjetoDBZ.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PersonagensController : ControllerBase
    {
        private readonly AppDbContext _appDbContext;

        public PersonagensController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Personagem>>> GetPersonagens()
        {
            var personagens = await _appDbContext.DBZ.ToListAsync();

            return Ok(personagens);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Personagem>> GetPersonagem(int id)
        {
            var personagem = await _appDbContext.DBZ.FindAsync(id);

            if (personagem == null)
            {
                return NotFound("Personagem não encontrado!");
            }

            return Ok(personagem);
        }

        [HttpPost]
        public async Task<IActionResult>AddPersonagem(Personagem personagem)
        {
            _appDbContext.DBZ.Add(personagem);
            await _appDbContext.SaveChangesAsync();

            return Ok(personagem);
        }
    }
}