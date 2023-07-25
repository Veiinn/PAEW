using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class kullanicirole : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "HaberGorunum",
                table: "Habers",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "KullaniciRoles",
                columns: table => new
                {
                    RoleId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleAd = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    RoleDurum = table.Column<bool>(type: "bit", nullable: false),
                    KullaniciId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_KullaniciRoles", x => x.RoleId);
                    table.ForeignKey(
                        name: "FK_KullaniciRoles_Kullanicis_KullaniciId",
                        column: x => x.KullaniciId,
                        principalTable: "Kullanicis",
                        principalColumn: "KullaniciId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_KullaniciRoles_KullaniciId",
                table: "KullaniciRoles",
                column: "KullaniciId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "KullaniciRoles");

            migrationBuilder.DropColumn(
                name: "HaberGorunum",
                table: "Habers");
        }
    }
}
