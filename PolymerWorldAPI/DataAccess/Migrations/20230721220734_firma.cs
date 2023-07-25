using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class firma : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "KullaniciRole",
                table: "Kullanicis",
                newName: "KullaniciRoleRoleId");

            migrationBuilder.CreateTable(
                name: "FirmaKategoris",
                columns: table => new
                {
                    KategoriId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    KategoriAd = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KategoriDurum = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FirmaKategoris", x => x.KategoriId);
                });

            migrationBuilder.CreateTable(
                name: "Firmas",
                columns: table => new
                {
                    FirmaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirmaIsim = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FirmaOzet = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FirmaEposta = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FirmaTelefon = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FirmaResim = table.Column<byte[]>(type: "varbinary(max)", nullable: false),
                    FirmaPuan = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FirmaKategori = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Firmas", x => x.FirmaId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Kullanicis_KullaniciRoleRoleId",
                table: "Kullanicis",
                column: "KullaniciRoleRoleId");

            migrationBuilder.AddForeignKey(
                name: "FK_Kullanicis_KullaniciRoles_KullaniciRoleRoleId",
                table: "Kullanicis",
                column: "KullaniciRoleRoleId",
                principalTable: "KullaniciRoles",
                principalColumn: "RoleId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Kullanicis_KullaniciRoles_KullaniciRoleRoleId",
                table: "Kullanicis");

            migrationBuilder.DropTable(
                name: "FirmaKategoris");

            migrationBuilder.DropTable(
                name: "Firmas");

            migrationBuilder.DropIndex(
                name: "IX_Kullanicis_KullaniciRoleRoleId",
                table: "Kullanicis");

            migrationBuilder.RenameColumn(
                name: "KullaniciRoleRoleId",
                table: "Kullanicis",
                newName: "KullaniciRole");
        }
    }
}
