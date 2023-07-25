using Bussiness.Abtrac;
using Bussiness.Concrete;
using DataAccess.Abtrac;
using DataAccess.Concrete;
using DataAccess.Context;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);



// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddCors(options =>
{
    options.AddPolicy("MyCorsPolicy", builder =>
    {
        builder.WithOrigins("https://localhost:44380/ButunHaberler")
               .AllowAnyMethod()
               .AllowAnyHeader();
    });
});

builder.Services.AddScoped<IHaberler, HaberRepository>();
builder.Services.AddScoped<IHaberService, HaberServices>();

builder.Services.AddScoped<IKullanici, KullaniciRepository>();
builder.Services.AddScoped<IKullaniciService, KullaniciServices>();

builder.Services.AddScoped<IKategoriHaber, KategoriHaberRepository>();
builder.Services.AddScoped<IKategoriHaberService, KategoriHaberServices>();

builder.Services.AddScoped<IKategoriFirma, KategoriFirmaRepository>();
builder.Services.AddScoped<IKategoriFirmaService, KategoriFirmaServices>();

builder.Services.AddDbContext<AppDbContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("PolymerWorld")));


var app = builder.Build();




// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(builder =>
       builder.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader());

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
