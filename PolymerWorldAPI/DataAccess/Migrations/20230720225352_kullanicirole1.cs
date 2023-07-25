using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class kullanicirole1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_KullaniciRoles_Kullanicis_KullaniciId",
                table: "KullaniciRoles");

            migrationBuilder.DropIndex(
                name: "IX_KullaniciRoles_KullaniciId",
                table: "KullaniciRoles");

            migrationBuilder.DropColumn(
                name: "KullaniciId",
                table: "KullaniciRoles");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "KullaniciId",
                table: "KullaniciRoles",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_KullaniciRoles_KullaniciId",
                table: "KullaniciRoles",
                column: "KullaniciId");

            migrationBuilder.AddForeignKey(
                name: "FK_KullaniciRoles_Kullanicis_KullaniciId",
                table: "KullaniciRoles",
                column: "KullaniciId",
                principalTable: "Kullanicis",
                principalColumn: "KullaniciId");
        }
    }
}
