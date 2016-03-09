public string MyRevers(string input)
{
    string myoutputString = " ";
    # string to parse
    #         const string input = "(1+2)<=(3/45)";
    #        const string input = "2+3*4";
    #         const string input = "(D_1 >= 0.34) && (D2 <7.5) + A*568 || xyz";
    #         string input = Console.ReadLine();
    #----------------------------
    #checking for brackets())
    int sL = 0;
    int sW = 0;
    int i = 0;
 
    for (i = 0; i < input.Length; i++)
    {
        if (input[i] == '(')
			{
				sL = sL + 1;
			}
        if (input[i] == ')')
			{
				sW = sW + 1;
			}
    }
    if (sL != sW)
    {
        # Console.WriteLine(" Error");
        MessageBox.Show("Input error");
        return " ";
 
    }
    #------------------------
 
  
    #Get a string array with individual elements of expression
    Regex rx = new Regex(@"\(|\)|\+|\-|\*|\/|<=?|>=?|!=|=|&&|\|\||([a-zA-z][a-zA-z0-9_]*)|(\d+\.?\d*)");
    # split into tokens
    MatchCollection mc = rx.Matches(input);
 
    Regex id = new Regex(@"[a-zA-z][a-zA-z0-9_]*"); # идентификаторы
    Regex num = new Regex(@"\d+\.?\d*"); # числа целые и дробные
    Regex skobki = new Regex(@"\(|\)"); # скобки
    string[] operators = { "(", ")", "*", "/", "+", "-", "<", ">", "<=", ">=", "==", "!=", "&&", "||" }; # операторы по приоритету
 
    Regex opers = new Regex(@"\(|\)|\+|\-|\*|\/|<=?|>=?|!=|=|&&|\|\|"); # операторы
 
    Stack stOper = new Stack();
    ArrayList expr = new ArrayList();
    foreach (Match m in mc)
    {
        Match m1;
        m1 = id.Match(m.Value);
        if (m1.Success) { expr.Add(m1.Value); continue; }
        m1 = num.Match(m.Value);
        if (m1.Success) { expr.Add(m1.Value); continue; }
        m1 = skobki.Match(m.Value);
        if (m1.Success)
        {
            if (m1.Value == "(") { stOper.Push(m1.Value); continue; }
            string op = stOper.Pop().ToString();
            while (op != "(")
            {
                expr.Add(op);
                op = stOper.Pop().ToString();
            }
            continue;
        }
        m1 = opers.Match(m.Value);
        if (m1.Success)
        {
            try
            {
                while (Array.IndexOf(operators, m1.Value) > Array.IndexOf(operators, stOper.Peek()))
                {
                    if (stOper.Peek().ToString() == "(") break;
                    expr.Add(stOper.Pop().ToString());
                }
            }
            catch (System.Exception ex)
            {
                # stack empty
            }
            stOper.Push(m1.Value);
        }
    }
    while (stOper.Count != 0)
    {
        expr.Add(stOper.Pop().ToString());
    }
 
    foreach (string s in expr)
		{
 
			myoutputString += s + " ";
		}
		return myoutputString;
}