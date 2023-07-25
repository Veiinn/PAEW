using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class polymerworld : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Habers",
                columns: table => new
                {
                    HaberId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    HaberBaslik = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    HaberIcerik = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    HaberResim = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    HaberTarih = table.Column<DateTime>(type: "datetime2", nullable: false),
                    YaziciId = table.Column<int>(type: "int", nullable: false),
                    KategoriId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Habers", x => x.HaberId);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Habers");
        }
    }
}
