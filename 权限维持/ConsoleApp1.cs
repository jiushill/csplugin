using System;
using System.Text;
using System.IO;
using TaskScheduler;
using System.Windows.Forms;
using System.Diagnostics;


namespace testschtasks
{
    class Program
    {
        static void Main(string[] args)
        {
            string taskname = args[0];
            string ostpath = args[1];

            TaskSchedulerClass ts = new TaskSchedulerClass();
            ts.Connect(null, null, null);
            ITaskFolder folder = ts.GetFolder("\\");

            IRegisteredTaskCollection alltask = folder.GetTasks(1);
            bool isexit = false;
            Console.WriteLine("已存在的计划任务------>");
            for (int i = 1; i < alltask.Count; i++)
            {
                Console.WriteLine(alltask[i].Name);
                if (alltask[i].Name.Equals(taskname))
                {
                    isexit = true;
                    Console.WriteLine($"[Find] 指定添加的计划任务已存在:{taskname}");
                    break;
                }
            }

            if (isexit == false)
            {
                ITaskDefinition task = ts.NewTask(0);
                task.RegistrationInfo.Description = taskname;
                ITimeTrigger triger = (ITimeTrigger)task.Triggers.Create(_TASK_TRIGGER_TYPE2.TASK_TRIGGER_TIME);
                triger.Repetition.Interval = "PT2M";
                triger.StartBoundary = DateTime.Now.ToString("yyy-MM-ddTHH:mm:ss");
                IExecAction action = (IExecAction)task.Actions.Create(_TASK_ACTION_TYPE.TASK_ACTION_EXEC);
                action.Path = ostpath;
                action.Arguments = "";
                IRegisteredTask regTask = folder.RegisterTaskDefinition(taskname, task, (int)_TASK_CREATION.TASK_CREATE, null, null, _TASK_LOGON_TYPE.TASK_LOGON_INTERACTIVE_TOKEN);
                IRunningTask runTask = regTask.Run(null);
                Console.WriteLine($"[+] 计划任务已添加:{taskname}");
            }


        }
    }
}
