using System;
using System.Collections.Generic;

namespace Park.Model;

public partial class User
{
    public int IdUser { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? Patronymic { get; set; }

    public string Login { get; set; } = null!;

    public string Password { get; set; } = null!;

    public int Gender { get; set; }

    public string? PhoneNumber { get; set; }

    public bool Block { get; set; }

    public bool FirstAuth { get; set; }

    public int Role { get; set; }
}
