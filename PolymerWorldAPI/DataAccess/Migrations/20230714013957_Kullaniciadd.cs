using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class Kullaniciadd : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "YaziciId",
                table: "Habers",
                newName: "KullaniciId");

            migrationBuilder.AddColumn<bool>(
                name: "HaberDurum",
                table: "Habers",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.CreateTable(
                name: "HaberKategoris",
                columns: table => new
                {
                    KategoriId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    KategoriAd = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KategoriDurum = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HaberKategoris", x => x.KategoriId);
                });

            migrationBuilder.CreateTable(
                name: "Kullanicis",
                columns: table => new
                {
                    KullaniciId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    KullaniciAd = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KullaniciSifre = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KullaniciEposta = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KullaniciTelefon = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KullaniciBaglantı = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    KullaniciResim = table.Column<byte[]>(type: "varbinary(max)", nullable: false),
                    KullaniciDurum = table.Column<bool>(type: "bit", nullable: false),
                    KullaniciRole = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Kullanicis", x => x.KullaniciId);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "HaberKategoris");

            migrationBuilder.DropTable(
                name: "Kullanicis");

            migrationBuilder.DropColumn(
                name: "HaberDurum",
                table: "Habers");

            migrationBuilder.RenameColumn(
                name: "KullaniciId",
                table: "Habers",
                newName: "YaziciId");
        }
    }
}
