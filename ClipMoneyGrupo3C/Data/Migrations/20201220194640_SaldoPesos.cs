using Microsoft.EntityFrameworkCore.Migrations;

namespace ClipMoneyGrupo3C.Data.Migrations
{
    public partial class SaldoPesos : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<double>(
                name: "SaldoPesos",
                table: "AspNetUsers",
                type: "float",
                nullable: false,
                defaultValue: 0.0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "SaldoPesos",
                table: "AspNetUsers");
        }
    }
}
