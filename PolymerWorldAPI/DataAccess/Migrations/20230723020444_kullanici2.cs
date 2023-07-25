using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class kullanici2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Kullanicis_KullaniciRoles_KullaniciRoleRoleId",
                table: "Kullanicis");

            migrationBuilder.DropIndex(
                name: "IX_Kullanicis_KullaniciRoleRoleId",
                table: "Kullanicis");

            migrationBuilder.RenameColumn(
                name: "KullaniciRoleRoleId",
                table: "Kullanicis",
                newName: "KullaniciRol");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "KullaniciRol",
                table: "Kullanicis",
                newName: "KullaniciRoleRoleId");

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
    }
}
