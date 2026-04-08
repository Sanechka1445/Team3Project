using System;
using System.Collections.Generic;

namespace Park.Model;

public partial class Visit
{
    public int Id { get; set; }

    public int Attraction { get; set; }

    public DateOnly? DateStart { get; set; }

    public DateOnly? DateEnd { get; set; }

    public decimal? Sum { get; set; }

    public decimal? IsCost { get; set; }

    public int Client { get; set; }
}
