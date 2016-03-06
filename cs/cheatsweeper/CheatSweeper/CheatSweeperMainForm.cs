/*
This file is part of CheatSweeper.

CheatSweeper is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

CheatSweeper is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with CheatSweeper.  If not, see <http://www.gnu.org/licenses/>.
*/
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace CheatSweeper
{
    public partial class CheatSweeper : Form
    {
        int height = 0, width = 0;
        List<Label> mineLabels = new List<Label>();

        Process procMinesweeper;
        IntPtr _rgBlk = new IntPtr(0x1005340);
        IntPtr _xBoxMac = new IntPtr(0x01005334);
        IntPtr _yBoxMac = new IntPtr(0x01005338);
        byte[] _mineField;

        public CheatSweeper()
        {
            InitializeComponent();
        }

        private void BuildLabels()
        {
            int xLoc = 12, yLoc = 9;

            for (int y = 1; y <= this.height; y++)
            {
                for (int x = 1; x <= this.width; x++)
                {
                    Label lbl = new Label();
                    lbl.AutoSize = false;
                    lbl.BorderStyle = BorderStyle.FixedSingle;

                    var col = Color.White;

                    switch (this._mineField[(y * 32) + x])
                    {
                        case 0x8f:
                            col = Color.Red; //mine
                            break;
                        case 0x40: //cleared
                        case 0x41: //cleared, hint = 1
                        case 0x42: //cleared, hint = 2
                        case 0x43: //cleared, hint = 3
                        case 0x44: //cleared, hint = 4
                            col = Color.Gold;
                            break;
                        default:
                            col = Color.LimeGreen;
                            break;
                    }
                    lbl.BackColor = col;
                    lbl.Size = new Size(22, 22);
                    lbl.Location = new Point(xLoc, yLoc);
                    this.mineLabels.Add(lbl);
                    this.Controls.Add(lbl);
                    lbl.Show();
                    xLoc += 15;
                }

                xLoc = 12;
                yLoc += 15;
            }
        }

        private void CheatSweeperMainForm_DoubleClick(object sender, EventArgs e)
        {
            try
            {
                this.procMinesweeper = Process.GetProcesses().First(p => p.ProcessName == "winmine");//Process.GetProcessesByName("winmine")[0];
            }
            catch (InvalidOperationException ioe)
            {
                return;
            }

            uint bytesRead = 0;

            this.width = BitConverter.ToInt32(this.procMinesweeper.ReadProcessMemory(this._xBoxMac, 4, ref bytesRead), 0);
            this.height = BitConverter.ToInt32(this.procMinesweeper.ReadProcessMemory(this._yBoxMac, 4, ref bytesRead), 0);
            this._mineField = this.procMinesweeper.ReadProcessMemory(this._rgBlk, (uint)((height * 32) + (2 * width)), ref bytesRead);

            BuildLabels();
        }
    }

    public static class ProcessExtensions
    {
        [DllImport("kernel32.dll")]
        public static extern bool ReadProcessMemory(IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, uint nSize, ref uint lpNumberOfBytesRead);

        public static byte[] ReadProcessMemory(this Process p, IntPtr addr, uint size, ref uint bytes)
        {
            byte[] buffer = new byte[size];
            ReadProcessMemory(p.Handle, addr, buffer, size, ref bytes);
            return buffer;
        }
    }
}
