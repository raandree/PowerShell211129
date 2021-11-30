$code = @'
namespace My
{
    public class Person
    {
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public int Age { get; set; }

        public override string ToString()
        {
            return string.Format("{0} {1}", Lastname, Firstname);
        }

        public override bool Equals(object obj)
        {
            var person = obj as Person;

            if (person == null)
                return false;

            return person.Firstname == Firstname && person.Lastname == Lastname;
        }

        public override int GetHashCode()
        {
            return Firstname.GetHashCode() ^ Lastname.GetHashCode() ^ Age.GetHashCode();
        }
    }
}
'@

Add-Type -TypeDefinition $code
Add-Type -Path c:\somecode.cs
Add-Type -Path 'C:\Program Files\WindowsPowerShell\Modules\NTFSSecurity\4.2.6\Security2.dll'
[Security2.]

$p1 = [My.Person]::new()
$p1.Firstname = 'Hans'
$p1.Lastname = 'Dampf'
$p1.Age = 50

$p2 = [My.Person]::new()
$p2.Firstname = 'Hans'
$p2.Lastname = 'Dampf'
$p1.Age = 45

$p3 = [My.Person]::new()
$p3.Firstname = 'Sven'
$p3.Lastname = 'Dampf'
$p1.Age = 30

$p1 -eq $p2
$p1 -eq $p3

$p1.GetHashCode()
$p2.GetHashCode()
$p3.GetHashCode()
