﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using OM;
using OMControls;

namespace Yadi.Master
{
    public partial class CustomerType : Form
    {
        CommonFunctions ObjFunction = new CommonFunctions();
        DBMCustomerType dbCustomerType = new DBMCustomerType();
        public static long RequestCustomerTypeNo;

        public CustomerType()
        {
            InitializeComponent();
        }

        private void CustomerType_Load(object sender, EventArgs e)
        {
            
            CmbSearch.Items.Add(new Item("-----Select-----", "0"));
            CmbSearch.Items.Add(new Item("CustomerType Name", "CustomerTypeName"));
          
            CmbSearch.SelectedIndex = 1;
            BindGrid();
            TxtSearch.Focus();
        }

        private void BindGrid()
        {
            try
            {
                DataView dv = new DataView();
                Item itm = (Item)CmbSearch.SelectedItem;
                dv = dbCustomerType.GetBySearch(itm.Value, TxtSearch.Text);
                DataGridView1.DataSource = dv;
                DataGridView1.Columns[0].Visible = false;
                DataGridView1.Columns[1].Width = 545;
                DataGridView1.Columns[2].Width = 103;
                
            }
            catch (Exception exc)
            {
                ObjFunction.ExceptionDisplay(exc.Message);
            }
        }

        private void BtnSearch_Click(object sender, EventArgs e)
        {
            if (TxtSearch.Text != "" && CmbSearch.SelectedIndex != 0)
            {
                BindGrid();
            }
            else if (CmbSearch.SelectedIndex != 0)
            {
                BindGrid();
            }
            else
            {
                DataGridView1.DataSource = null;
            }
        }

        private void btnShowAll_Click(object sender, EventArgs e)
        {
            CmbSearch.SelectedIndex = 0;
            TxtSearch.Text = "";
            BindGrid();
            if (DataGridView1.Rows.Count > 0)
            {
                DataGridView1.Focus();
                DataGridView1.CurrentCell = DataGridView1[1, 0];
            }
        }

        private void TxtSearch_TextChanged(object sender, EventArgs e)
        {
            BtnSearch_Click(sender, e);
        }

        private void TxtSearch_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Down)
            {
                if (DataGridView1.Rows.Count > 0)
                {
                    DataGridView1.Focus();
                    DataGridView1.CurrentCell = DataGridView1[1, 0];
                }
            }
        }

        private void DataGridView1_KeyDown(object sender, KeyEventArgs e)
        {
            if (DataGridView1.CurrentCell.RowIndex >= 0 && e.KeyCode == Keys.Enter)
            {
                DataGridView1_CellContentClick(sender, new DataGridViewCellEventArgs(DataGridView1.CurrentCell.ColumnIndex, DataGridView1.CurrentCell.RowIndex));
            }
        }

        private void DataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            RequestCustomerTypeNo = Convert.ToInt32(DataGridView1.SelectedRows[0].Cells[0].Value);
            Form NewF = new CustomerTypeAE();
            this.Close();
            ObjFunction.OpenForm(NewF, DBGetVal.MainForm);
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            RequestCustomerTypeNo = 0;
            Form NewF = new CustomerTypeAE();
            this.Close();
            ObjFunction.OpenForm(NewF, DBGetVal.MainForm);
        }

        private void DataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if(e.ColumnIndex == 2)
            {
                ObjFunction.SetGridStatus(e);
            }
        }

        private void CmbSearch_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                TxtSearch.Text = "";
            }
        }
    }
}
