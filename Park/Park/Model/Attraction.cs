using System;
using System.Collections.Generic;

namespace Park.Model;

public partial class Attraction
{
    public int IdAtraction { get; set; }

    public int Category { get; set; }

    public int? Status { get; set; }

    public decimal? Cost { get; set; }

    public string? Descriotion { get; set; }

    public string NameAtraction { get; set; } = null!;
}
